package com.storems.admin.dao;

import com.storems.admin.entity.Account;
import com.storems.admin.entity.ProductList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品导入信息Dao层
 */
@Mapper
public interface ProductListDao {

    /**
     * 存储数据
     * @param product
     */
    public void save(ProductList product);

    /**
     * 修改数据
     * @param product
     */
    public void update(ProductList product);

    /**
     * 删除数据
     * @param product
     */
    public void delete(ProductList product);

    /**
     * 批量保存数据
     * @param products
     */
    public void batchSave(@Param("list") List<ProductList> products);

    /**
     * 批量修改数据
     * @param products
     */
    public void batchUpdate(@Param("list") List<ProductList> products);

    /**
     * 查找没有过期的入库商品信息
     * @param productID
     * @return
     */
    public List<ProductList> findByProductId(String productID,String curDate);

    /**
     * 分页查询离保质期有一段时间的商品
     * @param map
     * @return
     */
    public List<Map> findProductSafeListPage(Map map);

    /**
     * 分页查询临近保质期的商品
     * @param map
     * @return
     */
    public List<Map> findProductSomeSafeListPage(Map map);

    /**
     * 分页查询过保质期的商品
     * @param map
     * @return
     */
    public List<Map> findProductUnsafeListPage(Map map);


}