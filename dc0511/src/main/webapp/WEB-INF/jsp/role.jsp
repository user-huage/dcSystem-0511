<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#RoleTable').datagrid({
            url:'${proPath}/queryAllRole.mvc',
            method:'post',
            columns:[[
                {checkbox:true},
                {field:'roleId',title:'角色编号'},
                {field:'roleName',title:'角色名称'},
                {field:'status',title:'状态'},
                {field:'createTime',title:'创建时间'}
            ]],
            loadMsg:'正在加载数据，请稍等',
            striped:true,
            rownumbers:true,
            pagination:true,
            toolbar:[
                {text:'添加角色', iconCls:'icon-add',
                    handler:function(){
                        $("#RoleWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=addRole'
                        });
                    }
                },
                {text:'修改角色', iconCls:'icon-add',
                    handler:function(){
                        var roleTables=$('#RoleTable').datagrid('getChecked');
                        if(roleTables.length>1){
                            alert("只能选择一个角色进行修改！！！");
                            return;
                        }else if(roleTables.length==0){
                            alert("必须选择一个角色才能进行修改！！！");
                            return;
                        }
                        var a;
                        if(roleTables[0].status=="可用"){
                            a='1';
                        }else {
                            a='0';
                        }
                        $("#RoleWindow").window({
                            width:600,
                            height:400,
                            href:"${proPath}/goUrl.mvc?src=updateRole&roleId="+roleTables[0].roleId+"&roleName="+roleTables[0].roleName+"&status="+a+"&createTime="+roleTables[0].createTime
                        });
                    }
                },
                {text:'删除角色', iconCls:'icon-add',
                    handler:function(){
                        var roleTables=$('#RoleTable').datagrid('getChecked');
                        if(roleTables.length==0){
                            alert("必须选择一个角色才能进行删除！！！");
                            return;
                        };
                        var a=new Array();
                        $(roleTables).each(function (i,role) {
                            a[i]=role.roleId;
                        });
                        var roleIds=a.toString();
                        $.messager.confirm("删除框","确认要删除吗？",function(r){
                            if(r){
                                $.ajax({
                                    url:"${proPath}/deleteRole.mvc",
                                    method:"post",
                                    data:{roleIds:roleIds},
                                    success:function (msgg) {
                                        if (msgg.msg) {
                                            alert(msgg.msg);
                                            if(msgg.msg=="删除成功！！！") {
                                                $("#RoleTable").datagrid("load");
                                            }
                                        }
                                    }
                                });
                            }
                        });
                    }
                },
                {text:'设置人员', iconCls:'icon-add',
                    handler:function(){
                        var roleTables=$('#RoleTable').datagrid('getChecked');
                        if(roleTables.length==0){
                            alert("必须选择一个角色才能设置人员！！！");
                            return;
                        }else if(roleTables.length>1){
                            alert("只能选择一个角色进行设置人员！！！");
                            return;
                        }
                        $('#RoleWindow').window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=setEmpRole&roleId='+roleTables[0].roleId
                        });
                    }
                },
                {text:'设置权限', iconCls:'icon-add',
                    handler:function(){
                        var roleTables=$('#RoleTable').datagrid('getChecked');
                        if(roleTables.length==0){
                            alert("必须选择一个角色才能设置权限！！！");
                            return;
                        }else if(roleTables.length>1){
                            alert("只能选择一个角色进行设置权限！！！");
                            return;
                        }
                        $('#RoleWindow').window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=setRoleMenu&roleId='+roleTables[0].roleId
                        });
                    }
                }
            ]
        });
    });
</script>
<table id="RoleTable"></table>
<div id="RoleWindow"></div>
</body>
</html>
