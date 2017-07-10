package org.hasan.dbaccess;

import org.hasan.model.*;
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
import java.util.List;

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

    public void createCompany(Long cmid, String name, String address)
    {
        this.jdbcTemplate.update
        (
            "insert into company values(?,?,?)",
            cmid,name,address
        );
    }

    public void createRepresentative(Long rid, Long cmid, String name, Long mobile_no)
    {
        this.jdbcTemplate.update
        (
            "insert into representative values(?,?,?,?)",
            rid,cmid,name,mobile_no
        );
    }

    public void createProduct(Long pid, Long cmid, String name, Long price, Long quantity, String category, Long rid, Long emid)
    {
        this.jdbcTemplate.update
        (
            "insert into product values(?,?,?,?,?,?,?)",
            pid,cmid,name,price,quantity,category,rid
        );
        storeProduct(pid, emid, price, quantity);
    }

    public void createCustomer(Long cuid, String name, Long mobile_no, String address)
    {
        this.jdbcTemplate.update
        (
            "insert into customer values(?,?,?)",
            cuid,name,mobile_no
        );
        this.jdbcTemplate.update
        (
            "insert into prcustomer ( cuid, joindate, address ) values(?,sysdate,?)",
            cuid,address
        );
    }

    public void createEmployee(Long emid, String name, Long mobile_no, String address, String designation)
    {
        this.jdbcTemplate.update
        (
            "insert into employee ( emid, name, address, mobile_no, designation ) values(?,?,?,?,?)",
            emid,name,address,mobile_no,designation
        );
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

    public int isProduct( Long pid )
    {
        return this.jdbcTemplate.queryForObject
        (
            "select count(*) from product where pid = ?",
            Integer.class,
            new Object[]{pid}
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

    public int isEmployee( Long emid )
    {
        return this.jdbcTemplate.queryForObject
        (
            "select count(*) from employee where emid = ?",
            Integer.class,
            new Object[]{emid}
        );
    }

    public int isRep( Long rid )
    {
        return this.jdbcTemplate.queryForObject
        (
            "select count(*) from representative where rid = ?",
            Integer.class,
            new Object[]{rid}
        );
    }

    public int isPrCustomer( Long cuid )
    {
        return this.jdbcTemplate.queryForObject
        (
            "select count(*) from prcustomer where cuid = ?",
            Integer.class,
            new Object[]{cuid}
        );
    }

    public int isRepOfCom( Long rid, Long cmid )
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
        Long cmid =
        this.jdbcTemplate.queryForObject
        (
            "select cmid from product where pid = ?",
            Long.class,
            new Object[]{prid}
        );
        Long rid =
        this.jdbcTemplate.queryForObject
        (
            "select rid from product where pid = ?",
            Long.class,
            new Object[]{prid}
        );
        if ( cmid==null && rid==null )
        {
            ProductInformation pInfo =
            this.jdbcTemplate.queryForObject
            (
                "select pid, name, category, price, quantity from product where pid = ?",
                new Object[]{prid},
                new RowMapper<ProductInformation>() {
                    public ProductInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                        ProductInformation pInfo = new ProductInformation();
                        pInfo.setPid(rs.getLong(1));
                        pInfo.setPname(rs.getString(2));
                        pInfo.setCategory(rs.getString(3));
                        pInfo.setPrice(rs.getLong(4));
                        pInfo.setQuantity(rs.getLong(5));
                        return pInfo;
                    }
                }
            );
            pInfo.setCmid(null);
            pInfo.setCmname(null);
            pInfo.setRid(null);
            pInfo.setRname(null);
            pInfo.setMobile_no(null);
            return pInfo;
        }
        else if ( cmid==null )
        {
            ProductInformation pInfo =
            this.jdbcTemplate.queryForObject
            (
                "select p.pid, p.name, p.rid, r.name, r.mobile_no, p.category, p.price, p.quantity from product p, representative r where pid = ? and p.rid = r.rid",
                new Object[]{prid},
                new RowMapper<ProductInformation>() {
                    public ProductInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                        ProductInformation pInfo = new ProductInformation();
                        pInfo.setPid(rs.getLong(1));
                        pInfo.setPname(rs.getString(2));
                        pInfo.setRid(rs.getLong(3));
                        pInfo.setRname(rs.getString(4));
                        pInfo.setMobile_no(rs.getLong(5));
                        pInfo.setCategory(rs.getString(6));
                        pInfo.setPrice(rs.getLong(7));
                        pInfo.setQuantity(rs.getLong(8));
                        return pInfo;
                    }
                }
            );
            pInfo.setCmid(null);
            pInfo.setCmname(null);
            return pInfo;
        }
        else if ( rid==null )
        {
            ProductInformation pInfo =
            this.jdbcTemplate.queryForObject
            (
                "select p.pid, p.name, p.cmid, c.name, p.category, p.price, p.quantity from product p,company c where pid = ? and p.cmid = c.cmid",
                new Object[]{prid},
                new RowMapper<ProductInformation>() {
                    public ProductInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                        ProductInformation pInfo = new ProductInformation();
                        pInfo.setPid(rs.getLong(1));
                        pInfo.setPname(rs.getString(2));
                        pInfo.setCmid(rs.getLong(3));
                        pInfo.setCmname(rs.getString(4));
                        pInfo.setCategory(rs.getString(5));
                        pInfo.setPrice(rs.getLong(6));
                        pInfo.setQuantity(rs.getLong(7));
                        return pInfo;
                    }
                }
            );
            pInfo.setRid(null);
            pInfo.setRname(null);
            pInfo.setMobile_no(null);
            return pInfo;
        }
        else
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

    public CustomerInformation getCustomerInfo(Long cuid)
    {
        CustomerInformation cInfo =
        this.jdbcTemplate.queryForObject
        (
            "SELECT c.CUID, c.NAME, c.MOBILE_NO, p.ADDRESS, p.COMMISSION_PCT, p.PURCHASE, to_char(p.joindate,'YYYY-MM-DD HH24:MI:SS') joindate FROM CUSTOMER c, PRCUSTOMER p WHERE c.CUID=p.CUID AND c.CUID = ?",
            new Object[]{cuid},
            new RowMapper<CustomerInformation>() {
                public CustomerInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                    CustomerInformation cInfo = new CustomerInformation();
                    cInfo.setCuid(rs.getLong(1));
                    cInfo.setCuname(rs.getString(2));
                    cInfo.setMobile_no(rs.getLong(3));
                    cInfo.setCuaddress(rs.getString(4));
                    cInfo.setCommission_pct(rs.getFloat(5));
                    cInfo.setPurchase(rs.getFloat(6));
                    cInfo.setJoindate(rs.getString(7));
                    return cInfo;
                }
            }
        );
        return cInfo;
    }

    public EmployeeInformation getEmployeeInfo(Long emid)
    {
        EmployeeInformation cInfo =
        this.jdbcTemplate.queryForObject
        (
            "select * from employee where emid = ?",
            new Object[]{emid},
            new RowMapper<EmployeeInformation>() {
                public EmployeeInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                    EmployeeInformation cInfo = new EmployeeInformation();
                    cInfo.setEmid(rs.getLong("emid"));
                    cInfo.setEmname(rs.getString("name"));
                    cInfo.setEmaddress(rs.getString("address"));
                    cInfo.setSalary(rs.getFloat("salary"));
                    cInfo.setDesignation(rs.getString("designation"));
                    cInfo.setMobile_no(rs.getLong("mobile_no"));
                    return cInfo;
                }
            }
        );
        return cInfo;
    }

    public RepresentativeInformation getRepInfo(Long rid)
    {
        RepresentativeInformation cInfo =
        this.jdbcTemplate.queryForObject
        (
            "select * from representative where rid = ?",
            new Object[]{rid},
            new RowMapper<RepresentativeInformation>() {
                public RepresentativeInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                    RepresentativeInformation cInfo = new RepresentativeInformation();
                    cInfo.setRid(rs.getLong("rid"));
                    cInfo.setCmid(rs.getLong("cmid"));
                    cInfo.setRname(rs.getString("name"));
                    cInfo.setMobile_no(rs.getLong("mobile_no"));
                    return cInfo;
                }
            }
        );
        List<Long> pid =
        this.jdbcTemplate.query
        (
            "select pid from product where rid = ?",
            new Object[]{rid},
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
            "select name from product where rid = ?",
            new Object[]{rid},
            new RowMapper<String>() {
                public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                    return rs.getString(1);
                }
            }
        );
        cInfo.setPname(pname);
        Long cmid = cInfo.getCmid();
        if ( cmid==null )
        {
            cInfo.setCmname(null);
        }
        else
        {
            cInfo.setCmname(
                this.jdbcTemplate.queryForObject
                (
                    "select name from company where cmid = ?",
                    String.class,
                    new Object[]{cmid}
                )
            );
        }
        return cInfo;
    }

    public List<SellInformation> getSellPrInfo( Long pid )
    {

        List<SellInformation> sInfo =
        this.jdbcTemplate.query
        (
            "select pid,emid,cuid,price,quantity, to_char(bdate,'YYYY-MM-DD HH24:MI:SS') bdate from buys where pid = ? order by bdate desc",
            new Object[]{pid},
            new RowMapper<SellInformation>() {
                public SellInformation mapRow(ResultSet rs, int rowNum) throws SQLException {
                    SellInformation sInfo = new SellInformation();
                    sInfo.setPid(rs.getLong("pid"));
                    sInfo.setEmid(rs.getLong("emid"));
                    sInfo.setCuid(rs.getLong("cuid"));
                    sInfo.setPrice(rs.getLong("price"));
                    sInfo.setQuantity(rs.getLong("quantity"));
                    sInfo.setDate(rs.getString("bdate"));
                    return sInfo;
                }
            }
        );
        for ( SellInformation s: sInfo )
        {
            s.setPname(
                this.jdbcTemplate.queryForObject
                (
                    "select name from product where pid = ?",
                    String.class,
                    new Object[]{s.getPid()}
                )
            );
            s.setEmname(
                this.jdbcTemplate.queryForObject
                (
                    "select name from employee where emid = ?",
                    String.class,
                    new Object[]{s.getEmid()}
                )
            );
            s.setCuname(
                this.jdbcTemplate.queryForObject
                (
                    "select name from customer where cuid = ?",
                    String.class,
                    new Object[]{s.getCuid()}
                )
            );
            s.setMobile_no(
                this.jdbcTemplate.queryForObject
                (
                    "select mobile_no from customer where cuid = ?",
                    Long.class,
                    new Object[]{s.getCuid()}
                )
            );
        }
        return sInfo;
    }

    public Float sellProductToRegular(Long cuid, Long pid, Long emid, Long quantity)
    {
        Float price =
        this.jdbcTemplate.queryForObject
        (
                "select price from product where pid = ?",
                Float.class,
                new Object[]{pid}
        );

        this.jdbcTemplate.update("insert into buys values(?,?,?,sysdate,?,?)",new Object[]{pid,emid,cuid,price,quantity});

        SqlParameterSource in1 = new MapSqlParameterSource("P_ID", pid).addValue("SELL_QUANTITY",quantity);
        procQuantityDown.execute(in1);
        return price;
    }

    public Long findRegularID (String name, Long mobile_no)
    {
        Long maxCuid =
        this.jdbcTemplate.queryForObject
        (
                "select max(cuid) from customer",
                Long.class
        );

        SqlParameterSource in = new MapSqlParameterSource("MAX_ID", maxCuid);
        Long cuid = (funcGetCustomerId.executeFunction(BigDecimal.class,in)).longValue();

        this.jdbcTemplate.update("insert into customer values(?,?,?)",new Object[]{cuid,name,mobile_no});
        return cuid;
    }

    public String findProductName( Long pid )
    {
        return this.jdbcTemplate.queryForObject
        (
            "select name from product where pid = ?",
            String.class,
            new Object[]{pid}
        );
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
