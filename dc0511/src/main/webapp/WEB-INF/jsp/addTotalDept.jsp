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
    #addTotalDeptA{
        padding-left: 250px;
    }
</style>
<script type="text/javascript">
    $(function () {
        $("#addTotalDeptB").combobox({
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
        $("#addTotalDeptB").combobox('select','1');
    });
    function addTotalDept() {
        $('#addTotalDeptForm').form('submit', {
            url: '${proPath}/addDept.mvc',
            onSubmit: function () {
                return $("#addTotalDeptForm").form("validate");
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
<form id="addTotalDeptForm" method="post">
    部门名称：<input type="text" name="depName" class="easyui-validatebox" data-options="required:true" style="width:394px; height: 31px"><br><br>
    部门地址：<input type="text" name="depAddress" class="easyui-validatebox" data-options="required:true" style="width:394px; height: 31px"><br><br>
    状态：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="addTotalDeptB" name="status" style="width:394px; height: 31px"></select><br><br>
    备注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="remarks" class="easyui-validatebox" data-options="required:false" style="width:394px; height: 31px"><br><br>
    <div id="addTotalDeptA"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addTotalDept()">添加</a></div>
</form>
</body>
</html>
