<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#AddTotalMenuType").combobox({
            data:[{value:'1',text:'菜单'},{value:'0',text:'按钮'}]
        });
        $("#AddTotalMenuType").combobox('select','1');
        $("#AddTotalMenuStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#AddTotalMenuStatus").combobox('select','1');
    });
    function addTotalMenu(){
        $('#AddTotalMenuForm').form('submit', {
            url:'${proPath}/addMenu.mvc',
            onSubmit: function (){
                return $("#AddTotalMenuForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="添加成功！！！") {
                        $("#MenuWindow").window('close');
                        $("#MenuTable").treegrid("load");
                    }
                }
            }
        });
    }
    function addTotalMenuBack() {
        $("#MenuWindow").window('close');
    }
</script>
<form method="post" id="AddTotalMenuForm">
    目录名称：<input name="menuName" id="AddTotalMenuName" class="easyui-validatebox" data-options="required:true"/><br>
    url：<input name="url" id="AddTotalMenuUrl"/><br>
    权限编码：<input name="powerName" id="AddTotalMenuPower"/><br>
    排序：<input name="sort" id="AddTotalMenuSort" value="0"/><br>
    类型：<input name="menuType" id="AddTotalMenuType"/><br>
    状态：<input name="status" id="AddTotalMenuStatus"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addTotalMenu()">添加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="addTotalMenuBack()">返回</a>
</form>
</body>
</html>
