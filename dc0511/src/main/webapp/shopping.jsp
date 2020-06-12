<%--
  Created by IntelliJ IDEA.
  User: SuperMr.gong
  Date: 2020/6/5
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="dg6"></table>
<script type="text/javascript">
   $(function () {
       $('#dg6').datagrid({
           url:'${proPath}/goods/list.mvc?list=${sessionScope.d[0]}&list=${sessionScope.d[1]}&list=${sessionScope.d[2]}&list=${sessionScope.d[3]}&list=${sessionScope.d[4]}&list=${sessionScope.d[5]}&list=${sessionScope.d[6]}&list=${sessionScope.d[7]}',
           singleSelect:false,
           columns:[[
               {checkbox:true},
               {field:'goodsId',title:'商品编号',width:100},
               {field:'goodsName',title:'商品名称',width:100},
               {field:'goodsPrice',title:'价格',width:100},
               {field:'goodsImage',title:'商品图片',width: 100, align: 'center',
                   formatter: function (value, rec) {//使用formatter格式化刷子
                       return '<img src=${proPath}' + value + '>';
                   }},
               {field:'asd',title:'数量',width:100,
                   formatter: function (value, rec) {//使用formatter格式化刷子
                       return '<input type="text"  name="num" value="1"/>';
                   }},
           ]],
           fitColumns:true,
           toolbar:[{
               text:'提交订单',
               iconCls: 'icon-add',
               handler:function (){ //删除操作
                   var array = $("#dg6").datagrid("getSelections");
                   $.messager.confirm('确认对话框', '您想要提交订单吗？', function(r){
                       if (r){
                           if(array.length===0){
                               $.messager.alert('提示','请选择需要采购的商品！','info');
                               return false;
                           }
                           var n=document.getElementsByName("num");
                      alert("请您支付")
                           if(array.length>0){

                               var ids = new Array();
                               var num1=new Array();
                               for (i = 0; i < array.length; i++) {
                                  //ids[i] = array[i];
                                 // alert(ids[i].asd);
                                   ids[i]= array[i].goodsId;
                                   num1[i]=n[i].value;
                               }
                               $.ajax({
                                   url: "${proPath}/order/makeorder.mvc",
                                   type:"post",
                                   //设置为传统方式传送参数
                                   traditional:true,
                                   data: {ids:ids,num:num1},
                                   success:function(msg){
                                   },
                                   dataType:'json'

                               });
                               alert("提交成功请耐心等待");
                           }
                       }
                   });


               }
           }],
           pagination:true,
           rownumbers:false,
           pageSize:5,
           pageList:[5,10,15,20,25],
           striped:true
        });
   });
</script>
</body>
</html>
