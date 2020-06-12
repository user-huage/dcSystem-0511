<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#SetEmpRoleTree").tree({
            url:'${proPath}/setEmpRole.mvc?roleId='+${requestScope.role.roleId},
            method:'post',
            checkbox:true
        });
    });
    function saveEmpRole() {
        var nodes=$("#SetEmpRoleTree").tree("getChecked");
        if(nodes.length==0){
            alert("必须设置一个角色！！！");
            return;
        }
        var a=new Array();
        $(nodes).each(function (i,node) {
            a[i]=node.id;
        })
        var empIds=a.toString();
        $.ajax({
            url:"${proPath}/saveRoleEmp.mvc",
            method:"post",
            data:{empIds:empIds,roleId:${requestScope.role.roleId}},
            success:function (data) {
                $("#RoleWindow").window('close');
                if (data.msg) {
                    alert(data.msg);
                }
            }
        });
    }
</script>
<ul id="SetEmpRoleTree"></ul>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="saveEmpRole()">保存</a>
</body>
</html>
