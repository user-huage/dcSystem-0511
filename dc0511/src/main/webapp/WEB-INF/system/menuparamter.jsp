<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/4
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>规格参数管理</title>
</head>
<body>
<form id="ppp" method="post">
    <div align="center">
        <label for="menuName">菜单名称:</label>
        <input class="easyui-validatebox" type="text" name="menuName_par"/>
        <input type="button" onclick="queryMenuPara()" value="搜索">
    </div>
</form>
<table id="qq" title="规格参数管理列表"></table>
<div id="win3"></div>
<div id="win4"></div>
<script type="text/javascript">
    function queryMenuPara() {
        $("#qq").datagrid("load", {
            parameterId: $("[name=parameterId]").val(),
            menuName: $("[name=menuName_par]").val(),
            menuParameter: $("[name=menuParameter]").val(),
            menuStyleselect: $("[name=menuStyleselect]").val()
        });
    }
    $(function () {
        $('#qq').datagrid({
            url: '${baseURL}/menuParameter/selectPage.mvc',
            columns: [[
                {checkbox: true},
                {field: 'menuName', title: '菜单名称', width: 100},
                {field: 'menuParameter', title: '规格参数', width: 100},
                {field: 'menuStyleselect', title: '样式选择', width: 100}
            ]],
            fitColumns: true,
            toolbar: [{
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    $('#win3').window({
                        title: "添加规格参数",
                        width: 800,
                        height: 600,
                        href: '/addmenuparamter.jsp',
                        modal: true
                    });
                }
            }, '-', {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $("#qq").datagrid("getSelections");
                    if (array.length == 1) {
                        parent.$('#win4').window({
                            title: '修改规格参数',
                            width: 800,
                            height: 600,
                            modal: true,
                            content: "<iframe src='../../editmenuparamter.jsp' height='100%' width='100%' frameboder='0px'></iframe>"
                        });
                    } else {
                        $.messager.show({
                            title: '操作提示',
                            msg: '请只选择一条需要修改的记录。',
                            timeout: 4000,
                            showType: 'slide'
                        });
                    }
                }
            }, '-', {
                text: '清除',
                iconCls: 'icon-remove',
                handler: function del(index) {
                    var r = $('#qq').datagrid('getSelected');
                    if (r == null) {
                        alert("请选择一项要清除规格参数");
                        return false;
                    }
                    $.messager.confirm('确认', '确认清除', function (row) {
                        if (row) {
                            $.ajax({
                                url: '${baseURL}/menuParameter/delete.mvc',
                                method: "post",
                                data: "parameterId=" + r.parameterId,
                                success: function () {
                                    alert('清除成功');
                                    $("#qq").datagrid("reload");
                                }
                            });
                        }
                    })
                }
            }],
            pagination: true,
            rownumbers: true,
            pageSize: 5,
            pageList: [5, 10, 15, 20, 25],
            striped: true
        });
    });
</script>
</body>
</html>
