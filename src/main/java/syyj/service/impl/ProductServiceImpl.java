package syyj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import syyj.dao.ProductDao;
import syyj.domain.Product;
import syyj.domain.ProductCategory;
import syyj.domain.Type;
import syyj.domain.TypeEdit;
import syyj.service.ProductService;

import java.util.List;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public List<Product> findAll() {

        return productDao.findAll();
    }

    @Override
    public void delProduct(Long id) {
        productDao.delProduct(id);
    }

    @Override
    public void addProduct(Product product) {
        productDao.insertProduct(product);
    }

    @Override
    public Product findProductById(Integer id) {
        return productDao.fingProductById(id);
    }

    @Override
    public void editProduct(Product product) {
        productDao.editProduct(product);
    }

    @Override
    public List<Product> findProduct(Integer page,Integer limit,String type,String material,String space) {
        return productDao.findProduct(page, limit, type, material, space);
    }

    @Override
    public List<Product> findProductByPage(Integer page, Integer limit) {
        return productDao.findProductByPage(page,limit);
    }

    @Override
    public List<ProductCategory> findProductType() {
        return productDao.findProductType();
    }

    @Override
    public List<ProductCategory> findProductMaterial() {
        return productDao.findProductMaterial();
    }

    @Override
    public List<ProductCategory> findProductSpace() {
        return productDao.findProductSpace();
    }

    @Override
    public List<Type> findAllType() {
        return productDao.findAllType();
    }

    @Override
    public void addType(Type type) {
        productDao.addType(type);
    }

    @Override
    public void delType(String name) {
        productDao.delType(name);
    }

    @Override
    public void editType(TypeEdit type) {
        productDao.editType(type);
    }

    @Override
    public void addMaterial(Type type) {
        productDao.addMatrial(type);
    }

    @Override
    public void addSpace(Type type) {
        productDao.addSpace(type);
    }

    @Override
    public void delMaterial(String name) {
        productDao.delMaterial(name);
    }

    @Override
    public void delSpace(String name) {
        productDao.delSpace(name);
    }

    @Override
    public void editMaterial(TypeEdit type) {
        productDao.editMaterial(type);
    }

    @Override
    public void editSpace(TypeEdit type) {
        productDao.editSpace(type);
    }

    @Override
    public List<Type> findAllMaterial() {
        return productDao.findAllMaterial();
    }

    @Override
    public List<Type> findAllSpace() {
        return productDao.findAllSpace();
    }

    @Override
    public List<Product> findProduct_(Integer page, Integer limit, String type, String material, String space) {
        return productDao.findProduct_(page,limit,type,material,space);
    }
}
