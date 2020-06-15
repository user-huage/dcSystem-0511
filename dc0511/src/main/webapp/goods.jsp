<%@ page import="com.hx.dc.entity.Goods" %>
<%@ include file="/common/common.jspf" %>
<%--
  Created by IntelliJ IDEA.
  User: SuperMr.gong
  Date: 2020/6/4
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%--  <style type="text/css">
        table{
            background:red;
        }
    </style>--%>
    <title>Title</title>
</head>
<body>
<table id="dg5"></table>
<div id="sb"></div>

<script type="text/javascript">
 function shopping() {
     var array = $("#dg5").datagrid("getSelections");
     console.info(array);
     console.info(array.rows);
     if(array.length===0){
         $.messager.alert('提示','请选择需要采购的商品！','info');
         return false;
     }
     if(array.length>0){
         //定义数组，通过下边的用来存储选中记录的Id
         var ids = new Array();
         for (i = 0; i < array.length; i++) {
             ids[i] = array[i].goodsId;
            // alert(ids[i]);
         }
        // alert(ids);
     }
   $.ajax({
         url: "${proPath}/goods/shop.mvc",
         type:"post",
         //设置为传统方式传送参数
         traditional:true,
         data: {ids:ids},
         success:function(msg){
            // alert( "Data Saved: " + msg.a );
             $('#sb').window({
                 title:"购物车",
                 width:1000,
                 height:400,
                 href:'shopping.jsp',
                 modal:true
             });
         },
         dataType:'json'

     });


  }
 $(function () {
     $('#dg5').datagrid({
      url:'${proPath}/goods/selectPage.mvc',
         singleSelect:false,
         columns:[[
             {checkbox:true},
             {field:'goodsNumber',title:'商品编号',width:100},
             {field:'goodsName',title:'商品名称',width:100},
             {field:'goodsPrice',title:'价格',width:100},
             {field:'goodsImage',title:'商品图片',width: 100, align: 'center',
                 formatter: function (value, rec) {//使用formatter格式化刷子
                     return "<img src='/img/"+value+"' style='height: 40px ;width: 40px;'>";
                     }},
             {field:'goodsDescribe',title:'商品描述',width:100},

         ]],
         toolbar:[{
             text:'添加到购物车',
             iconCls: 'icon-add',
             handler:/* function() {
                 //alert('提交按钮');//getRows getColumnOption ,getData
                 var array = $("#dg5").datagrid("getSelections");
                 console.info(array);
                 console.info(array.rows);
                alert( array[0].goodName);
                 if(array.length===0){
                     $.messager.alert('提示','请选择需要采购的商品！','info');
                     return false;
                 }
                 if(array.length>0){
                     //定义数组，通过下边的用来存储选中记录的Id
                     var ids = new Array();
                     for (i = 0; i < array.length; i++) {
                         ids[i] = array[i].goodId;
                         //alert(ids[i]);
                     }
                 }

             }*/
             shopping
         }],
         fitColumns:true,
         pagination:true,
         rownumbers:false,
         pageSize:10,
         pageList:[10,20,30,40,50],
         striped:true

     })
 })

</script>
</body>
</html>
