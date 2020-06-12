<%@ page import="com.hx.dc.entity.Order_Returns" %><%--
  Created by IntelliJ IDEA.
  User: SuperMr.gong
  Date: 2020/5/27
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<table id="dg4"></table>
<script type="text/javascript">
    $(function(){

        $('#dg4').datagrid({
            url:'${proPath}/orderdetails/selectPage.mvc?orderId=${sessionScope.a.orderId}',
            columns:[[
                {field:'goodsId',title:'商品编号',width:100},
                {field:'goodsName',title:'商品名',width:100},
                {field:'goodNumber',title:'数量',width:100},
                {field:'goodsPrice',title:'单价',width:100},
                {field:'orderDetailsAmount',title:'总价',width:100},
                {field:'orderId',title:'订单编号',width:100},
                {field:'orderDetailsPayment',title:'支付方式',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='微信支付';
                        }else if(value=='2'){
                            return value='支付宝支付';
                        }else if(value='3'){
                            return value='';
                        }
                        else  if (value=='0'){
                            return value='null';
                        }
                }
                },
                {field:'orderDetailsPaytime',title:'下单时间',width:100},
            ]],
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            striped:true
        });
    });
</script>
</body>
</html>
