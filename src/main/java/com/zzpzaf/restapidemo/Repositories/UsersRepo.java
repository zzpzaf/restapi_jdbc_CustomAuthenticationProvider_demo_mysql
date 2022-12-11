package com.zzpzaf.restapidemo.Repositories;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import javax.sql.DataSource;
import com.zzpzaf.restapidemo.dataObjects.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UsersRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Value("${USERS_TABLE}")
    private String USERS_TABLE; // = "USERS";

    @Value("${ROLES_TABLE}")
    private String ROLES_TABLE; // = "AUTHORITIES";

    public User findById(Long id) {
        try {
            User user = jdbcTemplate.queryForObject("SELECT * FROM " + USERS_TABLE + " WHERE ID=?",
                       BeanPropertyRowMapper.newInstance(User.class), id);
            return user;
        } catch (IncorrectResultSizeDataAccessException e) {
            return null;
        }
    }

    public User findByName(String username) {
        User user = null;
        try {
            user = jdbcTemplate.queryForObject("SELECT * FROM " + USERS_TABLE + " WHERE USERNAME=?",
                       BeanPropertyRowMapper.newInstance(User.class), username);
            if (user != null)user.grantAuthorities(this.getUserRoles(user.getUSERNAME()));
            
            
            
            return user;

        } catch (IncorrectResultSizeDataAccessException e) {

            return null;
        }
    }

    private List<String> getUserRoles(String userName) {

        String querySQL = "SELECT ROLE FROM " + ROLES_TABLE + " WHERE USERNAME = '" + userName + "'";
        List<String> userRoles = jdbcTemplate.queryForList(querySQL, String.class);
        return userRoles;
    }



    public Boolean isUserPasswordValid(String uname, String upassw) {

        Boolean ret = false;
        if ( uname.equals(null) || upassw.equals(null) ) return ret;

        DataSource dataSource = jdbcTemplate.getDataSource();
        if (dataSource == null) {
           //throw new SQLException();
           System.out.println("Unable to access DataSource!");
           return ret;
        }

        try (CallableStatement statement = dataSource.getConnection().prepareCall("{? = call IsUserPasswordValid(?, ?)}")) {
            statement.registerOutParameter(1, Types.INTEGER);
            statement.setString(2,uname);       
            statement.setString(3,upassw);
            statement.execute();
            int result = statement.getInt(1);
            if (result == 1) ret = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return ret;
    }

}
