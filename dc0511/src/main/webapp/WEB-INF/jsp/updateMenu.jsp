<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#updateMenuType").combobox({
            data:[{value:'1',text:'菜单'},{value:'0',text:'按钮'}]
        });
        $("#updateMenuType").combobox('select','${requestScope.menu.menuType}');

        $("#updateMenuStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#updateMenuStatus").combobox('select','${requestScope.menu.status}');
    });
    function updateMenu(){
        $('#updateMenuForm').form('submit', {
            url:'${proPath}/updateMenu.mvc',
            onSubmit: function (){
                return $("#updateMenuForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="修改成功！！！") {
                        $("#MenuWindow").window('close');
                        $("#MenuTable").treegrid("load");
                    }
                }
            }
        });
    }
    function updateMenuBack() {
        $("#MenuWindow").window('close');
    }
</script>
<form method="post" id="updateMenuForm">
    目录名称：<input name="menuName" id="updateMenuName" value="${requestScope.menu.menuName}" class="easyui-validatebox" data-options="required:true"/><br>
    url：<input name="url" id="updateMenuUrl" value="${requestScope.menu.url}"/><br>
    权限编码：<input name="powerName" id="updateMenuPower" value="${requestScope.menu.powerName}"/><br>
    排序：<input name="sort" id="updateMenuSort" value="${requestScope.menu.sort}"/><br>
    类型：<input name="menuType" id="updateMenuType"/><br>
    状态：<input name="status" id="updateMenuStatus"/><br>
    <input name="menuId" type="hidden" value="${requestScope.menu.menuId}"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="updateMenu()">修改</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="updateMenuBack()">返回</a>
</form>
</body>
</html>
