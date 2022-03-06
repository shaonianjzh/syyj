package syyj.dao;

import syyj.domain.News;

import java.util.List;

public interface NewDao {
    List<News> findAll();

    List<News> findNewsByPage(Integer page, Integer limit);

    void addNews(News news);

    void delNews(Long id);

    News findNewsById(Integer id);

    void editNews(News news);

    List<News> selectNews(Integer page, Integer limit, String keyword, String start_time, String end_time);

    List<News> selectNews_(Integer page, Integer limit, String keyword, String start_time, String end_time);
}
