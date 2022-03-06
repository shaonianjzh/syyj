package syyj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import syyj.domain.Admin;
import syyj.service.AdminService;

import javax.servlet.http.HttpSession;


/**
 * @author 少年
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public ModelAndView login(String username, String password, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        Admin admin = adminService.find(username,password);

        if(admin!=null){
            session.setAttribute("admin",admin);
            modelAndView.addObject("msg","");
            modelAndView.setViewName("redirect:/index.jsp");
           return modelAndView;
        }
        modelAndView.setViewName("forward:/login.jsp");
        modelAndView.addObject("msg","账号或密码错误，请重新输入");
        return modelAndView;
    }
}
