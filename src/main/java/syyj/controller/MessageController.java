package syyj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import syyj.domain.*;
import syyj.service.MessageService;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping("/yearMessage")
    @ResponseBody
    public ResultUitl yearMessage() throws ParseException {
        ResultUitl resultUitl = new ResultUitl();
        List<Statistics> statistics1 = messageService.findYearMessage(1);
        List<Statistics> statistics2 = messageService.findYearMessage(2);
        Calendar c = Calendar.getInstance();
        int t_month = c.get(Calendar.MONTH);
        for(Statistics s1: statistics1){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            Date parse = dateFormat.parse(s1.getDays());
            c.setTime(parse);
            int month = c.get(Calendar.MONTH);
            if((month-(t_month-11))>=12){
                s1.setDays(String.valueOf(month-(t_month-11)-12));
            }else{
                s1.setDays(String.valueOf(month-(t_month-11)));
            }
        }
        for(Statistics s2:statistics2){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-ww");
            Date parse = dateFormat.parse(s2.getDays());
            c.setTime(parse);
            int month = c.get(Calendar.MONTH);
            if((month-(t_month-11))>=12){
                s2.setDays(String.valueOf(month-(t_month-11)-12));
            }else{
                s2.setDays(String.valueOf(month-(t_month-11)));
            }
        }
        Both both = new Both();
        both.setS1(statistics1);
        both.setS2(statistics2);
        resultUitl.setData(both);
        return resultUitl;
    }


    @RequestMapping("/sixMonthMessage")
    @ResponseBody
    public ResultUitl sixMonthMessage() throws ParseException {
        ResultUitl resultUitl = new ResultUitl();
        List<Statistics> statistics1 = messageService.findSixMonthMessage(1);
        List<Statistics> statistics2 = messageService.findSixMonthMessage(2);
        Calendar c = Calendar.getInstance();
        int t_month = c.get(Calendar.MONTH);
        for(Statistics s1: statistics1){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            Date parse = dateFormat.parse(s1.getDays());
            c.setTime(parse);
            int month = c.get(Calendar.MONTH);
            if((month-(t_month-5))>=12){
                s1.setDays(String.valueOf(month-(t_month-5)-12));
            }else{
                s1.setDays(String.valueOf(month-(t_month-5)));
            }
        }
        for(Statistics s2:statistics2){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-ww");
            Date parse = dateFormat.parse(s2.getDays());
            c.setTime(parse);
            int month = c.get(Calendar.MONTH);
            if((month-(t_month-5))>=12){
                s2.setDays(String.valueOf(month-(t_month-5)-12));
            }else{
                s2.setDays(String.valueOf(month-(t_month-5)));
            }
        }
        Both both = new Both();
        both.setS1(statistics1);
        both.setS2(statistics2);
        resultUitl.setData(both);
        return resultUitl;
    }

    @RequestMapping("/threeMonthMessage")
    @ResponseBody
    public ResultUitl threeMonthMessage() throws ParseException {
        ResultUitl resultUitl = new ResultUitl();
        List<Statistics> statistics1 = messageService.findthreeMonthMessage(1);
        List<Statistics> statistics2 = messageService.findthreeMonthMessage(2);
        Calendar c = Calendar.getInstance();
        int t_week = c.get(Calendar.WEEK_OF_YEAR);
        for(Statistics s1: statistics1){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-ww");
            Date parse = dateFormat.parse(s1.getDays());
            c.setTime(parse);
            int week = c.get(Calendar.WEEK_OF_YEAR);
            if((week-(t_week-13))>=53){
                s1.setDays(String.valueOf(week-(t_week-13)-53));
            }else{
                s1.setDays(String.valueOf(week-(t_week-13)));
            }
        }
        for(Statistics s2:statistics2){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-ww");
            Date parse = dateFormat.parse(s2.getDays());
            c.setTime(parse);
            int week = c.get(Calendar.WEEK_OF_YEAR);
            if((week-(t_week-13))>=53){
                s2.setDays(String.valueOf(week-(t_week-13)-53));
            }else{
                s2.setDays(String.valueOf(week-(t_week-13)));
            }
        }
        Both both = new Both();
        both.setS1(statistics1);
        both.setS2(statistics2);
        resultUitl.setData(both);
        return resultUitl;
    }

    @RequestMapping("/oneMonthMessage")
    @ResponseBody
    public ResultUitl oneMonthMessage() throws ParseException {
        ResultUitl resultUitl = new ResultUitl();
        List<Statistics> statistics1 = messageService.findOneMonthMessage(1);
        List<Statistics> statistics2 = messageService.findOneMonthMessage(2);
        Calendar c = Calendar.getInstance();
        int t_week = c.get(Calendar.WEEK_OF_YEAR);
        for(Statistics s1: statistics1){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-ww");
            Date parse = dateFormat.parse(s1.getDays());
            c.setTime(parse);
            int week = c.get(Calendar.WEEK_OF_YEAR);
            if((week-(t_week-5))>=53){
                s1.setDays(String.valueOf(week-(t_week-5)-53));
            }else{
                s1.setDays(String.valueOf(week-(t_week-5)));
            }
        }
        for(Statistics s2:statistics2){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-ww");
            Date parse = dateFormat.parse(s2.getDays());
            c.setTime(parse);
            int week = c.get(Calendar.WEEK_OF_YEAR);
            if((week-(t_week-5))>=53){
                s2.setDays(String.valueOf(week-(t_week-5)-53));
            }else{
                s2.setDays(String.valueOf(week-(t_week-5)));
            }
        }
        Both both = new Both();
        both.setS1(statistics1);
        both.setS2(statistics2);
        resultUitl.setData(both);
        return resultUitl;
    }


    @RequestMapping("/todayMessage")
    @ResponseBody
    public ResultUitl todayMessage() throws ParseException {
        ResultUitl resultUitl = new ResultUitl();
        List<Statistics> statistics1 = messageService.findTodayMessage(1);
        List<Statistics> statistics2 = messageService.findTodayMessage(2);
        Calendar c = Calendar.getInstance();
        for(Statistics s1: statistics1){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
            Date parse = dateFormat.parse(s1.getDays());
            c.setTime(parse);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            s1.setDays(String.valueOf(hour));
        }
        for(Statistics s2:statistics2){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
            Date parse = dateFormat.parse(s2.getDays());
            c.setTime(parse);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            s2.setDays(String.valueOf(hour));
        }
        Both both = new Both();
        both.setS1(statistics1);
        both.setS2(statistics2);
        resultUitl.setData(both);
        return resultUitl;
    }

    @RequestMapping("/addFangWen")
    @ResponseBody
    public void addFangWe(){
        Date date = new Date();
        SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dataFormat.format(date);
        messageService.addFangWen(time);
    }
    @RequestMapping("/messageCount")
    @ResponseBody
    public ResultUitl MessageCount() throws ParseException {

        ResultUitl resultUitl = new ResultUitl();
        Calendar c= Calendar.getInstance();
        int today = c.get(Calendar.DATE);

        List<Statistics> statistics1=messageService.sevenMessage(1);
        List<Statistics> statistics2= messageService.sevenMessage(2);
        for(Statistics s1:statistics1){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parse = dateFormat.parse(s1.getDays());
            c.setTime(parse);
            int day = c.get(Calendar.DATE);
            s1.setDays(String.valueOf(day-(today-7)));
        }
        for(Statistics s2:statistics2){
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parse = dateFormat.parse(s2.getDays());
            c.setTime(parse);
            int day = c.get(Calendar.DATE);
            s2.setDays(String.valueOf(day-(today-7)));
        }
        Both both = new Both();
        both.setS1(statistics1);
        both.setS2(statistics2);
        resultUitl.setData(both);
        return resultUitl;
    }

    @RequestMapping("/updateLinkman")
    @ResponseBody
    public void updateLinkman(@RequestBody Linkman linkman) {
        messageService.updateLinkman(linkman);
    }

    @RequestMapping("/findLinkman")
    @ResponseBody
    public ResultUitl findLinkman() {
        ResultUitl resultUitl = new ResultUitl();
        // ModelAndView modelAndView = new ModelAndView();
        Linkman linkman = messageService.findLinkman();
        resultUitl.setData(linkman);
        // modelAndView.addObject("linkman",linkman);
        // modelAndView.setViewName("forward:/layuimini-2/page/linkman.jsp");
        return resultUitl;
    }

    @RequestMapping("/uploadQRCode")
    @ResponseBody
    public ResultUitl uploadQRCode(MultipartFile file) {
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        messageService.uploadCompanyImage(filename+".jpg");
//        try {
//            byte[] bytes = file.getBytes();
//            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\linkman\\" + filename));
//            outputStream.write(bytes);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        try {
            file.transferTo(new File("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\linkman\\" + filename+".jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(filename+".jpg");
        return resultUitl;
    }

    @RequestMapping("/msg")
    @ResponseBody
    public ResultUitl findAllMsg(Integer page, Integer limit) {
        ResultUitl resultUitl = new ResultUitl();
        List<Message> messages = messageService.findAll();
        List<Message> messageList = messageService.findMsgByPage(page, limit);
        resultUitl.setCount(messages.size());
        resultUitl.setData(messageList);
        return resultUitl;
    }

    @RequestMapping("/delMsg/{id}")
    @ResponseBody
    public ResultUitl delMsg(@PathVariable Integer id) {
        ResultUitl resultUitl = new ResultUitl();
        messageService.delMsg(id);
        return resultUitl;
    }

    @RequestMapping("/selectMsg")
    @ResponseBody
    public ResultUitl selectMsg(Integer page, Integer limit, String keyword, String start_time, String end_time) {
        ResultUitl resultUitl = new ResultUitl();
        List<Message> messages = messageService.selectMsg(page, limit, keyword, start_time, end_time);
        List<Message> messageList = messageService.selectMsg_(page, limit, keyword, start_time, end_time);
        resultUitl.setCount(messages.size());
        resultUitl.setData(messageList);
        return resultUitl;
    }

    @RequestMapping("/addMsg")
    @ResponseBody
    public ResultUitl addMsg(String name, String telphone, String content) throws IOException {
        ResultUitl resultUitl = new ResultUitl();
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateFormat.format(date);
        messageService.addMsg(time,name,telphone,content);
        return resultUitl;
    }
}
