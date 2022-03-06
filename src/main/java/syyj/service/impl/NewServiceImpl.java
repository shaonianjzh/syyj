package syyj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import syyj.dao.NewDao;
import syyj.domain.News;
import syyj.service.NewService;

import java.util.List;

@Service
public class NewServiceImpl implements NewService {

    @Autowired
    private NewDao newDao;

    @Override
    public List<News> findAll() {
        return newDao.findAll();
    }

    @Override
    public List<News> findNewsByPage(Integer page, Integer limit) {
        return newDao.findNewsByPage(page,limit);
    }

    @Override
    public void addNews(News news) {
        newDao.addNews(news);
    }

    @Override
    public void delNews(Long id) {
        newDao.delNews(id);
    }

    @Override
    public News findNewsById(Integer id) {
        return newDao.findNewsById(id);
    }

    @Override
    public void editNews(News news) {
        newDao.editNews(news);
    }

    @Override
    public List<News> selectNews(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        return newDao.selectNews(page,limit,keyword,start_time,end_time);
    }

    @Override
    public List<News> selectNews_(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        return newDao.selectNews_(page,limit,keyword,start_time,end_time);
    }

}
