<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function (){
        $("#updateEmpDeptType").combobox({
            data:[{value:'1',text:'总部'},{value:'0',text:'分部'}],
            onSelect:function (node) {
                if(node.text=="总部"){
                    $("#updateEmpTotalName").combobox('clear');
                    $("#updateEmpPostName").combobox('clear');
                    $("#updateEmpSubName").combobox('clear');
                    $("#updateEmpSubName").combobox('disable');
                }
                if(node.text=="分部"){
                    $("#updateEmpTotalName").combobox('clear');
                    $("#updateEmpPostName").combobox('clear');
                    $("#updateEmpSubName").combobox('clear');
                    $("#updateEmpSubName").combobox('enable');
                }
            }
        });
        $("#updateEmpDeptType").combobox('setValue','${requestScope.emp.deptType}');

        $("#updateEmpTotalName").combobox({
            textField:'depName',
            valueField:'depName',
            url:"${proPath}/ajaxQueryTotalDept.mvc",
            onSelect:function (node) {
                var result=$("#updateEmpDeptType").combobox("getText");
                if(result=="分部"){
                    $.ajax({
                        url:"${proPath}/ajaxQuerySubDept.mvc",
                        method:"post",
                        data:{depName:node.depName},
                        success:function (data){
                            $("#updateEmpSubName").combobox('clear');
                            $("#updateEmpSubName").combobox('loadData',data);
                        }
                    });
                }
                if(result=="总部"){
                    $.ajax({
                        url:"${proPath}/ajaxQueryPost.mvc",
                        method:"post",
                        data:{totalName:$("#updateEmpTotalName").combobox("getText")},
                        success:function (data){
                            $("#updateEmpPostName").combobox('clear');
                            $("#updateEmpPostName").combobox('loadData',data);
                        }
                    });
                }
            }
        });


        $("#updateEmpSubName").combobox({
            textField:'depName',
            valueField:'depName',
            onSelect:function (node) {
                $.ajax({
                    url:"${proPath}/ajaxQueryPost.mvc",
                    method:"post",
                    data:{totalName:$("#updateEmpTotalName").combobox("getText"),subName:$("#updateEmpSubName").combobox("getText")},
                    success:function (data){
                        $("#updateEmpPostName").combobox('clear');
                        $("#updateEmpPostName").combobox('loadData',data);
                    }
                });
            }
        });

        $("#updateEmpSex").combobox({
            data:[{value:'1',text:'男'},{value:'0',text:'女'}]
        });
        $("#updateEmpSex").combobox('select','${requestScope.emp.sex}');

        $("#updateEmpStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#updateEmpStatus").combobox('select','${requestScope.emp.empStatus}');

        $("#updateEmpPostName").combobox({
            textField:'postName',
            valueField:'postName'
        });

        $("#updateEmpLocks").combobox({
            data:[{value:'1',text:'是'},{value:'0',text:'否'}]
        });
        $("#updateEmpLocks").combobox('select','${requestScope.emp.locks}');



        var result=$("#updateEmpDeptType").combobox("getText");
        if(result=="分部"){
            $("#updateEmpTotalName").combobox('setValue','${requestScope.emp.totalName}');
            $.ajax({
                url:"${proPath}/ajaxQuerySubDept.mvc",
                method:"post",
                data:{depName:$("#updateEmpTotalName").combobox("getText")},
                success:function (data){
                    $("#updateEmpSubName").combobox('loadData',data);
                }
            });
            $("#updateEmpSubName").combobox('setValue','${requestScope.emp.subName}');
            $.ajax({
                url:"${proPath}/ajaxQueryPost.mvc",
                method:"post",
                data:{totalName:$("#updateEmpTotalName").combobox("getText"),subName:$("#updateEmpSubName").combobox("getText")},
                success:function (data){
                    $("#updateEmpPostName").combobox('loadData',data);
                }
            });
            $("#updateEmpPostName").combobox('setValue','${requestScope.emp.postName}');
        }
        if(result=="总部"){
            $("#updateEmpTotalName").combobox('setValue','${requestScope.emp.totalName}');
            $.ajax({
                url:"${proPath}/ajaxQueryPost.mvc",
                method:"post",
                data:{totalName:$("#updateEmpTotalName").combobox("getText")},
                success:function (data){
                    $("#updateEmpPostName").combobox('loadData',data);
                }
            });
            $("#updateEmpPostName").combobox('setValue','${requestScope.emp.postName}');
        }
    });

    function updateEmp(){
        $('#updateEmpForm').form('submit', {
            url:'${proPath}/updateEmp.mvc',
            onSubmit: function (){
                if(!$("#updateEmpTotalName").combobox("getText")){
                    alert("总店名称必须填！！！");
                    return false;
                }
                if(!$("#updateEmpPostName").combobox("getText")){
                    alert("职务名称必须填！！！");
                    return false;
                }
                return $("#updateEmpForm").form("validate");
            },
            success:function (msg) {
                var msgg=eval("("+msg+")");
                if (msgg.msg) {
                    alert(msgg.msg);
                    if(msgg.msg=="修改成功！！！") {
                        $("#EmpWin").window('close');
                        $("#EmpTable").datagrid("load");
                    }
                }
            }
        });
    }
    function updateEmpBack() {
        $("#EmpWin").window('close');
    }
</script>
<form id="updateEmpForm" method="post">
    姓名：<input  type="text" name="userName" value="${requestScope.emp.userName}" id="updateEmpUserName" class="easyui-validatebox" data-options="required:true"/><br>
    登录账号：<input  type="text" name="userCode" value="${requestScope.emp.userCode}" id="updateEmpUserCode" class="easyui-validatebox" data-options="required:true"/><br>
    性别：<input name="sex" id="updateEmpSex"/><br>
    身份证号：<input  type="text" name="idNumber" value="${requestScope.emp.idNumber}" id="updateEmpIdNumber" class="easyui-validatebox" data-options="required:true"/><br>
    手机号：<input  type="text" name="phone" id="updateEmpPhone" value="${requestScope.emp.phone}" class="easyui-validatebox" data-options="required:true"/><br>
    公司类型：<input  name="deptType" id="updateEmpDeptType"/><br>
    总公司：<input  name="totalName" id="updateEmpTotalName"/><br>
    分公司：<input  name="subName" id="updateEmpSubName"/><br>
    职务：<input  name="postName" id="updateEmpPostName"/><br>
    状态：<input  name="empStatus" id="updateEmpStatus"/><br>
    锁定：<input  name="locks" id="updateEmpLocks"/><br>
    <input type="hidden" name="empId" value="${requestScope.emp.empId}">
    <a class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="updateEmp()">修改</a>
    <a class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="updateEmpBack()">返回</a>
</form>
</body>
</html>
