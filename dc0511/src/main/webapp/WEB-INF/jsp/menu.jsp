<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#MenuTable').treegrid({
            url:'${proPath}/queryAllMenu.mvc',
            method:'post',
            idField:'menuId',
            treeField:'menuName',
            columns:[[
                {checkbox:true},
                {field:'menuId',title:'目录编号'},
                {field:'menuName',title:'目录名称'},
                {field:'url',title:'URL'},
                {field:'powerName',title:'权限编码'},
                {field:'menuType',title:'目录类型'},
                {field:'status',title:'状态'},
                {field:'sort',title:'排序'}
            ]],
            loadMsg:'正在加载数据，请稍等',
            striped:true,
            rownumbers:true,
            toolbar:[
                {text:'添加根目录',iconCls:'icon-add',
                    handler:function(){
                        $("#MenuWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=addTotalMenu'
                        });
                    }
                },
                {text:'添加子目录',iconCls:'icon-add',
                    handler:function(){
                        var menuTable=$('#MenuTable').treegrid('getSelected');
                        if(menuTable.length==0){
                            alert("必须选择一个根目录才能进行添加！！！");
                            return;
                        }else if(menuTable.menuType=="按钮") {
                            alert("请选择一个根目录进行添加！！！");
                            return;
                        }
                        $("#MenuWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=addSubMenu&parentId='+menuTable.menuId
                        });
                    }
                },
                {text:'修改',iconCls:'icon-edit',
                    handler:function(){
                        var menuTable=$('#MenuTable').treegrid('getSelected');
                        if(menuTable.length==0){
                            alert("必须选择一个目录才能进行修改！！！");
                            return;
                        }
                        var status;
                        if(menuTable.status=="可用"){
                            status='1';
                        }else {
                            status='0';
                        }
                        var type;
                        if(menuTable.menuType=="菜单"){
                            type='1';
                        }else {
                            type='0';
                        }
                        var url;
                        if(!menuTable.url){
                            url="无";
                        }else {
                            url=menuTable.url;
                        }
                        var sort;
                        if(!menuTable.sort){
                            sort=0;
                        } else {
                            sort=menuTable.sort;
                        }
                        var powerName;
                        if(!menuTable.powerName){
                            powerName="无";
                        }else {
                            powerName=menuTable.powerName;
                        }
                        $("#MenuWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=updateMenu&menuId='+menuTable.menuId+"&menuName="+menuTable.menuName+"&url="+url+"&menuType="+type+"&powerName="+powerName+"&status="+status+"&sort="+sort
                        });
                    }
                },
                {text:'删除',iconCls:'icon-remove',
                    handler:function(){
                        var menuTable=$('#MenuTable').datagrid('getSelected');
                        if(menuTable.length==0){
                            alert("必须选择一个目录才能进行删除！！！");
                            return;
                        };
                        $.messager.confirm("删除框","确认要删除吗？",function(r){
                            if(r){
                                $.ajax({
                                    url:"${proPath}/deleteMenu.mvc",
                                    method:"post",
                                    data:{menuId:menuTable.menuId},
                                    success:function (msgg) {
                                        if (msgg.msg) {
                                            alert(msgg.msg);
                                            if(msgg.msg=="删除成功！！！") {
                                                $("#MenuTable").treegrid("load");
                                            }
                                        }
                                    }
                                });
                            }
                        });
                    }
                }
            ],
            pagination:true,
            title:'目录信息列表'
        });
    })
</script>
<table id="MenuTable"></table>
<div id="MenuWindow"></div>
</body>
</html>
