<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#EmpTable').datagrid({
            url:'${proPath}/queryAllEmp.mvc',
            method:'post',
            columns:[[
                {checkbox:true},
                {field:'empId',title:'员工编号'},
                {field:'userName',title:'姓名员工'},
                {field:'userCode',title:'登录账号'},
                {field:'sex',title:'性别'},
                {field:'deptType',title:'部门类型'},
                {field:'totalName',title:'总公司'},
                {field:'subName',title:'分公司'},
                {field:'postName',title:'职务'},
                {field:'idNumber',title:'身份证'},
                {field:'phone',title:'手机号'},
                {field:'workStatus',title:'工作状态'},
                {field:'empStatus',title:'状态'},
                {field:'locks',title:'锁定'}
            ]],
            loadMsg:'正在加载数据，请稍等',
            striped:true,
            rownumbers:true,
            toolbar:[
                {text:'添加员工',iconCls:'icon-add',
                    handler:function(){
                        $('#EmpWin').window({
                            width:600,
                            height:500,
                            href:'${proPath}/goUrl.mvc?src=addEmp'
                        });
                    }},
                {text:'修改员工',iconCls:'icon-edit', handler:function(){
                        var empTables=$('#EmpTable').datagrid('getChecked');
                        if(empTables.length>1){
                            alert("只能选择一个员工进行修改！！！");
                            return;
                        }else if(empTables.length==0){
                            alert("必须选择一个员工才能进行修改！！！");
                            return;
                        }
                        var deptType;
                        if(empTables[0].deptType=="总部"){
                            deptType='1';
                        }else {
                            deptType='0';
                        }
                        var sex;
                        if(empTables[0].sex=="男"){
                            sex='1';
                        }else {
                            sex='0';
                        }
                        var empStatus;
                        if(empTables[0].empStatus=="可用"){
                            empStatus='1';
                        }else {
                            empStatus='0';
                        }
                        var locks;
                        if(empTables[0].locks=="是"){
                            locks='1';
                        }else {
                            locks='0';
                        }
                        $('#EmpWin').window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=updateEmp&userName='+empTables[0].userName+'&userCode='+empTables[0].userCode+'&sex='+sex+'&idNumber='+empTables[0].idNumber+'&phone='+empTables[0].phone+'&deptType='+deptType+'&totalName='+empTables[0].totalName+'&subName='+empTables[0].subName+'&postName='+empTables[0].postName+'&empStatus='+empStatus+'&locks='+locks+'&empId='+empTables[0].empId
                        });
                    }},
                {text:'删除员工',iconCls:'icon-remove', handler:function(){
                        var empTables=$('#EmpTable').datagrid('getChecked');
                        if(empTables.length==0){
                            alert("必须选择一个员工才能进行删除！！！");
                            return;
                        };
                        var a=new Array();
                        $(empTables).each(function (i,emp) {
                            a[i]=emp.empId;
                        });
                        var empIds=a.toString();
                        $.messager.confirm("删除框","确认要删除吗？",function(r){
                            if(r){
                                $.ajax({
                                    url:"${proPath}/deleteEmp.mvc",
                                    method:"post",
                                    data:{empIds:empIds},
                                    success:function (msgg) {
                                        if (msgg.msg) {
                                            alert(msgg.msg);
                                            if(msgg.msg=="删除成功！！！") {
                                                $("#EmpTable").datagrid("load");
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
        $("#EmpTotalName").combobox({
            textField:'depName',
            valueField:'depName',
            url:"${proPath}/ajaxQueryTotalDept.mvc",
            onSelect:function (node) {
                $.ajax({
                    url:"${proPath}/ajaxQuerySubDept.mvc",
                    method:"post",
                    data:{depName:node.depName},
                    success:function (data) {
                        $("#EmpSubName").combobox('clear');
                        $("#EmpSubName").combobox('loadData',data);
                    }
                });
            }
        });
        $("#EmpSubName").combobox({
            textField:'depName',
            valueField:'depName'
        });
        $("#EmpStatus").combobox({
            data:[{value:'1',text:'可用'},{value:'0',text:'禁用'}]
        });
        $("#EmpStatus").combobox('select','1');
    });
    function searchEmp() {
        $("#EmpTable").datagrid('load',{
            totalName:$("[name=totalName]").val(),
            subName:$("[name=subName]").val(),
            empStatus:$("[name=EmpStatus]").val(),
            userName:$("[name=userName]").val(),
            userCode:$("[name=userCode]").val(),
            idNumber:$("[name=idNumber]").val(),
            phone:$("[name=phone]").val()
        });
    }
</script>
<style type="text/css">
    #empTableDiv{
        background-color:#CCE6FF;
        padding-top:10px;
    }
</style>
<div id="empTableDiv">
    <form  id="EmpForm" method="post">
        总公司：<input  name="totalName" id="EmpTotalName"/>
        分公司：<input  name="subName" id="EmpSubName"/>
        状态：<input  name="empStatus" id="EmpStatus"/><br>
        姓名：<input  type="text" name="userName" id="EmpUserName"/>
        登录账号：<input  type="text" name="userCode" id="EmpUserCode"/>
        身份证号：<input  type="text" name="idNumber" id="EmpIdNumber"/>
        手机号：<input  type="text" name="phone" id="EmpPhone"/>
        <a class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="searchEmp()">查询</a>
    </form>
</div>
<table id="EmpTable"></table>
<div id="EmpWin"></div>
</body>
</html>
