package syyj.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import syyj.dao.ProductDao;
import syyj.domain.Product;
import syyj.domain.ProductCategory;
import syyj.domain.Type;
import syyj.domain.TypeEdit;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<Product> findAll() {
        List<Product> productList = jdbcTemplate.query("select * from product", new BeanPropertyRowMapper<Product>(Product.class));
        return productList;
    }

    @Override
    public void delProduct(Long id) {
        jdbcTemplate.update("delete from product where id = ?",id);
    }

    @Override
    public void insertProduct(Product product) {
        jdbcTemplate.update("insert into product values (?,?,?,?,?,?,?)",null,product.getImage(),product.getModel(),product.getType(),product.getMaterial(),product.getSize(),product.getSpace());
    }

    @Override
    public Product fingProductById(Integer id) {
        return jdbcTemplate.queryForObject("select * from product where id = ?",new BeanPropertyRowMapper<Product>(Product.class),id);
    }

    @Override
    public void editProduct(Product product) {
        jdbcTemplate.update("update product set image = ? ,model = ?,type = ?,material = ?, size = ?, space = ? where id = ?",product.getImage(),product.getModel(),product.getType(),product.getMaterial(),product.getSize(),product.getSpace(),product.getId());
    }

    @Override
    public List<Product> findProduct(Integer page,Integer limit,String type,String material,String space) {
        String sql = " select * from product where 1=1";
        StringBuilder stringBuilder = new StringBuilder(sql);
        if(type!=null&&!"".equals(type)){
            stringBuilder.append(" and type = '"+type+"' ");
        }
        if(material!=null&&!"".equals(material)){
            stringBuilder.append(" and material = '"+material+"' ");
        }
        if(space!=null&&!"".equals(space)){
            stringBuilder.append(" and space = '"+space+"' ");
        }
        List<Product> products = jdbcTemplate.query(stringBuilder.toString(), new BeanPropertyRowMapper<Product>(Product.class));
        return products;
    }
//    分页查找
    @Override
    public List<Product> findProduct_(Integer page,Integer limit,String type,String material,String space) {
        String sql = " select * from product where 1=1";
        StringBuilder stringBuilder = new StringBuilder(sql);
        if(type!=null&&!"".equals(type)){
            stringBuilder.append(" and type = '"+type+"' ");
        }
        if(material!=null&&!"".equals(material)){
            stringBuilder.append(" and material = '"+material+"' ");
        }
        if(space!=null&&!"".equals(space)){
            stringBuilder.append(" and space = '"+space+"' ");
        }

        int start = (page-1)*limit;
        stringBuilder.append(" limit "+start+","+limit+" ");
        List<Product> products = jdbcTemplate.query(stringBuilder.toString(), new BeanPropertyRowMapper<Product>(Product.class));
        return products;
    }

    @Override
    public List<Product> findProductByPage(Integer page, Integer length) {
        int start = (page-1)*length;
        List<Product> productList = jdbcTemplate.query("select * from product limit ?,?", new BeanPropertyRowMapper<Product>(Product.class), start, length);
        return productList;
    }

    @Override
    public List<ProductCategory> findProductType() {
        List<ProductCategory> list = jdbcTemplate.query("select id,tb_type.type  name,count(product.type) number from product right join tb_type on product.type = tb_type.type group by product.type order by id", new BeanPropertyRowMapper<ProductCategory>(ProductCategory.class));
        return list;
    }

    @Override
    public List<ProductCategory> findProductMaterial() {
        List<ProductCategory> list = jdbcTemplate.query("select id,tb_material.material  name,count(product.material) number from product right join tb_material on product.material = tb_material.material group by product.material order by id", new BeanPropertyRowMapper<ProductCategory>(ProductCategory.class));
        return list;
    }

    @Override
    public List<ProductCategory> findProductSpace() {
        List<ProductCategory> list = jdbcTemplate.query("select id,tb_space.space  name,count(product.space) number from product right join tb_space on product.space = tb_space.space group by product.space order by id", new BeanPropertyRowMapper<ProductCategory>(ProductCategory.class));
        return list;
    }

    @Override
    public List<Type> findAllType() {
        List<Type> typeList = jdbcTemplate.query("select * from tb_type", new BeanPropertyRowMapper<Type>(Type.class));
        return typeList;
    }

    @Override
    public void addType(Type type) {
        jdbcTemplate.update("insert into tb_type values(?)",type.getType());
    }

    @Override
    public void delType(String name) {
        jdbcTemplate.update("delete from tb_type where type = ?",name);
    }

    @Override
    public void editType(TypeEdit type) {
        jdbcTemplate.update("update tb_type set type = ?where type=?",type.getType(),type.getName());
    }

    @Override
    public void addMatrial(Type type) {
        jdbcTemplate.update("insert into tb_material values(?)",type.getType());
    }

    @Override
    public void addSpace(Type type) {
        jdbcTemplate.update("insert into tb_space values(?)",type.getType());
    }

    @Override
    public void delMaterial(String name) {
        jdbcTemplate.update("delete from tb_material where material = ?",name);
    }

    @Override
    public void delSpace(String name) {
        jdbcTemplate.update("delete from tb_space where space = ?",name);
    }

    @Override
    public void editMaterial(TypeEdit type) {
        jdbcTemplate.update("update tb_material set material = ?where material = ?",type.getType(),type.getName());
    }

    @Override
    public void editSpace(TypeEdit type) {
        jdbcTemplate.update("update tb_space set space = ? where space = ?",type.getType(),type.getName());
    }

    @Override
    public List<Type> findAllMaterial() {
        List<Type> list = jdbcTemplate.query("select material type from tb_material", new BeanPropertyRowMapper<Type>(Type.class));
        return list;
    }

    @Override
    public List<Type> findAllSpace() {
        List<Type> list = jdbcTemplate.query("select space type from tb_space", new BeanPropertyRowMapper<Type>(Type.class));
        return list;
    }
}
