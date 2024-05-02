package com.storems.admin.service;

import com.storems.admin.entity.ProductList;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品信息服务层接口
 */
public interface ProductListService {

    /**
     * 批量保存
     * @param products
     * @return
     */
    public String batchSave(List<ProductList> products);

    /**
     * 批量修改
     * @param products
     * @return
     */
    public String batchUpdate(List<ProductList> products);

    /**
     * 查询离保质期有一段时间的商品
     * @param map
     * @return
     */
    public List<ProductList> findProductSafeListPage(Map map);

    /**
     * 查询保质期内的所有商品
     * @param map
     * @return
     */
    public List<Map> findProductList(Map map);

    /**
     * 查询在保质期内商品的总数
     * @param curDate
     * @return
     */
    public int findSumProductList(String curDate);

    /**
     * 通过流水号查找对应商品
     * @param serialno
     * @return
     */
    public ProductList findProductBySerialno(String serialno);

    /**
     * 新增一条商品数据
     * @param productList
     */
    public void save(ProductList productList);

    /**
     * 修改数据
     * @param product
     */
    public void update(ProductList product);

    /**
     * 删除数据
     * @param serialno
     */
    public void delete(String serialno);

    /**
     * 查询商品的条数
     * @param curDate
     * @return
     */
    public int findCountProductList(String curDate);

    /**
     * 查询已出库的商品列表
     * @param map
     * @return
     */
    public List<Map> findProductOutListPage(Map map);

    /**
     * 查询临近过期的商品列表
     * @param map
     * @return
     */
    public List<Map> findProductSomeSafeListPage(Map map);

    /**
     * 查询已过期的商品列表
     * @param map
     * @return
     */
    public List<Map> findProductUnsafeListPage(Map map);

    /**
     * 出库商品总数
     * @param curDate
     * @return
     */
    public int findCountOutProductList(String curDate);

    /**
     * 临近过期商品总数
     * @param curDate
     * @return
     */
    public int findCountSomeSafeProductList(String curDate);

    /**
     * 过期商品总数
     * @param curDate
     * @return
     */
    public int findCountUnsafeProductList(String curDate);
}