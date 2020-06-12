<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function (){
        $("#addEmpDeptType").combobox({
            data:[{value:'1',text:'总部'},{value:'0',text:'分部'}],
            onSelect:function (node) {
                if(node.text=="总部"){
                    $("#addEmpTotalName").combobox('clear');
                    $("#addEmpPostName").combobox('clear');
                    $("#addEmpSubName").combobox('clear');
                    $("#addEmpSubName").combobox('disable');
                }
                if(node.text=="分部"){
                    $("#addEmpTotalName").combobox('clear');
                    $("#addEmpPostName").combobox('clear');
                    $("#addEmpSubName").combobox('clear');
                    $("#addEmpSubName").combobox('enable');
                }
            },
            onLoadSuccess:function () {
                $("#addEmpDeptType").combobox('setValue','0');
            }
        });

        $("#addEmpTotalName").combobox({
            textField:'depName',
            valueField:'depName',
            url:"${proPath}/ajaxQueryTotalDept.mvc",
            onSelect:function (node) {
                var result=$("#addEmpDeptType").combobox("getText");
                if(result=="分部"){
                    $.ajax({
                        url:"${proPath}/ajaxQuerySubDept.mvc",
                        method:"post",
                        data:{depName:node.depName},
                        success:function (data){
                            $("#addEmpSubName").combobox('clear');
                            $("#addEmpSubName").combobox('loadData',data);
                        }
                    });
                }
                if(result=="总部"){
                    $.ajax({
                        url:"${proPath}/ajaxQueryPost.mvc",
                        method:"post",
                        data:{totalName:$("#addEmpTotalName").combobox("getText")},
                        success:function (data){
                            $("#addEmpPostName").combobox('clear');
                            $("#addEmpPostName").combobox('loadData',data);
                        }
                    });
                }
            }
        });

        $("#addEmpSubName").combobox({
            textField:'depName',
            valueField:'depName',
            onSelect:function (node) {
                $.ajax({
                    url:"${proPath}/ajaxQueryPost.mvc",
                    method:"post",
                    data:{totalName:$("#addEmpTotalName").combobox("getText"),subName:$("#addEmpSubName").combobox("getText")},
                    success:function (data){
                        $("#addEmpPostName").combobox('clear');
                        $("#addEmpPostName").combobox('loadData',data);
                    }
                });
            }
        });

        $("#addEmpSex").combobox({
            data:[{value:'1',text:'男'},{value:'0',text:'女'}]
        });
        $("#addEmpSex").combobox('select','1');

        $("#addEmpStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#addEmpStatus").combobox('select','1');

        $("#addEmpPostName").combobox({
            textField:'postName',
            valueField:'postName'
        });

        $("#addEmpLocks").combobox({
            data:[{value:'1',text:'是'},{value:'0',text:'否'}]
        });
        $("#addEmpLocks").combobox('select','1');
    });

    function addEmp(){
        $('#addEmpForm').form('submit', {
            url:'${proPath}/addEmp.mvc',
            onSubmit: function (){
                if(!$("#addEmpTotalName").combobox("getText")){
                    alert("总店名称必须填！！！");
                    return false;
                }
                if(!$("#addEmpPostName").combobox("getText")){
                    alert("职务名称必须填！！！");
                    return false;
                }
                return $("#addEmpForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="添加成功！！！") {
                        $("#EmpWin").window('close');
                        $("#EmpTable").datagrid("load");
                    }
                }
            }
        });
    }
    function addEmpBack() {
        $("#EmpWin").window('close');
    }
</script>
<form id="addEmpForm" method="post">
    姓名：<input  type="text" name="userName" id="addEmpUserName" class="easyui-validatebox" data-options="required:true"/><br>
    登录账号：<input  type="text" name="userCode" id="addEmpUserCode" class="easyui-validatebox" data-options="required:true"/><br>
    性别：<input name="sex" id="addEmpSex"/><br>
    身份证号：<input  type="text" name="idNumber" id="addEmpIdNumber" class="easyui-validatebox" data-options="required:true"/><br>
    手机号：<input  type="text" name="phone" id="addEmpPhone" class="easyui-validatebox" data-options="required:true"/><br>
    公司类型：<input  name="deptType" id="addEmpDeptType"/><br>
    总公司：<input  name="totalName" id="addEmpTotalName"/><br>
    分公司：<input  name="subName" id="addEmpSubName"/><br>
    职务：<input  name="postName" id="addEmpPostName"/><br>
    状态：<input  name="empStatus" id="addEmpStatus"/><br>
    锁定：<input  name="locks" id="addEmpLocks"/><br>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="addEmp()">添加</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="addEmpBack()">返回</a>
</form>
</body>
</html>