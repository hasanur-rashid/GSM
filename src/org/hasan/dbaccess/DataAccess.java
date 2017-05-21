package org.hasan.dbaccess;

import org.hasan.model.CompanyInformation;
import org.hasan.model.ProductInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ENVY on 4/27/2017.
 */
@Repository
public class DataAccess {
    private JdbcTemplate jdbcTemplate;
    private SimpleJdbcCall procQuantityUp;
    private SimpleJdbcCall procQuantityDown;
    private SimpleJdbcCall procUpdatePercentage;
    private SimpleJdbcCall funcGetCustomerId;

    @Autowired
    public void setDataSource(DataSource dataSource)
    {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.jdbcTemplate.setResultsMapCaseInsensitive(true);
        this.procQuantityUp = new SimpleJdbcCall(dataSource).withProcedureName("QUANTITY_UP_IN_PRODUCT");
        this.procQuantityDown = new SimpleJdbcCall(dataSource).withProcedureName("QUANTITY_DOWN_IN_PRODUCT");
        this.procUpdatePercentage = new SimpleJdbcCall(dataSource).withProcedureName("UPDATE_PUR_PCT");
        this.funcGetCustomerId = new SimpleJdbcCall(dataSource).withFunctionName("GET_CUID");
    }

    public int isUser( String usrName, Long passWd )
    {
        return this.jdbcTemplate.queryForObject
        (
            "select count(*) from employee where name = ? and emid = ?",
            Integer.class,
            new Object[]{usrName,passWd}
        );
    }

    public int isCompany( Long cmid )
    {
        return this.jdbcTemplate.queryForObject
        (
                "select count(*) from company where cmid = ?",
                Integer.class,
                new Object[]{cmid}
        );
    }

    public int isRep( Long rid, Long cmid )
    {
        return this.jdbcTemplate.queryForObject
        (
                "select count(*) from representative where rid = ? and cmid = ?",
                Integer.class,
                new Object[]{rid,cmid}
        );
    }

    public String getDesignation( Long passWd )
    {
        return this.jdbcTemplate.queryForObject
        (
                "select designation from employee where emid = ?",
                String.class,
                new Object[]{passWd}
        );
    }

    public ProductInformation getProductInfo(Long prid)
    {
        return this.jdbcTemplate.queryForObject
        (
            "select p.pid, p.name, p.cmid, c.name, p.rid, r.name, r.mobile_no, p.category, p.price, p.quantity from product p,company c,representative r where pid = ? and p.cmid = c.cmid and p.rid = r.rid",
            new Object[]{prid},
            new RowMapper<ProductInformation>() {
                public ProductInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                    ProductInformation pInfo = new ProductInformation();
                    pInfo.setPid(rs.getLong(1));
                    pInfo.setPname(rs.getString(2));
                    pInfo.setCmid(rs.getLong(3));
                    pInfo.setCmname(rs.getString(4));
                    pInfo.setRid(rs.getLong(5));
                    pInfo.setRname(rs.getString(6));
                    pInfo.setMobile_no(rs.getLong(7));
                    pInfo.setCategory(rs.getString(8));
                    pInfo.setPrice(rs.getLong(9));
                    pInfo.setQuantity(rs.getLong(10));
                    return pInfo;
                }
            }
        );
    }

    public CompanyInformation getCompanyInfo(Long cmid)
    {
        CompanyInformation cInfo =
        this.jdbcTemplate.queryForObject
        (
            "select * from company where cmid = ?",
            new Object[]{cmid},
            new RowMapper<CompanyInformation>() {
                public CompanyInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                    CompanyInformation cInfo = new CompanyInformation();
                    cInfo.setCmid(rs.getLong("cmid"));
                    cInfo.setCmname(rs.getString("name"));
                    cInfo.setCmaddress(rs.getString("address"));
                    return cInfo;
                }
            }
        );
        List<Long> pid =
        this.jdbcTemplate.query
        (
            "select pid from product where cmid = ?",
            new Object[]{cmid},
            new RowMapper<Long>() {
                public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return  rs.getLong(1);
                }
            }
        );
        cInfo.setPid(pid);
        List<String> pname =
        this.jdbcTemplate.query
        (
            "select name from product where cmid = ?",
            new Object[]{cmid},
            new RowMapper<String>() {
                public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return rs.getString(1);
                }
            }
        );
        cInfo.setPname(pname);
        List<String> rname =
        this.jdbcTemplate.query
        (
            "select name from representative where cmid = ? ",
            new Object[]{cmid},
            new RowMapper<String>() {
                public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return rs.getString(1);
                }
            }
        );
        cInfo.setRname(rname);
        List<Long> rid =
        this.jdbcTemplate.query
        (
            "select rid from representative where cmid = ? ",
            new Object[]{cmid},
            new RowMapper <Long>() {
                public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return rs.getLong(1);
                }
            }
        );
        cInfo.setRid(rid);
        List<Long> mobile_no =
        this.jdbcTemplate.query
        (
            "select mobile_no from representative where cmid = ? ",
            new Object[]{cmid},
            new RowMapper<Long>() {
                public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return rs.getLong(1);
                }
            }
        );
        cInfo.setMobile_no(mobile_no);
        return cInfo;
    }

    public void sellProductToRegular(String name, Long mobile_no, Long pid, Long emid, Long quantity)
    {
        Long price =
        this.jdbcTemplate.queryForObject
        (
                "select price from product where pid = ?",
                Long.class,
                new Object[]{pid}
        );

        Long maxCuid =
        this.jdbcTemplate.queryForObject
        (
                "select max(cuid) from customer",
                Long.class
        );

        SqlParameterSource in = new MapSqlParameterSource("MAX_ID", maxCuid);
        Long cuid = (funcGetCustomerId.executeFunction(BigDecimal.class,in)).longValue();

        this.jdbcTemplate.update("insert into customer values(?,?,?)",new Object[]{cuid,name,mobile_no});
        this.jdbcTemplate.update("insert into buys values(?,?,?,sysdate,?,?)",new Object[]{pid,emid,cuid,price,quantity});

        SqlParameterSource in1 = new MapSqlParameterSource("P_ID", pid).addValue("SELL_QUANTITY",quantity);
        procQuantityDown.execute(in1);
    }

    public void sellProductToPremier(Long pid,Long emid, Long cuid, Long quantity)
    {
        Long price =
        this.jdbcTemplate.queryForObject
        (
                "select price from product where pid = ?",
                Long.class,
                new Object[]{pid}
        );

        this.jdbcTemplate.update("insert into buys values(?,?,?,sysdate,?,?)",new Object[]{pid,emid,cuid,price,quantity});

        SqlParameterSource in = new MapSqlParameterSource("CU_ID", cuid).addValue("SELL_PRICE",price*quantity);
        procUpdatePercentage.execute(in);

        SqlParameterSource in1 = new MapSqlParameterSource("P_ID", pid).addValue("SELL_QUANTITY",quantity);
        procQuantityDown.execute(in1);
    }

    public void storeProduct (Long pid,Long emid, Long price, Long quantity)
    {
        this.jdbcTemplate.update("insert into stores values(?,?,sysdate,?,?)",new Object[]{pid,emid,price,quantity});

        SqlParameterSource in = new MapSqlParameterSource("P_ID", pid).addValue("STORE_QUANTITY",quantity);
        procQuantityUp.execute(in);
    }
}
