<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#AddSubMenuType").combobox({
            data:[{value:'1',text:'菜单'},{value:'0',text:'按钮'}]
        });
        $("#AddSubMenuType").combobox('select','1');
        $("#AddSubMenuStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#AddSubMenuStatus").combobox('select','1');
    });
    function addSubMenu(){
        $('#AddSubMenuForm').form('submit', {
            url:'${proPath}/addMenu.mvc',
            onSubmit: function (){
                return $("#AddSubMenuForm").form("validate");
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
    function addSubMenuBack() {
        $("#MenuWindow").window('close');
    }
</script>
<form method="post" id="AddSubMenuForm">
    目录名称：<input name="menuName" id="AddSubMenuName" class="easyui-validatebox" data-options="required:true"/><br>
    url：<input name="url" id="AddSubMenuUrl"/><br>
    权限编码：<input name="powerName" id="AddSubMenuPower"/><br>
    排序：<input name="sort" id="AddSubMenuSort" value="0"/><br>
    类型：<input name="menuType" id="AddSubMenuType"/><br>
    状态：<input name="status" id="AddSubMenuStatus"/><br>
    <input name="parentId" type="hidden" value="${requestScope.menu.parentId}"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addSubMenu()">添加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="addSubMenuBack()">返回</a>
</form>
</body>
</html>
