<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/4
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>修改规格参数</title>
</head>
<body>
<div align="center">
    请输入修改后的规格参数信息
    <form id="editMenuPar" method="post">
        <p align="center">
            所属对应的菜单名称：<input type="text" id="menuName" name="menuName" size="20"><br>
            修改的规格参数: <input type="text" id="menuParameter" name="menuParameter" size="20">
            修改的样式选择: <input type="text" id="menuStyleselect" name="menuStyleselect" size="20">
        </p>
        <input type="button" value="修改" onclick="editMenuPar();">
        <input type="reset" value="重置">
    </form>
</div>
<div id="div_4" style="width:50%;"></div>
<script type="text/javascript">
    function editMenuPar() {
        var win = window.parent;
        var arr = win.$('#qq').datagrid("getSelections");
        var parameterId = arr[0].parameterId;
        var menuName = arr[0].menuName;
        var menuParameter = $('#menuParameter').val();
        var menuStyleselect = $('#menuStyleselect').val();
        alert(parameterId + menuName);
        $.ajax({
            type: "POST",//表示请求的提交方式有POST、GET
            url: "${baseURL}/menuParameter/update.mvc",// 请求地址
            data: {
                parameterId: parameterId,
                menuName: menuName,
                menuParameter: menuParameter,
                menuStyleselect: menuStyleselect
            },
            async: false,
            cache: false,
            success: function (data, textStaus, jqXHR) {
                $("#div_4").html(data);
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
        win.$("#qq").datagrid("reload");
        parent.$('#win4').window("close");
    }
    var array = parent.$("#qq").datagrid("getSelections");
    $('#editMenuPar').form('load', {
        menuName: array[0].menuName,
        menuParameter: array[0].menuParameter,
        menuStyleselect: array[0].menuStyleselect,
    });
</script>
</body>
</html>
