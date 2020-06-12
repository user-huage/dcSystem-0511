<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#AddPostTotalName").combobox({
            textField:'depName',
            valueField:'depName',
            url:"${proPath}/ajaxQueryTotalDept.mvc",
            onSelect:function (node) {
                $.ajax({
                    url:"${proPath}/ajaxQuerySubDept.mvc",
                    method:"post",
                    data:{depName:node.depName},
                    success:function (data){
                        $("#AddPostSubName").combobox('clear');
                        $("#AddPostSubName").combobox('loadData',data);
                    }
                });
            }
        });
        $("#AddPostSubName").combobox({
            textField:'depName',
            valueField:'depName'
        });
        $("#AddStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#AddStatus").combobox('select','1');
    });
    function addPost(){
        $('#addPostForm').form('submit', {
            url:'${proPath}/addPost.mvc',
            onSubmit: function (){
                if(!$("#AddPostTotalName").combobox("getText")){
                    alert("总店名称必须填！！！");
                    return false;
                }
                return $("#addPostForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="添加成功！！！") {
                        $("#addPostWin").window('close');
                        $("#postTable").datagrid("load");
                    }
                }
            }
        });
    }
    function addPostBack() {
        $("#addPostWin").window('close');
    }
</script>
<form id="addPostForm" method="post">
    总店名称：<input name="totalName" id="AddPostTotalName"/><br>
    分店名称：<input name="subName" id="AddPostSubName"/><br>
    职务名称：<input name="postName" class="easyui-validatebox" data-options="required:true"/><br>
    是否可用：<input name="status" id="AddStatus"/><br>
    备注：<input type="text" name="remarks"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addPost()">添加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="addPostBack()">返回</a>
</form>
</body>
</html>
