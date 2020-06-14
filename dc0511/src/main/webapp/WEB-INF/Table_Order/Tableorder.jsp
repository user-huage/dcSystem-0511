<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>餐桌状态管理</title>
</head>
<body>
<form method="post">
<div>
    总部门： <input id="to12" class="easyui-combobox" data-options="
        valueField: 'depName',
        textField: 'depName',
        url: '${proPath}/deptselcetPage.mvc',
        onSelect: function(depName){
            var url = '${proPath}/deptselcetPage.mvc?depName='+depName.depName;
            $('#to14').combobox('reload', url);
        }" />
    分部门： <input id="to14" class="easyui-combobox" data-options="valueField:'depName',textField:'depName'" />
</div>
<div style="float: left"> 餐桌编号:<input id="to15" type="text"  name="diningtableId"/></div>
<div style="float: left">餐桌名称:<input id="to16" type="text"  name="diningtableName"/></div>
<div style="float: left">  座位数:<input id="to17" type="text"  name="seating"/> </div>
<div style="float: left"> 状态:<select id="to18" class="easyui-combobox" name="state"  style="width:200px;">
        <option ></option>
        <c:forEach items="${applicationScope.sysParam.orderTable}" var="orderTable">
            <option value="${orderTable.key}">${orderTable.value}</option>
        </c:forEach>
    </select></div>
<div>
   就餐形式:<select id="to19" class="easyui-combobox" name="repastForm"  style="width:200px;">
     <option VALUE=""></option>
        <option value="整桌">整桌</option>
        <option value="拼桌">拼桌</option>
    </select>
</div>
<input type="button" onclick="toat()" value="查询">
<input type="reset" value="重置">
</form>
</div>

<table id="tableOrder"></table>

<script type="text/javascript">
    function toat(){
        $('#tableOrder').datagrid('load', {
            depName:$("#to14").combobox("getValue"),
            diningtableName:$("[name=diningtableName]").val(),
            diningtableId:$("[name=diningtableId]").val(),
            seating:$("[name=seating]").val(),
            state:$("#to18").combobox("getValue"),
            repastForm:$("#to19").combobox("getValue")
        });
    }


    $(function(){
        $('#tableOrder').datagrid({
            url:'${baseURL}/orderTable/OrderSelectList.mvc',
            columns:[[
                {checkbox:true},
                {field:'depName',title:'部门名称',width:100},
                {field:'diningtableId',title:'餐桌编号',width:100},
                {field:'diningtableName',title:'餐桌名称',width:100},
                {field:'seating',title:'座位数',width:50},
                {field:'repastForm',title:"就餐形式",width:80},
                {field:'orderTime',title:'下单时间',width:200},
                {field:'reservedNumber',title:'预定号码',width:150},
                {field:'beginTime',title:'开始时间',width:200},
                {field:'endTime',title:'结束时间',width:200},
                {field:'wechat',title:'微信标识',width:100},
                {field:'state',title:'订单状态',width:100,formatter:function(state,rec){
                    //                    (1,待就餐 2，正在就餐，3，结束就餐，4，订单退订 5，删除)
                    var stateOrder
                    switch (state){
                        case 1:
                            stateOrder = "待就餐";
                            break;
                        case 2:
                            stateOrder = "正在就餐";
                            break;
                        case 3:
                            stateOrder = "结束就餐";
                            break;
                        case 4:
                            stateOrder = "订单退订";
                            break;
                        default:
                            stateOrder ="当前状态出错";
                            break;
                    }
                    return stateOrder;
                }},
                {field:'remark',title:'备注',width:100}
            ]],
            fitColumns:true,
            toolbar:[{
                text:'正在就餐',
                iconCls:'icon-add',
                handler: function(){
                    var array = $("#tableOrder").datagrid("getSelections");
                    var bool = true;
                    if (array.length == 1) {
                        var state = array[0].state;
                        alert(array[0].state);
                        if(state != 1){
                            bool = false;
                            $.messager.alert('提示消息',"请选择状态为待用餐的订单");
                        }

                        if(bool){
                            $.ajax({
                                type: "POST",
                                url: "${baseURL}/orderTable/updateOrder.mvc",
                                data: "diningtableId="+array[0].diningtableId+"&depName="+array[0].depName+"&reservedNumber="+array[0].reservedNumber+"&state="+2,
                                success: function(i){
                                    if(i>0){
                                        alert("恭喜您，修改成功，共修改了"+i+"条记录！");
                                    }else{
                                        alert("对不起，修改失败！");
                                    }
                                    //重新刷新页面
                                    $("#tableOrder").datagrid("reload");
                                    //请除所有勾选的行
                                    $("#tableOrder").datagrid("clearSelections");
                                },
                                error: function () {
                                    alert("修改错误,请联系管理员");
                                }
                            });

                            /*       }
                             });*/
                        }
                    } else {
                        $.messager.show({
                            title : '操作提示',
                            msg : '请先选择一条要改变的订单。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }

            },'-', {
                text: '结束就餐',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $("#tableOrder").datagrid("getSelections");
                    var bool = true;
                    //alert(array);
                    //判断是否选中
                    if (array.length == 1) {
                        //定义数组，通过下边的用来存储选中记录的Id
//                        var states = new Array();
//                        for (i = 0; i < array.length; i++) {
                        var state = array[0].state;
                        alert(array[0].state);
                        if(state != 2){
                            bool = false;
                            $.messager.alert('提示消息',"请选择状态为正在用餐的订单");
                        }

                        if(bool){
                            $.ajax({
                                type: "POST",
                                url: "${baseURL}/orderTable/updateOrder.mvc",
                                data: "diningtableId="+array[0].diningtableId+"&depName="+array[0].depName+"&reservedNumber="+array[0].reservedNumber+"&state="+3,
                                success: function(i){
                                    if(i>0){
                                        alert("恭喜您，修改成功，共修改了"+i+"条记录！");
                                    }else{
                                        alert("对不起，修改失败！");
                                    }
                                    //重新刷新页面
                                    $("#tableOrder").datagrid("reload");
                                    //请除所有勾选的行
                                    $("#tableOrder").datagrid("clearSelections");
                                },
                                error: function () {
                                    alert("修改错误,请联系管理员");
                                }
                            });

                        }
                    } else {
                        $.messager.show({
                            title : '操作提示',
                            msg : '请先选择一条要改变的订单。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }  },'-', {
                text: '取消订单',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $("#tableOrder").datagrid("getSelections");
                    var bool = true;
                    $.ajax({
                        type: "POST",
                        url: "${baseURL}/orderTable/updateOrder.mvc",
                        data: "diningtableId="+array[0].diningtableId+"&depName="+array[0].depName+"&reservedNumber="+array[0].reservedNumber+"&state="+4,
                        success: function(i){
                            if(i>0){
                                alert("恭喜您，退订成功，共退订了"+i+"条记录！");
                            }else{
                                alert("对不起，退订失败！");
                            }
                            //重新刷新页面
                            $("#tableOrder").datagrid("reload");
                            //请除所有勾选的行
                            $("#tableOrder").datagrid("clearSelections");
                        },
                        error: function () {
                            alert("操作错误,请联系管理员");
                        }
                    });

                }
                },'-',{
                text:'刷新',
                iconCls:'icon-remove',
                handler: function(){
                    $('#tableOrder').datagrid('load', {
                    });
                }
            }],
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
