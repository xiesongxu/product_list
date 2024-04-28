package com.storems.admin.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.storems.admin.entity.ProductList;
import com.storems.admin.service.ProductListService;
import com.storems.admin.utils.ProductUtil;
import com.storems.admin.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理列表页面的control
 */
@Controller
public class ProductListControl {

    @Autowired
    ProductListService productListService;

    /**
     * 查询保质期内的所有商品
     * @param currPage
     * @return
     */
    @RequestMapping("/product_list")
    @ResponseBody
    public String findProductList(int currPage) {
        int begin=(currPage-1)*10;
        int pageSize=10;
        Map map=new HashMap();
        map.put("curDate", ProductUtil.getCurDate());
        map.put("begin",begin);
        map.put("pageSize",pageSize);
        //获取商品列表
        List<Map> productLists =  productListService.findProductList(map);
        //获取商品总数
        int count = productListService.findSumProductList(ProductUtil.getCurDate());
        //处理响应结果
        Map result=new HashMap();
        result.put("data",productLists);
        result.put("resultCount",count);
        if(count%10>0){
            result.put("pageCount",count/10+1);
        }else{
            result.put("pageCount",count/10);
        }
        result.put("currentPage",currPage);
        return JSON.toJSONString(result);
//        return ResultUtil.success( result);
    }

    /**
     * 通过流水号查找对应商品
     * @param serialno
     * @return
     */
    @RequestMapping("/product_info")
    @ResponseBody
    public ResultUtil findProductListBySerialno(String serialno) {
        ProductList product = productListService.findProductBySerialno(serialno);
        return ResultUtil.success( product);
    }

}
