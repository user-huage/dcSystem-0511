<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/4
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>重命名菜单名称</title>
</head>
<body>
<div align="center">
    请输入重命名的菜单名称
    <form id="editMenu2" method="post">
        <p align="center">
            重命名的菜单名称: <input type="text" id="menuName" name="menuName" size="20">
        </p>
        <input type="button" value="重命名" onclick="editMenu();">
        <input type="reset" value="重置">
    </form>
</div>
<div id="div_3" style="width:50%;"></div>
<script type="text/javascript">
    function editMenu() {
        var win = window.parent;
        var arr = win.$('#dd').datagrid("getSelections");
        var menuId = arr[0].menuId;
        var menuName = $('#menuName').val();
        alert(menuId);
        /*var cnVal = $("#menuName").val();
         var cnVal = $("#menuId").val();*/
        //使用
        $.ajax({
            type: "POST",//表示请求的提交方式有POST、GET
            url: "${baseURL}/menu2/update.mvc",// 请求地址
            data: {menuId: menuId, menuName: menuName},
            async: false,
            cache: false,
            success: function (data, textStaus, jqXHR) {
                $("#div_3").html(data);
                if (data.code == 200) {
                    alert("1");
                }
            },
            //error表示系统出错，调用的方法
            error: function (data, textStaus) {
                if (data.code == 999) {
                    alert("-1");
                }
            }
        });
        win.$("#dd").datagrid("reload");
        parent.$('#win2').window("close");
    }
    var array = parent.$("#dd").datagrid("getSelections");
    $('#editMenu2').form('load', {
        menuName: array[0].menuName
    });
</script>
</body>
</html>