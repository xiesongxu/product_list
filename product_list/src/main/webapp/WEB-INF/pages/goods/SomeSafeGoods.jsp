<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>商品维护</title>
    <%
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires", 0);
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        String theme = "extlike";
        request.setAttribute("theme", theme);
        String rPath = basePath ;
        request.setAttribute("rPath", rPath);
    %>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/${theme}/jquery-ui/jquery.ui.base.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/${theme}/jquery-ui/jquery.ui.theme.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/${theme}/jquery-ui/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/${theme}/jquery-ui/layout-default.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/common/alert/jquery.alerts.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/common/ztree/zTreeStyle.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/common/uploadify/uploadify.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/${theme}/main.css"/>
    <link rel="stylesheet" type="text/css" href="${rPath}/themes/common/tip-red/tip-red.css"/>

    <script type="text/javascript" src="${rPath}/scripts/jquery-1.6.4.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/common/jquery.metadata.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/common/jquery.tojsonstring.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/common/swfobject.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ztree.core-3.0.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ztree.excheck-3.0.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ztree.exedit-3.0.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ztree.ext.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/WdatePicker.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.layout_1.3.0.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/i18n/jqgrid.locale-cn.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.jqGrid.ext.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.uploadify.v2.1.4.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.validate.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.validate.ext.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/i18n/jquery.validate.messages_cn.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.form.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.form.ext.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.datetime.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.alerts.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.overides.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ui.button.ext.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ui.panel.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.ui.tabs.ext.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.poshytip.js"></script>
    <script type="text/javascript" src="${rPath}/scripts/ui/jquery.harmony.ui.convert.js"></script>
    <script type="text/javascript">
        var templateRoot = "<%= basePath %>";
    </script>
    <script src="${pageContext.request.contextPath}/js/SomeSafeGoods.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/goods.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_style.css">
</head>
<body>
<div class="div_title">
    <div class="div_title_img"><img src="/image/img/tb.gif" width="14" height="14" /></div>
    <div class="div_title_name">当前操作：临近过期商品维护</div>
</div>

<div class="toolbar">
<%--    <button id="importExcel">导入excel</button>--%>
    <button id="addB">增加</button>
    <button id="editB">修改</button>
    <button id="deleteB">删除</button>
    <button id="refreshB">刷新</button>
    <!-- <button id="testB">测试</button> -->
</div>
<table id="goodsTable" style="background-color: #065A93;width: 100%;" cellpadding="1" cellspacing="1"></table>
<hr />
<div class="div_foot">
    <div class="div_foot_left" style="font-size: 14px;">
        总共有 <strong id="resultCount" style="color:#F81055;">0</strong> 件商品,
        当前第 <strong id="currentPage" style="color:#F81055;">0</strong> 页,
        共 <strong id="pageCount" style="color:#F81055;">0</strong> 页
    </div>
    <div class="div_foot_center" id="pageStatus"></div>
    <div class="div_foot_right">
        <table border="0" align="right" cellpadding="0" cellspacing="0" height="22px">
            <tr>
                <td width="42">
                    <a href="javascript:void(0);" id="first"><img src="/product_list_war/image/img/first.gif" /></a>
                </td>
                <td width="48">
                    <a href="javascript:void(0);" id="pre"><img src="/product_list_war/image/img/pre.gif" /></a>
                </td>
                <td width="48">
                    <a href="javascript:void(0);" id="next"><img src="/product_list_war/image/img/next.gif" /></a>
                </td>
                <td width="42">
                    <a href="javascript:void(0);" id="last"><img src="/product_list_war/image/img/last.gif" /></a>
                </td>
                <td width="37" class="STYLE22"><div align="center">转到</div></td>
                <td width="42px;">
                    <select id="page_select">
                        <option value="10">10</option>
                    </select>
                </td>
                <td width="22" class="STYLE22"><div align="center">页</div></td>
                <td width="37" align="left">
                    <a href="javascript:void(0);" id="go"><img src="/product_list_war/image/img/go.gif" /></a>
                </td>
            </tr>
        </table>
    </div>
</div>
<!-- ******************************** 新建或编辑窗口 ******************************** -->
<div id="addDialog" style="display: none;margin: 0;padding: 0 0 0 0;">
    <div class="formarea">
        <form id="goodsForm" method="post">
            <input type="hidden" id="serialno" name="serialno"/>
            <table border="0">
                <tr>
                    <td style="width: 60px;">商品ID:</td>
                    <td style="width: 170px;"><input type="text" id="productID" name="productID" /></td>
                    <td style="width: 60px;">商品名:</td>
                    <td style="width: 170px;"><input type="text" id="productName" name="productName" /></td>
                </tr>
                <tr>
                    <td>总金额:</td>
                    <td><input type="text" id="productValue" name="productValue" maxlength="8" style="width: 135px;"/>元</td>
                    <td>商品总数:</td>
                    <td><input type="text" id="productSum" name="productSum" maxlength="8" /></td>
                </tr>
                <tr>
                    <td>过期时间:</td>
                    <td><input type="text" id="expireDate" name="expireDate" style="width: 135px;"/>天</td>
                    <td>修改时间:</td>
                    <td><input type="date" id="updateDate" name="updateDate" /></td>
                </tr>
                <tr>
                    <td>输入时间:</td>
                    <td><input type="date" id="inputDate" name="inputDate" /></td>
                    <td>用户:</td>
                    <td><input type="text" id="userid" name="userid" /></td>
                </tr>
                <tr>
                    <td valign="top" style="padding-top: 2px;">备注:</td>
                    <td colspan="3"><textarea rows="4" id="remark" name="remark" style="width: 398px;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;color: red;">
                        <span id="errorMsg"></span>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="addExcel" style="display: none;margin: 0;padding: 0 0 0 0;">
        <div class="formarea">
            <form id="excelForm" method="post" >
                <input type="hidden" id="excel" name="excel"/>
                <table border="0">
                    <tr>
                        <td style="width: 100px;">选择文件</td>
                        <td style="width: 130px;"><input type="file" id="file" name="file" /></td>

                    </tr>
                    <tr>
                        <td style="width: 100px;">入库/出库</td>
                        <td style="width: 130px;">
                            <input type="radio" id="1" name="flag" value="1"/>入库
                            <input type="radio" id="2" name="flag" value="2"/>出库
                        </td>
                    </tr>

                </table>
            </form>
        </div>
    </div>

</body>
</html>