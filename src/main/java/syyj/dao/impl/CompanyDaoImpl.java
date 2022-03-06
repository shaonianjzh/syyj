package syyj.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import syyj.dao.CompanyDao;
import syyj.domain.*;

import java.util.List;

@Repository
public class CompanyDaoImpl implements CompanyDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    @Override
    public List<Culture> findAll() {
        List<Culture> cultures = jdbcTemplate.query("select * from company_culture", new BeanPropertyRowMapper<Culture>(Culture.class));
        return cultures;
    }

    @Override
    public void delById(Long id) {
        jdbcTemplate.update("delete from company_culture where id = ?",id);
    }

    @Override
    public void insertCulture(Culture culture) {
        jdbcTemplate.update("insert into company_culture values(?,?,?)",null,culture.getTitle(),culture.getContent());
    }

    @Override
    public List<Achievement> findAllAchievement() {
        List<Achievement> achievements = jdbcTemplate.query("select * from company_development order by yearth", new BeanPropertyRowMapper<Achievement>(Achievement.class));
        return achievements;
    }

    @Override
    public void delAchievement(Long id) {
        jdbcTemplate.update("delete from company_development where id = ?",id);
    }

    @Override
    public List<Honor> findAllHonor() {
        List<Honor> honorList = jdbcTemplate.query("select * from company_honor", new BeanPropertyRowMapper<Honor>(Honor.class));
        return honorList;
    }

    @Override
    public void delHonor(Long id) {
        jdbcTemplate.update("delete from company_honor where id = ? ",id);
    }

    @Override
    public void editCulture(Culture culture) {
        jdbcTemplate.update("update company_culture set title = ? ,content = ? where id =?",culture.getTitle(),culture.getContent(),culture.getId());
    }

    @Override
    public Culture findCulture(Integer id) {
        Culture culture = jdbcTemplate.queryForObject("select * from company_culture where id = ?", new BeanPropertyRowMapper<Culture>(Culture.class), id);
        return culture;
    }

    @Override
    public void insertAchievement(Achievement achievement) {
        jdbcTemplate.update("insert into company_development values(?,?,?)",null,achievement.getYearth(),achievement.getAchievement());
    }

    @Override
    public Achievement findAchievement(Integer id) {
        return jdbcTemplate.queryForObject("select * from company_development where id = ?",new BeanPropertyRowMapper<Achievement>(Achievement.class),id);
    }

    @Override
    public void editAchievement(Achievement achievement) {
        jdbcTemplate.update("update company_development set yearth = ?,achievement = ? where id = ?",achievement.getYearth(),achievement.getAchievement(),achievement.getId());
    }

    @Override
    public void uploadCompanyImage(String filename) {
        jdbcTemplate.update("update company_introduce set image = ?",filename);
    }

    @Override
    public void uploadHonorImage(String filename) {
        jdbcTemplate.update("insert into company_honor values(?,?)",null,filename);
    }

    @Override
    public void updateHonorImage(String filename, Integer id) {
        jdbcTemplate.update("update company_honor set image = ? where id = ?",filename,id);
    }

    @Override
    public void addIntroduce(String str) {
        jdbcTemplate.update("update company_introduce set introduce = ? ",str);
    }

    @Override
    public void addAdvantage(String file) {
        jdbcTemplate.update("update tb_join set joinAdvantage = ?",file);
    }

    @Override
    public void addCondition(String file) {
        jdbcTemplate.update("update tb_join set joinCondition = ?",file);
    }

    @Override
    public void addProgress(String file) {
        jdbcTemplate.update("update tb_join set joinProgress = ?",file);
    }

    @Override
    public CompanyIntroduce findImage() {
        CompanyIntroduce introduce = jdbcTemplate.queryForObject("select * from company_introduce", new BeanPropertyRowMapper<CompanyIntroduce>(CompanyIntroduce.class));
        return introduce;
    }

    @Override
    public Join findJoin() {
        Join join = jdbcTemplate.queryForObject("select * from tb_join", new BeanPropertyRowMapper<Join>(Join.class));
        return join;
    }
}
