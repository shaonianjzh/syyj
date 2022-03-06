package syyj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import syyj.domain.*;
import syyj.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/findAllSpace")
    @ResponseBody
    public List<Type> findAllSpace(){
        List<Type> allType = productService.findAllSpace();
        return allType;
    }

    @RequestMapping("/findAllMaterial")
    @ResponseBody
    public List<Type> findAllMaterial(){
        List<Type> allType = productService.findAllMaterial();
        return allType;
    }

    @RequestMapping("/findAllType")
    @ResponseBody
    public List<Type> findAllType(){
        List<Type> allType = productService.findAllType();
        return allType;
    }

    @RequestMapping("/editType")
    @ResponseBody
    public ResultUitl editType(@RequestBody TypeEdit type){
        ResultUitl resultUitl = new ResultUitl();
        productService.editType(type);
        return resultUitl;
    }
    @RequestMapping("/editMaterial")
    @ResponseBody
    public ResultUitl editMaterial(@RequestBody TypeEdit type){
        ResultUitl resultUitl = new ResultUitl();
        productService.editMaterial(type);
        return resultUitl;
    }
    @RequestMapping("/editSpace")
    @ResponseBody
    public ResultUitl editSpace(@RequestBody TypeEdit type){
        ResultUitl resultUitl = new ResultUitl();
        productService.editSpace(type);
        return resultUitl;
    }

    @RequestMapping("/findType/{name}")
    public ModelAndView findType(@PathVariable("name") String name){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("name",name);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit_type.jsp");
        return modelAndView;
    }
    @RequestMapping("/findMaterial/{name}")
    public ModelAndView findMaterial(@PathVariable("name") String name){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("name",name);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit_material.jsp");
        return modelAndView;
    }
    @RequestMapping("/findSpace/{name}")
    public ModelAndView findSpace(@PathVariable("name") String name){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("name",name);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit_space.jsp");
        return modelAndView;
    }

    @RequestMapping("/delType/{name}")
    @ResponseBody
    public ResultUitl delType(@PathVariable("name") String name) {
        ResultUitl resultUitl = new ResultUitl();
        productService.delType(name);
        return resultUitl;
    }
    @RequestMapping("/delMaterial/{name}")
    @ResponseBody
    public ResultUitl delMaterial(@PathVariable("name") String name) {
        ResultUitl resultUitl = new ResultUitl();
        productService.delMaterial(name);
        return resultUitl;
    }
    @RequestMapping("/delSpace/{name}")
    @ResponseBody
    public ResultUitl delSpace(@PathVariable("name") String name) {
        ResultUitl resultUitl = new ResultUitl();
        productService.delSpace(name);
        return resultUitl;
    }

    @RequestMapping("/addType")
    @ResponseBody
    public ResultUitl addType(@RequestBody Type type) {
        ResultUitl resultUitl = new ResultUitl();
        productService.addType(type);
        return resultUitl;
    }
    @RequestMapping("/addMaterial")
    @ResponseBody
    public ResultUitl addMaterial(@RequestBody Type type) {

        ResultUitl resultUitl = new ResultUitl();
        productService.addMaterial(type);
        return resultUitl;
    }
    @RequestMapping("/addSpace")
    @ResponseBody
    public ResultUitl addSpace(@RequestBody Type type) {

        ResultUitl resultUitl = new ResultUitl();
        productService.addSpace(type);
        return resultUitl;
    }

    @RequestMapping("/selectProduct")
    @ResponseBody
    public ResultUitl selectProduce(Integer page, Integer limit, String type, String material, String space) {
        ResultUitl resultUitl = new ResultUitl();
        List<Product> products = productService.findProduct(page, limit, type, material, space);
        //分页查找
        List<Product> productList = productService.findProduct_(page,limit,type,material,space);
        resultUitl.setCount(products.size());
        resultUitl.setData(productList);
        return resultUitl;
    }

    @RequestMapping("/manage")
    @ResponseBody
    public ResultUitl findAll(Integer page, Integer limit) {
        ResultUitl resultUitl = new ResultUitl();
        List<Product> products = productService.findAll();
        List<Product> productList = productService.findProductByPage(page, limit);
        resultUitl.setCount(products.size());
        resultUitl.setData(productList);
        return resultUitl;
    }

    @RequestMapping("/delProduct/{id}")
    @ResponseBody
    public ResultUitl delProduct(@PathVariable("id") Long id) {
        ResultUitl resultUitl = new ResultUitl();
        productService.delProduct(id);
        return resultUitl;
    }

    @RequestMapping("/addProductImage")
    @ResponseBody
    public ResultUitl addProductImage(MultipartFile file, HttpServletRequest request) {

        ResultUitl resultUitl = new ResultUitl();
        String filename = file.getOriginalFilename();
        Date date = new Date();
        long time = date.getTime();
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream("D:\\BaiduNetdiskWorkspace\\code\\Javacode\\spring项目\\syyj\\src\\main\\webapp\\layuimini-2\\images\\product\\" + filename+time+".jpg"));
            bs.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        request.getServletContext().setAttribute("filename", filename+time+".jpg");
        resultUitl.setData(filename+time+".jpg");
        return resultUitl;
    }

    @RequestMapping("/addProduct")
    @ResponseBody
    public ResultUitl addProduct(@RequestBody Product product, HttpServletRequest request) {
        String filename = (String) request.getServletContext().getAttribute("filename");
        product.setImage(filename);
        ResultUitl resultUitl = new ResultUitl();
        productService.addProduct(product);
        return resultUitl;
    }

    @RequestMapping("/findProduct/{id}")
    public ModelAndView findProduct(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        Product product = productService.findProductById(id);
        modelAndView.addObject("product", product);
        modelAndView.setViewName("forward:/layuimini-2/page/table/edit_product.jsp");
        return modelAndView;
    }

    @RequestMapping("/editProduct")
    @ResponseBody
    public ResultUitl editProduct(@RequestBody Product product, HttpServletRequest request) {
        ResultUitl resultUitl = new ResultUitl();
        String filename = (String) request.getServletContext().getAttribute("filename");
        product.setImage(filename);
        productService.editProduct(product);
        return resultUitl;
    }

    @RequestMapping("/findProductType")
    @ResponseBody
    public ResultUitl findProductType() {
        ResultUitl resultUitl = new ResultUitl();
        List<ProductCategory> products = productService.findProductType();
        resultUitl.setData(products);
        return resultUitl;
    }


    @RequestMapping("/findProductMaterial")
    @ResponseBody
    public ResultUitl findProductMaterial() {
        ResultUitl resultUitl = new ResultUitl();
        List<ProductCategory> products = productService.findProductMaterial();
        resultUitl.setData(products);
        return resultUitl;
    }

    @RequestMapping("/findProductSpace")
    @ResponseBody
    public ResultUitl findProductSpace() {
        ResultUitl resultUitl = new ResultUitl();
        List<ProductCategory> products = productService.findProductSpace();
        resultUitl.setData(products);
        return resultUitl;
    }
}
