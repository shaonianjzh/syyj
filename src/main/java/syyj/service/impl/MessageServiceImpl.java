package syyj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import syyj.dao.MessageDao;
import syyj.domain.Linkman;
import syyj.domain.Message;
import syyj.domain.Statistics;
import syyj.service.MessageService;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageDao messageDao ;

    @Override
    public List<Message> findAll() {
        return messageDao.findAll();
    }

    @Override
    public List<Message> findMsgByPage(Integer page, Integer limit) {
        return messageDao.findMsgByPage(page,limit);
    }

    @Override
    public void delMsg(Integer id) {
        messageDao.delMsg(id);
    }

    @Override
    public List<Message> selectMsg(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        return messageDao.selectMsg(page,limit,keyword,start_time,end_time);
    }

    @Override
    public void uploadCompanyImage(String filename) {
        messageDao.uploadQRImage(filename);
    }

    @Override
    public Linkman findLinkman() {
        return messageDao.findLinkman();
    }

    @Override
    public void updateLinkman(Linkman linkman) {
        messageDao.updateLinkman(linkman);
    }

    @Override
    public Integer messageCount() {
        return messageDao.messageCount();
    }

    @Override
    public List<Statistics> sevenMessage(Integer num)  {
        return messageDao.sevemMessage(num);
    }

    @Override
    public void addFangWen(String time) {
        messageDao.addFangWen(time);
    }

    @Override
    public List<Statistics> findTodayMessage(int i) {
        return messageDao.findTodayMessage(i);
    }

    @Override
    public List<Statistics> findOneMonthMessage(int i) {
        return messageDao.findOneMonthMessage(i);
    }

    @Override
    public List<Statistics> findthreeMonthMessage(int i) {
        return messageDao.findThreeMonthMessage(i);
    }

    @Override
    public List<Statistics> findSixMonthMessage(int i) {
        return messageDao.findSixMonthMessage(i);
    }

    @Override
    public List<Statistics> findYearMessage(int i) {
        return messageDao.findYearMessage(i);
    }

    @Override
    public void addMsg(String time, String name, String telphone, String content) {
        messageDao.addMsg(time,name,telphone,content);
    }

    @Override
    public List<Message> selectMsg_(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        return messageDao.selectMsg_(page,limit,keyword,start_time,end_time);
    }

}

