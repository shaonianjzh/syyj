package syyj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import syyj.domain.*;
import syyj.service.CompanyService;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author 少年
 */
@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/getJoin")
    @ResponseBody
    public ResultUitl getJoin() {
        ResultUitl resultUitl = new ResultUitl();
        Join join = companyService.findJoin();
        resultUitl.setData(join);
        return resultUitl;
    }

    @RequestMapping("/findImage")
    @ResponseBody
    public ResultUitl findImage() {
        ResultUitl resultUitl = new ResultUitl();
        CompanyIntroduce introduce = companyService.findImage();
        resultUitl.setData(introduce);
        return resultUitl;
    }

    @RequestMapping("/joinUploadImage")
    @ResponseBody
    public ResultUitl joinUploadImage(MultipartFile file){
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        Image image = new Image();
        image.setSrc("http://localhost:8080/syyj_war_exploded/layuimini-2/images/join/"+filename);
        image.setTitle(filename);
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\join\\"+filename));
            outputStream.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(image);
        return resultUitl;
    }

    @RequestMapping("/joinAdvantage")
    @ResponseBody
    public void joinAdvantage(@RequestBody String file){

        companyService.addAdvantage(file);
    }

    @RequestMapping("/joinCondition")
    @ResponseBody
    public void joinCondition(@RequestBody String file){

        companyService.joinCondition(file);
    }

    @RequestMapping("/joinProgress")
    @ResponseBody
    public void joinProgress(@RequestBody String file){

        companyService.joinProgress(file);
    }
    
    @RequestMapping("companyIntroduce")
    @ResponseBody
    public void companyIntroduce(@RequestBody String file){
        companyService.addIntroduce(file);
    }

    @RequestMapping("/introduce")
    @ResponseBody
    public ResultUitl companyIntroduceImage(MultipartFile file){
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        Image image = new Image();
        image.setSrc("http://localhost:8080/syyj_war_exploded/layuimini-2/images/introduce/"+filename);
        image.setTitle(filename);
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\introduce\\"+filename));
            outputStream.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(image);
        return resultUitl;
    }

    @RequestMapping("/uploadImage")
    @ResponseBody
    public ResultUitl companyImage(MultipartFile file) {
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        Date date = new Date();
        long time = date.getTime();
        companyService.uploadCompanyImage(filename+time+".jpg");

        try {
            file.transferTo(new File("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\"+filename+time+".jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(filename+time+".jpg");
        return resultUitl;
    }
    @RequestMapping("/updateHonorImage")
    @ResponseBody
    public ResultUitl updateHonorImage(MultipartFile file, Integer id) {
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        companyService.updateHonorImage(filename,id);
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\honor\\"+filename));
            outputStream.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(filename);
        return resultUitl;
    }
    @RequestMapping("/uploadHonorImage")
    @ResponseBody
    public ResultUitl HonorImage(MultipartFile file) {
        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        companyService.uploadHonorImage(filename);
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\honor\\"+filename));
            outputStream.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        resultUitl.setData(filename);
        return resultUitl;
    }


    @RequestMapping("/culture")
    @ResponseBody
    public ResultUitl companyCulture() {
        List<Culture> cultures = companyService.findAll();
        ResultUitl resultUitl = new ResultUitl();
        resultUitl.setData(cultures);
        return resultUitl;
    }

    @RequestMapping("/development")
    @ResponseBody
    public ResultUitl companyDevelopment() {
        List<Achievement> achievements = companyService.findAllAchievement();
        ResultUitl resultUitl = new ResultUitl();
        resultUitl.setData(achievements);
        return resultUitl;
    }

    @RequestMapping("/honor")
    @ResponseBody
    public ResultUitl companyHonor() {
        List<Honor> honors = companyService.findAllHonor();
        ResultUitl resultUitl = new ResultUitl();
        resultUitl.setData(honors);
        return resultUitl;
    }

    @RequestMapping("/delCulture/{id}")
    @ResponseBody
    public ResultUitl delCulture(@PathVariable("id") Long id) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.delCulture(id);
        return resultUitl;
    }

    @RequestMapping("/delAchievement/{id}")
    @ResponseBody
    public ResultUitl delAchievement(@PathVariable("id") Long id) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.delAchievement(id);
        return resultUitl;
    }

    @RequestMapping("/delHonor/{id}")
    @ResponseBody
    public ResultUitl delHonor(@PathVariable("id") Long id) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.Honor(id);
        return resultUitl;
    }

    @RequestMapping("/addCulture")
    @ResponseBody
    public ResultUitl addCulture(@RequestBody Culture culture) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.addCulture(culture);
        return resultUitl;
    }

    @RequestMapping("/findCulture/{id}")
    public ModelAndView findCulture(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        Culture culture = companyService.finCulture(id);
        modelAndView.addObject("culture", culture);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit.jsp");
        return modelAndView;
    }

    @RequestMapping("/editCulture")
    @ResponseBody
    public ResultUitl editCulture(@RequestBody Culture culture) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.editCulture(culture);
        return resultUitl;
    }

    @RequestMapping("/addAchievement")
    @ResponseBody
    public ResultUitl addAchievement(@RequestBody Achievement achievement) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.addAchievement(achievement);
        return resultUitl;
    }

    @RequestMapping("/findAchievement/{id}")
    public ModelAndView findAchievement(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        Achievement achievement = companyService.findAchievement(id);
        modelAndView.addObject("achievement", achievement);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit_achievement.jsp");
        return modelAndView;
    }

    @RequestMapping("/editAchievement")
    @ResponseBody
    public ResultUitl editAchievement(@RequestBody Achievement achievement) {
        ResultUitl resultUitl = new ResultUitl();
        companyService.editAchievement(achievement);
        return resultUitl;
    }
}
