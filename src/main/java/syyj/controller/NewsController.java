package syyj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import syyj.domain.Image;
import syyj.domain.News;
import syyj.domain.ResultUitl;
import syyj.service.NewService;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewService newService;

    @RequestMapping("/selectNews")
    @ResponseBody
    public ResultUitl selectNews(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        ResultUitl resultUitl = new ResultUitl();
        List<News> news = newService.selectNews(page, limit, keyword, start_time, end_time);
        List<News> newsList = newService.selectNews_(page,limit,keyword,start_time,end_time);
        resultUitl.setCount(news.size());
        resultUitl.setData(newsList);
        return resultUitl;
    }

    @RequestMapping("/editNews")
    @ResponseBody
    public ResultUitl editNews(Integer id,String title,String content, HttpServletRequest request){
        ResultUitl resultUitl = new ResultUitl();
        String filename = (String) request.getServletContext().getAttribute("filename");
        Date date = new Date();
        SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = dataFormat.format(date);
        News news = new News();
        news.setId(id);
        news.setTitle(title);
        news.setImage(filename);
        news.setContent(content);
        news.setTime(time);
        newService.editNews(news);
        return resultUitl;
    }

    @RequestMapping("/addNews")
    @ResponseBody
    public ResultUitl addNews(String title,String content, HttpServletRequest request ){
        News news =  new News();
        Date date = new Date();
        SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String time = dataFormat.format(date);
        String filename = (String) request.getServletContext().getAttribute("filename");
        news.setTime(time);
        news.setImage(filename);
        news.setTitle(title);
        news.setContent(content);
        ResultUitl resultUitl = new ResultUitl();
        newService.addNews(news);
        return resultUitl;
    }
    @RequestMapping("/uploadNewsImage")
    @ResponseBody
    public ResultUitl uploadNewsImage(MultipartFile file,HttpServletRequest request) {
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        try {
            file.transferTo(new File("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\news\\"+filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        request.getServletContext().setAttribute("filename",filename);
        resultUitl.setData(filename);
        return resultUitl;
    }

    @RequestMapping("/addNewsImage")
    @ResponseBody
    public ResultUitl addNewsImage(MultipartFile file){
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        Image image = new Image();
        image.setSrc("http://localhost:8080/syyj_war_exploded/layuimini-2/images/news/"+filename);
        image.setTitle(filename);
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\news\\"+filename));
            bs.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(image);
        return resultUitl;
    }

    @RequestMapping("/findNews")
    @ResponseBody
    public ResultUitl findNews(Integer page,Integer limit){
        ResultUitl resultUitl = new ResultUitl();
        List<News> news = newService.findAll();
        List<News> newsList = newService.findNewsByPage(page,limit);
        resultUitl.setCount(news.size());
        resultUitl.setData(newsList);
        return resultUitl;
    }
    @RequestMapping("/findNewsById/{id}")
    public ModelAndView findNewsById(@PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        News news = newService.findNewsById(id);
        modelAndView.addObject("news",news);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit_news.jsp");
        return modelAndView;
    }
    @RequestMapping("/delNews/{id}")
    @ResponseBody
    public ResultUitl delNews(@PathVariable("id")Long id){
        ResultUitl resultUitl = new ResultUitl();
        newService.delNews(id);
        return resultUitl;
    }
}
