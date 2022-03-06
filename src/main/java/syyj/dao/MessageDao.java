package syyj.dao;

import syyj.domain.Linkman;
import syyj.domain.Message;
import syyj.domain.Statistics;

import java.util.List;

public interface MessageDao {

    List<Message> findAll();

    List<Message> findMsgByPage(Integer page, Integer limit);

    void delMsg(Integer id);

    List<Message> selectMsg(Integer page, Integer limit, String keyword, String start_time, String end_time);

    void uploadQRImage(String filename);

    Linkman findLinkman();

    void updateLinkman(Linkman linkman);

    Integer messageCount();

    List<Statistics> sevemMessage(Integer num) ;

    void addFangWen(String time);

    List<Statistics> findTodayMessage(int i);

    List<Statistics> findOneMonthMessage(int i);

    List<Statistics> findThreeMonthMessage(int i);

    List<Statistics> findSixMonthMessage(int i);

    List<Statistics> findYearMessage(int i);

    void addMsg(String time, String name, String telphone, String content);

    List<Message> selectMsg_(Integer page, Integer limit, String keyword, String start_time, String end_time);
}
