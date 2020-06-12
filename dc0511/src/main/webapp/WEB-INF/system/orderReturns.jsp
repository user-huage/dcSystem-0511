<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>消费管理</title>
</head>
<body>

<table id="dg11"></table>
<div id="win"></div>
<form id="qwe" method="post">
    <div>
        <label for="orderId">订单编号:</label>
        <input class="easyui-validatebox" id="a" type="text" name="orderId1"   />
        <label for="returnId">退单编号:</label>
        <input class="easyui-validatebox" id="b" type="text" name="returnId1"   />
    </div>
    <input type="button" onclick="queryUser2()" value="查询" data-options="iconCls:'icon-search'"/>

</form>
<script type="text/javascript">

    function queryUser() {

        var row = $('#dg11').datagrid('getSelected');

            $.post(

                '${proPath}/orderReturns/turn.mvc',

                {returnId:row.returnId,returnStatus:row.returnStatus,returnTime:row.returnTime, returnMoney:row.returnMoney,returnReason:row.returnReason,orderPayment:row.orderPayment,returnAuditStatus:row.returnAuditStatus
                ,returnAuditExplain:row.returnAuditExplain,orderId:row.orderId},

                function(msg){

                    $('#win').window({
                     title:"查看",
                     width:1000,
                     height:400,

                     href:'asd.jsp',
                     modal:true
                 });
            },
            "json"
        );


    }
    function queryUser2() {


        $("#dg11").datagrid("load",{
            orderId:$("[name=orderId1]").val(),
            returnId:$("[name=returnId1]").val(),
        });
    }

    $(function(){

        $('#dg11').datagrid({

            url:'${proPath}/orderReturns/selectPage.mvc',
        singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'orderId',title:'原订单编号',width:100},
                {field:'returnId',title:'退单编号',width:100},
                {field:'returnStatus',title:'退单状态',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='已退款';
                        }else if(value=='2'){
                            return value='未退款';
                        }else {
                            return value='异常';
                        }
                    }
                },
                {field:'returnMoney',title:'退款金额',width:100},
                {field:'returnTime',title:'退款时间',width:100},
                {field:'returnReason',title:'退款原因',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='整单取消';
                        }else if(value=='2'){
                            return value='其它';
                        }else {
                            return value='异常';
                        }
                    }},
                {field:'orderPayment',title:'支付方式',width:100,
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
                    }},
                {field:'returnAuditStatus',title:'审核状态',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='已审核';
                        }else if(value=='2'){
                            return value='未审核';
                        }else {
                            return value='异常';
                        }
                    }},
                {field:'returnAuditExplain',title:'审核说明',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='整单取消(允许)';
                        }else if(value=='2'){
                            return value='其它(允许)';
                        }else {
                            return value='未通过';
                        }
                    }},

            ]],
            fitColumns:true,

            toolbar:[{
                text:'查看',
                iconCls: 'icon-remove',
                handler:queryUser
            }],

            //nowrap:false,
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            /* queryParams: {
             userName: '1'
             }
             */
            /* rowStyler: function(index,row){
             if (row.unitcost>80){
             return 'background-color:#6293BB;color:#fff;';
             }
             }, */

            striped:true

        });
    });

</script>
</body>
</html>