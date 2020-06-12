<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function (){
        $("#SetMenuRoleTree").tree({
            url:'${proPath}/setRoleMenu.mvc?roleId='+${requestScope.role.roleId},
            method:'post',
            checkbox:true,
            cascadeCheck:false
        });
    });
   function saveEmpMenu() {
       var nodes=$("#SetMenuRoleTree").tree("getChecked");
       if(nodes.length==0){
           alert("必须设置一个目录！！！");
           return;
       }
       var a=new Array();
       $(nodes).each(function (i,node) {
           a[i]=node.id;
       });
       var menuIds=a.toString();
       $.ajax({
           url:"${proPath}/saveEmpMenu.mvc",
           method:"post",
           data:{menuIds:menuIds,roleId:${requestScope.role.roleId}},
           success:function (data) {
               $("#RoleWindow").window('close');
               if (data.msg) {
                   alert(data.msg);
               }
           }
       });
   }
</script>
<ul id="SetMenuRoleTree"></ul>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="saveEmpMenu()">保存</a>
</body>
</html>
