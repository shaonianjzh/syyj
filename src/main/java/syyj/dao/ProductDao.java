package syyj.dao;

import syyj.domain.Product;
import syyj.domain.ProductCategory;
import syyj.domain.Type;
import syyj.domain.TypeEdit;

import java.util.List;

public interface ProductDao {
    List<Product> findAll();

    void delProduct(Long id);

    void insertProduct(Product product);

    Product fingProductById(Integer id);

    void editProduct(Product product);

    List<Product> findProduct(Integer page,Integer limit,String type,String material,String space);

    List<Product> findProductByPage(Integer page, Integer limit);

    List<ProductCategory> findProductType();

    List<ProductCategory> findProductMaterial();

    List<ProductCategory> findProductSpace();

    List<Type> findAllType();

    void addType(Type type);

    void delType(String name);

    void editType(TypeEdit type);

    void addMatrial(Type type);

    void addSpace(Type type);

    void delMaterial(String name);

    void delSpace(String name);

    void editMaterial(TypeEdit type);

    void editSpace(TypeEdit type);

    List<Type> findAllMaterial();

    List<Type> findAllSpace();

    List<Product> findProduct_(Integer page, Integer limit, String type, String material, String space);
}
