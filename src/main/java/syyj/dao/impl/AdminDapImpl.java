package syyj.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import syyj.dao.AdminDao;
import syyj.domain.Admin;

/**
 * @author 少年
 */
@Repository
public class AdminDapImpl implements AdminDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Admin find(String username,String password) {
        try{
            Admin admin = jdbcTemplate.queryForObject("select * from tb_admin where username = ? and password = ? ", new BeanPropertyRowMapper<Admin>(Admin.class),username,password);
            return admin;
        }catch (Exception e){
            return null;
        }
    }
}
