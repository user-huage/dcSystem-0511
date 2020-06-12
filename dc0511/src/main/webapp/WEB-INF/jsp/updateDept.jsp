<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style type="text/css">
    form{
        padding-top: 200px;
        padding-left: 350px;
        font-size: 19px;
    }
    #updateDeptA{
        padding-left: 250px;
    }
</style>
<script type="text/javascript">
    $(function () {
        if(${requestScope.dept.remarks}){
            $("#updateDeptRemarks").val("${requestScope.dept.remarks}");
        }
        $("#updateDeptB").combobox({
            valueField: 'value',
            textField: 'label',
            data: [{
                label: '可用',
                value:'1'
            },{
                label: '禁用',
                value:'0'
            }]
        });
        $("#updateDeptB").combobox('select','${requestScope.dept.status}');
    });
    function updateDept() {
        $('#updateDeptForm').form('submit', {
            url: '${proPath}/updateDept.mvc',
            onSubmit: function () {
                return $("#updateDeptForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="修改成功！！！") {
                        $("#deptTree").tree("reload");
                    }
                }
            }
        });
    }
</script>
<form id="updateDeptForm" method="post">
    部门名称：<input type="text" name="depName" class="easyui-validatebox" data-options="required:true" style="width:394px; height: 31px" value="${requestScope.dept.depName}"><br><br>
    部门地址：<input type="text" name="depAddress" class="easyui-validatebox" data-options="required:true" style="width:394px; height: 31px" value="${requestScope.dept.depAddress}"><br><br>
    状态：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="updateDeptB" name="status" style="width:394px; height: 31px"></select><br><br>
    备注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="remarks" id="updateDeptRemarks" class="easyui-validatebox" data-options="required:false" style="width:394px; height: 31px"><br><br>
    <input type="hidden" name="depId" value="${requestScope.dept.depId}">
    <div id="updateDeptA"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="updateDept()">修改</a></div>
</form>
</body>
</html>
