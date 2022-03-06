package syyj.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import syyj.dao.MessageDao;
import syyj.domain.Linkman;
import syyj.domain.Message;
import syyj.domain.Statistics;

import java.util.List;

@Repository
public class MessageDaoImpl implements MessageDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<Message> findAll() {
        List<Message> messages = jdbcTemplate.query("select * from tb_msg", new BeanPropertyRowMapper<Message>(Message.class));
        return messages;
    }

    @Override
    public List<Message> findMsgByPage(Integer page, Integer length) {
        int start = (page - 1) * length;
        List<Message> messageList = jdbcTemplate.query("select * from tb_msg limit ?,? ", new BeanPropertyRowMapper<Message>(Message.class), start, length);
        return messageList;
    }

    @Override
    public void delMsg(Integer id) {
        jdbcTemplate.update("delete from tb_msg where id = ?", id);
    }

    @Override
    public List<Message> selectMsg(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        String sql = "select * from tb_msg where 1=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if (keyword != null && !"".equals(keyword)) {
            sb.append(" and content like '%" + keyword + "%' ");
        }
        if (start_time != null && !"".equals(start_time) && end_time != null && !"".equals(end_time)) {
            sb.append(" and time > '" + start_time + "' and time < '" + end_time + "' ");
        }
        List<Message> messages = jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<Message>(Message.class));

        return messages;
    }

    @Override
    public void uploadQRImage(String filename) {
        jdbcTemplate.update("update tb_linkman set image = ? ", filename);
    }

    @Override
    public Linkman findLinkman() {
        Linkman linkman = jdbcTemplate.queryForObject("select * from tb_linkman", new BeanPropertyRowMapper<Linkman>(Linkman.class));
        return linkman;
    }

    @Override
    public void updateLinkman(Linkman linkman) {
        jdbcTemplate.update("update tb_linkman set linkman = ?,email = ?,phone = ?,website = ?", linkman.getLinkman(), linkman.getEmail(), linkman.getPhone(), linkman.getWebsite());
    }

    @Override
    public Integer messageCount() {
        Integer count = jdbcTemplate.queryForObject("select count(*) from tb_msg", Integer.class);
        return count;
    }

    @Override
    public List<Statistics> sevemMessage(Integer num) {
        String sql;
        if (num == 1) {
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m-%d' ) days,\n" +
                    "\tcount(*) count\t\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_fangwen\n" +
                    " WHERE DATE_SUB( CURDATE( ), INTERVAL 6 DAY ) <= date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        } else {
            sql = "SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m-%d' ) days,\n" +
                    "\tcount(*) count\t\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_msg\n" +
                    " WHERE DATE_SUB( CURDATE( ), INTERVAL 6 DAY ) <= date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }
        List<Statistics> statisticsList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Statistics>(Statistics.class));
        return statisticsList;
    }

    @Override
    public void addFangWen(String time) {
        jdbcTemplate.update("insert into tb_fangwen values(?,?)",null,time);
    }

    @Override
    public List<Statistics> findTodayMessage(int i) {
        String sql;
        if(i==1){
            sql = "SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m-%d %H' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_fangwen\n" +
                    " WHERE date(time)=CURDATE() )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days";
        }else{
            sql = "SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m-%d %H' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_msg\n" +
                    " WHERE date(time)=CURDATE() )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;\n";
        }
        List<Statistics> statisticsList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Statistics>(Statistics.class));
        return statisticsList;
    }

    @Override
    public List<Statistics> findOneMonthMessage(int i) {
        String sql;
        if(i==1){
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%u' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_fangwen\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 1 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days";
        }else{
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%u' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_msg\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 1 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days";
        }
        List<Statistics> statisticsList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Statistics>(Statistics.class));
        return statisticsList;
    }

    @Override
    public List<Statistics> findThreeMonthMessage(int i) {
        String sql;
        if(i==1){
            sql = "SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%u' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_fangwen\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 3 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }else{
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%u' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_msg\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 3 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }
        List<Statistics> statisticsList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Statistics>(Statistics.class));
        return statisticsList;
    }

    @Override
    public List<Statistics> findSixMonthMessage(int i) {
        String sql;
        if(i==1){
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_fangwen\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 6 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }else{
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_msg\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 6 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }
        List<Statistics> statisticsList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Statistics>(Statistics.class));
        return statisticsList;
    }

    @Override
    public List<Statistics> findYearMessage(int i) {
        String sql;
        if(i==1){
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_fangwen\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 12 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }else{
            sql="SELECT\n" +
                    "\tDATE_FORMAT(time, '%Y-%m' ) days,\n" +
                    "\tcount(*) count\n" +
                    "FROM\n" +
                    "( SELECT * FROM tb_msg\n" +
                    " WHERE DATE_SUB(CURDATE( ),INTERVAL 12 MONTH)<=date(time) )\n" +
                    "as tb_seven \n" +
                    "GROUP BY\n" +
                    "days\n" +
                    "order by days;";
        }
        List<Statistics> statisticsList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Statistics>(Statistics.class));
        return statisticsList;
    }

    @Override
    public void addMsg(String time, String name, String telphone, String content) {
        jdbcTemplate.update("insert into tb_msg values(?,?,?,?,?)",null,time,name,telphone,content);
    }

    @Override
    public List<Message> selectMsg_(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        String sql = "select * from tb_msg where 1=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if (keyword != null && !"".equals(keyword)) {
            sb.append(" and content like '%" + keyword + "%' ");
        }
        if (start_time != null && !"".equals(start_time) && end_time != null && !"".equals(end_time)) {
            sb.append(" and time > '" + start_time + "' and time < '" + end_time + "' ");
        }
        int start = (page-1)*limit;
        sb.append(" limit "+start+","+limit+" ");
        List<Message> messages = jdbcTemplate.query(sb.toString(), new BeanPropertyRowMapper<Message>(Message.class));
        return messages;
    }

}
