<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#postTable').datagrid({
            url:'${proPath}/queryPost.mvc',
            method:'post',
            columns:[[
                {checkbox:true},
                {field:'postId',title:'职务编号'},
                {field:'deptType',title:'部门类型'},
                {field:'totalName',title:'总公司'},
                {field:'subName',title:'分公司'},
                {field:'postName',title:'职务名称'},
                {field:'status',title:'是否可用'},
                {field:'createTime',title:'创建时间'},
                {field:'remarks',title:'备注'}
            ]],
            loadMsg:'正在加载数据，请稍等',
            striped:true,
            rownumbers:true,
            toolbar:[
                {text:'添加职务', iconCls:'icon-add',
                    handler:function(){
                        $('#addPostWin').window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=addPost'
                        });
                    }
                },
                {text:'修改',iconCls:'icon-edit',
                    handler:function(){
                        var postTables=$('#postTable').datagrid('getChecked');
                        if(postTables.length>1){
                            alert("只能选择一个职务进行修改！！！");
                            return;
                        }else if(postTables.length==0){
                            alert("必须选择一个职务才能进行修改！！！");
                            return;
                        }
                        var a;
                        if(postTables[0].status=="可用"){
                            a='1';
                        }else {
                            a='0';
                        }
                        $('#updatePostWin').window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=updatePost&postId='+postTables[0].postId+'&remarks='+postTables[0].remarks+'&postName='+postTables[0].postName+'&subName='+postTables[0].subName+'&status='+a+'&totalName='+postTables[0].totalName
                        });
                    }},
                {text:'删除',iconCls:'icon-remove',
                    handler:function(){
                        var postTables=$('#postTable').datagrid('getChecked');
                        if(postTables.length==0){
                            alert("必须选择一个职务才能进行删除！！！");
                            return;
                        };
                        var a=new Array();
                        $(postTables).each(function (i,post) {
                            a[i]=post.postId;
                        });
                        var postIds=a.toString();
                        $.messager.confirm("删除框","确认要删除吗？",function(r){
                            if(r){
                                $.ajax({
                                    url:"${proPath}/deletePost.mvc",
                                    method:"post",
                                    data:{postIds:postIds},
                                    success:function (msgg) {
                                        if (msgg.msg) {
                                            alert(msgg.msg);
                                            if(msgg.msg=="删除成功！！！") {
                                                $("#postTable").datagrid("load");
                                            }
                                        }
                                    }
                                });
                            }
                        });
                    }}
            ],
            pagination:true,
            title:'员工信息列表'
        });
        $("#PostTotalName").combobox({
            textField:'depName',
            valueField:'depId',
            url:"${proPath}/ajaxQueryTotalDept.mvc",
            onSelect:function (node) {
                $.ajax({
                    url:"${proPath}/ajaxQuerySubDept.mvc",
                    method:"post",
                    data:{depName:node.depName},
                    success:function (data) {
                        $("#PostSubName").combobox('clear');
                        $("#PostSubName").combobox('loadData',data);
                    }
                });
            }
        });
        $("#PostSubName").combobox({
            textField:'depName',
            valueField:'depId'
        });
        $("#PostStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#PostStatus").combobox('select','1');
    });
    function searchPost() {
        $("#postTable").datagrid('load',{
            totalName:$("#PostTotalName").combobox("getText"),
            subName:$("#PostSubName").combobox("getText"),
            status:$("#PostStatus").combobox("getValue")
        });
    }
</script>
<style type="text/css">
    #postTableDiv{
        background-color:#CCE6FF;
        padding-top:10px;
    }
</style>
<div id="postTableDiv">
<form  id="PostForm" method="post">
    总公司：<input  name="totalName" id="PostTotalName"/>
    分公司：<input  name="subName" id="PostSubName"/>
    是否可用：<input  name="status" id="PostStatus"/><br>
    <a class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="searchPost()">查询</a>
</form>
</div>
<table id="postTable"></table>
<div id="addPostWin"></div>
<div id="updatePostWin"></div>
</body>
</html>
