<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>餐桌信息管理</title>

</head>
<body>
<div>

    <form id="cx1" type="post">
        <div>
    总部门： <input id="cx12" class="easyui-combobox" data-options="
        valueField: 'depName',
        textField: 'depName',
        url: '${proPath}/deptselcetPage.mvc',
        onSelect: function(depName){
            var url = '${proPath}/deptselcetPage.mvc?depName='+depName.depName;
            $('#cx14').combobox('reload', url);
        }" />
    分部门： <input id="cx14" class="easyui-combobox" data-options="valueField:'depName',textField:'depName'" />
    </div>
        <div style="float: left"> 餐桌编号:<input id="cx15" type="text"  name="diningtableId"/></div>
        <div style="float: left">餐桌名称:<input id="cx16" type="text"  name="diningtableName"/></div>
        <div style="float: left">  座位数:<input id="cx17" type="text"  name="seating"/> </div>
        <div style="float: left"> 状态:<input id="cx18" type="text"  name="state"/></div>
        <input type="button" onclick="chat()" value="查询">
    </form>
</div>
<table id="table"></table>
<div id="tablewin"></div>

    <script type="text/javascript">
    function chat(){
        alert("diaoyong");
        $('#table').datagrid('load', {
            depName:$("#cx14").combobox("getValue"),
            diningtableName:$("[name=diningtableName]").val(),
            diningtableId:$("[name=diningtableId]").val(),
            seating:$("[name=seating]").val(),
            state:$("[name=state]").val()
        });
    }
    $(function(){

        $('#table').datagrid({
            url:'${baseURL}/table/selectList.mvc',
            columns:[[
                {checkbox:true},
                {field:'depName',value:"",title:'部门名称',width:200},
                {field:'diningtableId',value:"",title:'餐桌编号',width:100},
                {field:'diningtableName',value:"",title:'餐桌名称',width:100},
                {field:'seating',title:'座位数',width:100},
                {field:'qrCode',value:"",title:'下单二维码',width:100,formatter: function (qrCode, rec){
                        //alert(qrCode);
                        return "<img src='"+"/"+qrCode+"'/>";
                        //      "/erweima/table/保养汤火锅三座_保养汤火锅Erweima.gif"
                    }},
                {field:'state',title:'餐桌状态',width:100,},
                {field:'updateTime',value:"",title:'更新时间',width:100},
                {field:'creatTime',value:"",title:'创建时间',width:100},
                {field:'userId',value:"",title:'创建的用户编号',width:100}
            ]],
            fitColumns:true,
            toolbar:[{
                text:'新增',
                iconCls:'icon-add',
                handler: function(){
                    parent.$('#tablewin').window({
                        title:"添加餐桌",
                        width:600,
                        height:400,
                        modal:true,
                        content:"<iframe src='${proPath}/base/goURL/Table/addTable.mvc' height='100%' width='100%' frameborder='0px' ></iframe>"
                    });
                }
            },'-', {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $('#table').datagrid("getSelections");
                    if(array.length==1){
                        if(array[0].state != 0){
                            parent.$('#tablewin').window({
                                title:"更新餐桌",
                                width:600,
                                height:400,
                                modal:true,
                                content:"<iframe src='${proPath}/base/goURL/Table/UpdateTable.mvc' height='100%' width='100%' frameborder='0px' ></iframe>"
                            });
                        }else{
                            alert("餐桌当前不可修改");
                        }
                    }else{
                        $.messager.show({
                            title : '操作提示',
                            msg : '请只选择一条需要修改的记录。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }
            },'-',{
                text:'删除',
                iconCls:'icon-remove',
                handler: function(){
                    var rows = $('#table').datagrid("getSelections");
                    if(0 == rows.length){
                        $.messager.show({
                            title: '提示',
                            msg: '请选择一条',
                            timeout: 3000,
                            showType: 'slide'
                        });
                    }else{
                        alert(rows[0].diningtableId);
                        if (rows.length > 1) {
                            $.messager.show({
                                title: '提示',
                                msg: '只能选择一条',
                                timeout: 3000,
                                showType: 'slide'
                            });
                        }else{
                            if(rows[0].state == 1){
                                $.ajax({
                                    type : "POST",
                                    url: "${baseURL}/table/deleteTable.mvc",
                                    data: "diningtableId="+rows[0].diningtableId+"&depName="+rows[0].depName,
                                    success : function (data) {
                                        if(data>0) {
                                            alert("删除成功");
                                        }else{
                                            alert("删除失败");
                                        }
                                        $('#table').datagrid('reload');
                                    },
                                    error : function () {
                                        alert("系统出错,请稍后再试或联系管理员");
                                    }
                                });
                            }else {
                                alert("餐桌当前不可删除");
                            }
                        }
                    }
                }
            },'-', {
                text: '预定餐桌',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $('#table').datagrid("getSelections");
                    if(array.length==1){
                       var depName = array[0].depName;
                       var  diningtableId = array[0].diningtableId;
                        var diningtableName = array[0].diningtableName;
                        var seating = array[0].seating;
                        var state = array[0].state;
                        if(array[0].state > 2){
                            alert("餐桌当前不可操作");
                        }else{
                            parent.$('#tablewin').window({
                                title:"预定餐桌",
                                width:600,
                                height:400,
                                modal:true,
                                content:"<iframe src='${proPath}/base/goURL/Table_Order/addOrder.mvc' height='100%' width='100%' frameborder='0px' ></iframe>"
                            });}
                    }else{
                        $.messager.show({
                            title : '操作提示',
                            msg : '请只选择一条需要修改的记录。',
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
