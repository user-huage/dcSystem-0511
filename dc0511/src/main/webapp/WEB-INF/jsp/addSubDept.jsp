<%@ include file="../../common/common.jspf" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    #addSubDeptA{
        padding-left: 250px;
    }
</style>
<script type="text/javascript">
    $(function () {
        $("#addSubDeptB").combobox({
            valueField: 'a',
            textField: 'label',
            data: [{
                label: '可用',
                a:'1'
            },{
                label: '禁用',
                a:'0'
            }]
        });
        $("#addSubDeptB").combobox('select','1');
    });
    function addSubDept() {
        $('#addSubDeptForm').form('submit', {
            url: '${proPath}/addDept.mvc',
            onSubmit: function () {
                return $("#addSubDeptForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="添加成功！！！") {
                        $("#deptTree").tree("reload");
                    }
                }
            }
        });
    }
</script>
<form id="addSubDeptForm" method="post">
    总公司名称：<input type="text"  disabled="disabled" value="${requestScope.dept.depName}" style="width:394px; height: 31px"><br><br>
    分公司名称：<input type="text" name="depName" class="easyui-validatebox" data-options="required:true" style="width:394px; height: 31px"><br><br>
    分工司地址：<input type="text" name="depAddress" class="easyui-validatebox" data-options="required:true" style="width:394px; height: 31px"><br><br>
    状态：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="addSubDeptB" name="status"  style="width:394px; height: 31px"></select><br><br>
    备注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="remarks" class="easyui-validatebox" data-options="required:false" style="width:394px; height: 31px"><br><br>
    <input type="hidden" name="parentId" value="${requestScope.dept.parentId}">
    <div id="addSubDeptA"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addSubDept()">添加</a></div>
</form>
</body>
</html>
