<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/common/common.jspf" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>菜单类目管理</title>
</head>
<body>
<form id="bbb" method="post">
    <div align="center">
        总公司:<input id="totalName" class="easyui-combobox" data-options="
        valueField: 'id',
        textField: 'text',
        url: 'get_data1.php',
        onSelect: function(rec){
            var url = 'get_data2.php?id='+rec.id;
            $('#subName').combobox('reload', url);
        }"/>
        分公司:<input id="subName" class="easyui-combobox" data-options="valueField:'id',textField:'text'"/>
        菜单名称:<input class="easyui-validatebox" type="text" name="menuName"/>
        <input type="button" onclick="queryMenu()" value="搜索">
    </div>
</form>
<table id="dd" title="菜单类目管理列表"></table>
<div id="win1"></div>
<div id="win2"></div>
<script type="text/javascript">
    function queryMenu() {
        $("#dd").datagrid("load", {
            totalName: $("[name=totalName]").val(),
            subName: $("[name=subName]").val(),
            menuName: $("[name=menuName]").val()
        });
    }
    $(function () {
        $('#dd').datagrid({
            url: '${baseURL}/menu2/selectPage.mvc',
            columns: [[
                {checkbox: true},
                {field: 'menuName', title: '菜单名称', width: 100}
            ]],
            fitColumns: true,
            toolbar: [{
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    $('#win1').window({
                        title: "添加菜单名称",
                        width: 800,
                        height: 600,
                        href: "/addmenu2.jsp",
                        modal: true
                    });
                }
            }, '-', {
                text: '重命名',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $("#dd").datagrid("getSelections");
                    if (array.length == 1) {
                        parent.$('#win2').window({
                            title: '重命名菜单名称',
                            width: 800,
                            height: 600,
                            modal: true,
                            content: "<iframe src='../../editmenu2.jsp' height='100%' width='100%' frameboder='0px'></iframe>"
                        });
                    } else {
                        $.messager.show({
                            title: '操作提示',
                            msg: '请只选择一条需要重命名的记录。',
                            timeout: 4000,
                            showType: 'slide'
                        });
                    }
                }
            }, '-', {
                text: '删除',
                iconCls: 'icon-remove',
                handler: function del(index) {
                    var r = $('#dd').datagrid('getSelected');
                    if (r == null) {
                        alert("请选择一项要删除菜单名称");
                        return false;
                    }
                    $.messager.confirm('确认', '确认删除', function (row) {
                        if (row) {
                            $.ajax({
                                url: '${baseURL}/menu2/delete.mvc',
                                method: "post",
                                data: "menuName=" + r.menuName,
                                success: function () {
                                    alert('删除成功');
                                    $("#dd").datagrid("reload");
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