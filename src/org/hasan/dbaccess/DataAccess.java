package org.hasan.dbaccess;

import org.hasan.model.ProductInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by ENVY on 4/27/2017.
 */
@Repository
public class DataAccess {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource)
    {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
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
}
