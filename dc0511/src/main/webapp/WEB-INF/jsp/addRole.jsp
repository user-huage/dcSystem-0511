<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#AddRoleStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#AddRoleStatus").combobox('select','1');
        $('#AddRoleCreateTime').datetimebox({
            required:true,
            showSeconds:true
        });
    });
    function addRole(){
        $('#addRoleForm').form('submit', {
            url:'${proPath}/addRole.mvc',
            onSubmit: function (){
                return $("#addRoleForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="添加成功！！！") {
                        $("#RoleWindow").window('close');
                        $("#RoleTable").datagrid("load");
                    }
                }
            }
        });
    }
    function addRoleBack() {
        $("#RoleWindow").window('close');
    }
</script>
<form id="addRoleForm" method="post">
    角色名称：<input name="roleName" id="AddRoleName" class="easyui-validatebox" data-options="required:true"/><br>
    创建时间：<input id="AddRoleCreateTime" type="text" name="createTime"/><br>
    状态：<input name="status" id="AddRoleStatus"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addRole()">添加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="addRoleBack()">返回</a>
</form>
</body>
</html>
