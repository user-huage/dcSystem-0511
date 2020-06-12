<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#UpdateRoleStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#UpdateRoleStatus").combobox('select','${requestScope.role.status}');
        $('#UpdateRoleCreateTime').datetimebox({
            required:true,
            showSeconds:true
        });
    });
    function UpdateRole(){
        $('#upadateRoleForm').form('submit', {
            url:'${proPath}/updateRole.mvc',
            onSubmit: function (){
                return $("#upadateRoleForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="修改成功！！！") {
                        $("#RoleWindow").window('close');
                        $("#RoleTable").datagrid("load");
                    }
                }
            }
        });
    }
    function UpdateRoleBack() {
        $("#RoleWindow").window('close');
    }
</script>
<form id="upadateRoleForm" method="post">
    角色名称：<input name="roleName" id="UpdateRoleId" class="easyui-validatebox" value="${requestScope.role.roleName}" data-options="required:true"/><br>
    创建时间：<input id="UpdateRoleCreateTime" type="text" name="createTime" value="${requestScope.role.createTime}"/><br>
    状态：<input name="status" id="UpdateRoleStatus"/><br>
    <input name="roleId" value="${requestScope.role.roleId}" type="hidden"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="UpdateRole()">修改</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="UpdateRoleBack()">返回</a>
</form>
</body>
</html>
