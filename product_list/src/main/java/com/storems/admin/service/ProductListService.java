package com.storems.admin.service;

import com.storems.admin.entity.ProductList;

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

}
