<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        <%--if(${requestScope.post.remarks}){--%>
            <%--$("#UpdateRemarks").val("${requestScope.post.remarks}");--%>
        <%--}--%>
        $("#UpdatePostTotalName").combobox({
            textField:'depName',
            valueField:'depName',
            url:"${proPath}/ajaxQueryTotalDept.mvc",
            onSelect:function (node) {
                $.ajax({
                    url:"${proPath}/ajaxQuerySubDept.mvc",
                    method:"post",
                    data:{depName:node.depName},
                    success:function (data){
                        $("#UpdatePostSubName").combobox('clear');
                        $("#UpdatePostSubName").combobox('loadData',data);
                    }
                });
            }
        });

        $("#UpdatePostSubName").combobox({
            textField:'depName',
            valueField:'depName'
        });

        $("#UpdateStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#UpdateStatus").combobox('select','${requestScope.post.status}');

        $("#UpdatePostTotalName").combobox('setValue','${requestScope.post.totalName}');
        $.ajax({
            url:"${proPath}/ajaxQuerySubDept.mvc",
            method:"post",
            data:{depName:$("#UpdatePostTotalName").combobox("getText")},
            success:function (data){
                $("#UpdatePostSubName").combobox('loadData',data);
            }
        });
        $("#UpdatePostSubName").combobox('select','${requestScope.post.subName}');
    });
    function addPost(){
        $('#updatePostForm').form('submit', {
            url:'${proPath}/updatePost.mvc',
            onSubmit: function (){
                if(!$("#UpdatePostTotalName").combobox("getText")){
                    alert("总店名称必须填！！！");
                    return false;
                }
                return $("#updatePostForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="修改成功！！！") {
                        $("#updatePostWin").window('close');
                        $("#postTable").datagrid("load");
                    }
                }
            }
        });
    }
    function addPostBack() {
        $("#updatePostWin").window('close');
    }
</script>
<form id="updatePostForm" method="post">
    总店名称：<input name="totalName" id="UpdatePostTotalName"/><br>
    分店名称：<input name="subName" id="UpdatePostSubName"/><br>
    职务名称：<input name="postName" id="UpdatePostName" class="easyui-validatebox" data-options="required:true" value="${requestScope.post.postName}"/><br>
    是否可用：<input name="status" id="UpdateStatus"/><br>
    备注：<input type="text" name="remarks" id="UpdateRemarks"/><br>
    <input type="hidden" name="postId" value="${requestScope.post.postId}"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addPost()">修改</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="addPostBack()">返回</a>
</form>
</body>
</html>
