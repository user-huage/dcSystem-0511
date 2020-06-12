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
<table id="dg2"></table>
<script type="text/javascript">


    $(function(){

$('#dg2').datagrid({

url:'${proPath}/details/selectPage.mvc?orderId=${sessionScope.s.orderId}',

    columns:[[
        {field:'goodsName',title:'商品名',width:100},
        {field:'returnId',title:'退单编号',width:100},
        {field:'orderId',title:'原订单编号',width:100},
        {field:'returnNum',title:'数量',width:100},
        {field:'returnMoney',title:'总价',width:100},
        {field:'goodsPrice',title:'单价',width:100},
    ]],
    pagination:true,
    rownumbers:true,
    pageSize:5,
    pageList:[5,10,15,20,25],

    striped:true
});
});

</script>
退单编号<input type="text" value=${sessionScope.s.returnId}>
退款状态<input type="text" value=${sessionScope.s.returnStatus}>
退款时间<input type="text" value=${sessionScope.s.returnTime}>
退款金额<input type="text" value=${sessionScope.s.returnMoney}>
<br>
退款原因<input type="text" value=${sessionScope.s.returnReason}>
支付方式<input type="text" value=${sessionScope.s.orderPayment}>
审核状态<input type="text" value=${sessionScope.s.returnAuditStatus}>
审核说明<input type="text" value=${sessionScope.s.returnAuditExplain}>
<br>
原订单编号<input type="text" value=${sessionScope.s.orderId}>
</body>
</html>
