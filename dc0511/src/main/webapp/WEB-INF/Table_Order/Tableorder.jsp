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
<table id="tableOrder"></table>

<script type="text/javascript">
    $(function(){
        $('#tableOrder').datagrid({
            url:'${baseURL}/orderTable/OrderSelectList.mvc',
            columns:[[
                {checkbox:true},
                {field:'depName',title:'部门名称',width:100},
                {field:'diningtableId',title:'餐桌编号',width:100},
                {field:'diningtableName',title:'餐桌名称',width:100},
                {field:'seating',title:'座位数',width:100},
                {field:'repastForm',title:"就餐形式",width:100},
                {field:'orderTime',title:'下单时间',width:100},
                {field:'reservedNumber',title:'预定号码',width:100},
                {field:'beginTime',title:'开始时间',width:100},
                {field:'endTime',title:'结束时间',width:100},
                {field:'wechat',title:'微信标识',width:100},
                {field:'state',title:'订单状态',width:100},
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
                        //定义数组，通过下边的用来存储选中记录的Id
//
                           var state = array[0].state;
                            if(state != 1){
                                bool = false;
                                    $.messager.alert('提示消息',"请选择状态为待用餐的订单");
                            }

                       if(bool){
                                $.ajax({
                                    type: "POST",
                                    url: "${baseURL}/orderTable/updateOrder.mvc",
                                    data: "diningtableId="+array[0].diningtableId+"&depName="+array[0].depName+"&state="+2,
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
                    //判断是否选中
                    if (array.length == 1) {

                        var state = array[0].state;
                        if(state != 2){
                            bool = false;
                            $.messager.alert('提示消息',"请选择状态为正在用餐的订单");
                        }

                        if(bool){
                            $.ajax({
                                type: "POST",
                                url: "${baseURL}/orderTable/updateOrder.mvc",
                                data: "diningtableId="+array[0].diningtableId+"&depName="+array[0].depName+"&state="+3,
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
