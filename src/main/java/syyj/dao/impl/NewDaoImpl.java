package syyj.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import syyj.dao.NewDao;
import syyj.domain.News;

import java.util.List;

@Repository
public class NewDaoImpl implements NewDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<News> findAll() {
        List<News> news = jdbcTemplate.query("select * from tb_news", new BeanPropertyRowMapper<News>(News.class));
        return news;
    }

    @Override
    public List<News> findNewsByPage(Integer page, Integer limit) {
        Integer start =(page-1)*limit;
        List<News> newsList = jdbcTemplate.query("select * from tb_news  order by time desc limit ?,? ", new BeanPropertyRowMapper<News>(News.class), start, limit);
        return newsList;
    }

    @Override
    public void addNews(News news) {
        jdbcTemplate.update("insert into tb_news values(?,?,?,?,?)",null,news.getImage(),news.getTime(),news.getTitle(),news.getContent());
    }

    @Override
    public void delNews(Long id) {
        jdbcTemplate.update("delete from tb_news where id = ?",id);
    }

    @Override
    public News findNewsById(Integer id) {
        News news = jdbcTemplate.queryForObject("select * from tb_news where id = ?", new BeanPropertyRowMapper<News>(News.class), id);
        return news;
    }

    @Override
    public void editNews(News news) {
        jdbcTemplate.update("update tb_news set image=?,time=?,title=?,content=? where id =?",news.getImage(),news.getTime(),news.getTitle(),news.getContent(),news.getId());
    }

    @Override
    public List<News> selectNews(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        String sql = "select * from tb_news where 1=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if(keyword!=null&&!"".equals(keyword)){
            sb.append(" and content like '%"+keyword+"%' ");
        }
        if(start_time!=null&&!"".equals(start_time)&&end_time!=null&&!"".equals(end_time)){
            sb.append(" and time > '"+start_time+"' and time < '"+end_time+"' ");
        }
        List<News> newsList = jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<News>(News.class));
        return newsList;
    }

    @Override
    public List<News> selectNews_(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        String sql = "select * from tb_news where 1=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if(keyword!=null&&!"".equals(keyword)){
            sb.append(" and content like '%"+keyword+"%' ");
        }
        if(start_time!=null&&!"".equals(start_time)&&end_time!=null&&!"".equals(end_time)){
            sb.append(" and time > '"+start_time+"' and time < '"+end_time+"' ");
        }

        int start = (page-1)*limit;
        sb.append(" limit "+start+","+limit+" ");
        List<News> newsList = jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<News>(News.class));
        return newsList;
    }
}
