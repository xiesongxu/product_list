package com.storems.admin.action;

import com.storems.admin.entity.ProductList;
import com.storems.admin.utils.ProductUtil;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ImportExcelControl {

    @PostMapping("/import")
    @ResponseBody
    public String importExcel(@RequestParam("file") MultipartFile file) {
        try {
            // 读取文件
            Workbook workbook = WorkbookFactory.create(file.getInputStream());
            // 获取第一个工作表
            Sheet sheet = workbook.getSheetAt(0);
            //初始化行值
            int i = 1;
            //初始化列值
            int j = 1;
            //创建集合保存商品数据
            List<ProductList> products = new ArrayList<ProductList>();
            // 迭代行
            for (Row row : sheet) {
                if(i==1) { //第一行不读
                    i++;
                    continue;
                }
                String value = "";
                //创建商品
                ProductList product = new ProductList();
                //添加流水号
                product.setSerialno(ProductUtil.getSerialNo());
                products.add(product);
                j = 1;// 迭代单元格
                for (Cell cell : row) {
                    // 处理单元格数据
                    if (cell.getCellType() == CellType.STRING) {
                        value =  cell.getStringCellValue();
                    } else {
                        value = String.valueOf(cell.getNumericCellValue());
                    }
                    //保存单元格数据
                    switch (j) {
                        case 1 : product.setProductID(value);break;
                        case 2 : product.setProductName(value);break;
                        case 3 : product.setProductValue(value);break;
                        case 4 : product.setProductSum(value);break;
                        case 5 : product.setExpireDate(value);break;
                        case 6 : product.setRemark(value);break;
                        default:break;
                    }
                    j++;
                }
                i++;
            }
            // 关闭workbook
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }
}
