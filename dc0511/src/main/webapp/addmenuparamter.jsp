<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/4
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>添加规格参数</title>
</head>
<body>
<div align="center">
    请输入规格参数信息
    <form>
        <p align="center">
            所属菜单名称:<input id="ccc" name="menuName"><br>
            规格参数: <input type="text" id="menuParameter" size="20">
            样式选择: <input type="text" id="menuStyleselect" size="20">
        </p>
        <input type="button" value="添加" onclick="addMenuParameter();">
        <input type="reset" value="重置">
    </form>
</div>
<script type="text/javascript">
    $('#ccc').combobox({
        url: '${baseURL}/menu2/selectMenu.mvc',
        valueField: 'menuId',
        textField: 'menuName'
    });
    function addMenuParameter() {
        var s1 = $("#ccc").combobox('getText');
        alert(s1);
        var cnVal = $("#menuParameter").val();
        var cnNal = $("#menuStyleselect").val();
        alert(s1 + cnVal + cnNal);
        $.ajax({
            type: "POST",//表示请求的提交方式有POST、GET
            url: "${baseURL}/menuParameter/insert.mvc",// 请求地址
            traditional: true,
            cache: false,
            dataType: "json",
            data: {menuName: s1, menuParameter: cnVal, menuStyleselect: cnNal},//请求的数据
            success: function () {
                alert('添加成功');
            },
            error: function () {
                alert("系统出错了！");
            }
        });
        $("#qq").datagrid("reload");
        $("#win3").window("close");
    }
</script>
</body>
</html>
