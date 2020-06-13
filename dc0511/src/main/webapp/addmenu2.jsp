<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/4
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>添加菜单名称</title>
</head>
<body>
<div align="center">
    请输入需要添加的菜单名称
    <form>
        <p align="center">
            菜单名称: <input type="text" id="menuName" size="20">
        </p>
        <input type="button" value="添加" onclick="addMenu();">
        <input type="reset" value="重置">
    </form>
</div>
<script type="text/javascript">
    function addMenu() {
        var cnVal = $("#menuName").val();
        alert(cnVal)
        //使用
        $.ajax({
            type: "POST",//表示请求的提交方式有POST、GET
            url: "${baseURL}/menu2/insert.mvc",// 请求地址
            data: "menuName=" + cnVal//请求的数据
            /*data:{ menuName:$("[name=menuName]").val()}*/,
            //success表示请求成功后调用的方法，返回信息会自动传给参数msg
            success: function () {
                alert('添加成功');
            },
            //error表示系统出错，调用的方法
            error: function () {
                alert("系统出错了！");
            }
        });
        $("#dd").datagrid("reload");
        $("#win1").window("close");
    }
</script>
</body>
</html>
