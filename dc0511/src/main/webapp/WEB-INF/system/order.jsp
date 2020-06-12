<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>消费管理</title>
</head>
<body>
<form id="ff" method="post">
    <div>
        <label for="orderId">订单编号:</label>
        <input class="easyui-validatebox" id="a" type="text" name="orderId"   />
        <label for="diningtableId">餐桌编号:</label>
        <input class="easyui-validatebox" id="b" type="text" name="diningtableId"   />
        <label for="depId">部门编号：:</label>
        <input class="easyui-validatebox" id="c" type="text" name="depId"   />
    </div>
    <div>
        是否付款<select id="tvb"  name="orderStatus" style="width:150px;">
            <option value="">--请选择--</option>
            <option value="1">付款</option>
            <option value="2">未付款</option>
        </select>
        就餐形式:<select id="tvb2"  name="orderStatus" style="width:150px;">
        <option value="">--请选择--</option>
        <option value="1">整桌</option>
        <option value="2">拼桌</option>
        </select>
    </div>
    <div>
    </div>
    <input type="button" onclick="queryUser()" value="查询" data-options="iconCls:'icon-search'"/>
</form>
<table id="dg"></table>
<div id="win"></div>

<script type="text/javascript">

    function selectdetails() {
        var row = $("#dg").datagrid('getSelected');

        $.post(
            '${proPath}/order/details.mvc',
            {OrderId:row.orderId,orderPayment:row.orderPayment},
            function(msg){

                $('#win').window({
                    title:"查看明细",
                    width:1000,
                    height:400,
                    href:'details.jsp',
                    modal:true
                });
            }

        );
    }


    function queryUser() {
        $("#dg").datagrid("load",{
            orderId:$("[name=orderId]").val(),
            diningtableId:$("[name=diningtableId]").val(),
            depId:$("[name=depId]").val(),
            orderStatus:$("#tvb").val(),
            orderEattype:$("#tvb2").val(),
        });
    }
    $(function(){
        $('#dg').datagrid({
            url:'${proPath}/order/selectPage.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'diningtableId',title:'餐桌编号',width:100},
                {field:'orderEattype',title:'就餐类型',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='整桌';
                        }else if(value=='2'){
                            return value='拼桌';
                        }else {
                            return value='异常';
                        }
                    }
                },
                {field:'orderId',title:'订单编号',width:100},
                {field:'depId',title:'部门编号',width:100},
                {field:'orderAmount',title:'订单金额',width:100},
                {field:'orderMoney',title:'应付金额',width:100},
                {field:'orderStatus',title:'订单状态',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='付款';
                        }else if(value=='2'){
                            return value='未付款';
                        }else {
                            return value='异常';
                        }
                    }},
                {field:'orderPayment',title:'支付方式',width:100, formatter: function (value, row, index) {
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
                {field:'orderProgress',title:'订单进程',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='已接单';
                        }else if(value=='2'){
                            return value='待接单';
                        }else if(value=='3'){
                            return value='取消单';
                        }else {
                            return value='完成单';
                        }
                    }
                },
                {field:'orderTime',title:'下单时间',width:100},
                {field:'orderPaytime',title:'支付时间',width:100,align:'right'}
            ]],
            fitColumns:true,
            toolbar:[{
                text:'打单',
                iconCls: 'icon-add',
                handler: function(){
                    alert('您无权操作');
                    /*  $('#win').window({
                     title:"添加用户",
                     width:600,
                     height:400,
                     href:'adduser.html',
                     modal:true
                     });*/
                }
            },'-',{
                text:'整个结单',
                iconCls: 'icon-edit',
                handler: function(){
                    alert('您无权操作')
                }
            },'-',{
                text:'单个结单',
                iconCls: 'icon-remove',
                handler: function(){
                    //alert('删除按钮')
                    var rows = $('#dg').datagrid("getSelections");
                    //alert(rows.length);
                    for(var i=0;i<rows.length;i++){
                        alert(rows[i].productid);
                    }
                    //$.doAjax();到数据库进行删除

                    //删除完成后，重新刷新页面中datagrid
                    /*
                     $('#dg').datagrid("load");

                     */

                    /*如果不是删除数据库后重新加载数据，而是直接删除页面行，如何处理？
                     1。获取选 中的行   var rows = $('#dg').datagrid("getSelections");
                     2。根据选 中的行，获取该行索引，var index = $('#dg').datagrid("getRowIndex",row);
                     3。删除行    $('#dg').datagrid("deleteRow" index);  删除时索引号要从大往小遍历删除

                     */


                }
            },'-',{
                text:'查看明细',
                iconCls: 'icon-edit',
                handler:selectdetails
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