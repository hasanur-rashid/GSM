package org.hasan.dbaccess;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

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
        int rowCnt = this.jdbcTemplate.queryForObject
                (
                    "select count(*) from employee where name = ? and emid = ?",
                    Integer.class,
                    new Object[]{usrName,passWd}
                );
        return rowCnt;
    }

    public String getDesignation( Long passWd )
    {
        String desg = this.jdbcTemplate.queryForObject
                (
                        "select designation from employee where emid = ?",
                        String.class,
                        new Object[]{passWd}
                );
        return desg;
    }
}
