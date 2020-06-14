<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>系统参数管理</title>

</head>
<body>
<div>
    <form id="sp1" type="post">
        <div>
            <%--表字段/属性名:<input id="sp12" type="text"  name="sysParamField"/>--%>
            表字段/属性名: <select id="sp12" class="easyui-combobox" name="sysParamField"  style="width:200px;">
            <option value="">请选择</option>
            <c:forEach items="${applicationScope.sysParam}" var="sysParam">
                <option value="${sysParam.key}">${sysParam.key}</option>
            </c:forEach>
        </select>
            表字段值:<input id="sp13" type="text"  name="sysParamValue"/>
        </div>
        <div>
            页面显示名称:<input id="sp14" type="text"  name="sysParamText"/>
            类型:<input id="sp15" type="text"  name="sysParamType"/>
        </div>
        <input type="button" onclick="spat()" value="查询">
        <input type="reset" value="重置">
    </form>
</div >
<table id="sysparama"></table>
<div id="sysparamawin"></div>

<script type="text/javascript">
    function spat(){
        alert("diaoyong");//           sysparamId:$("[name=sysparamId]").val(),
        $('#sysparama').datagrid('load', {
//            sysParamField:$("[name=sysParamField]").val(),
            sysParamField:$("#sp12").combobox("getValue"),
            sysParamValue:$("[name=sysParamValue]").val(),
            sysParamText:$("[name=sysParamText]").val(),
            sysParamType:$("[name=sysParamType]").val()
        });
    }
    $(function(){
        $('#sysparama').datagrid({
            url:'${baseURL}/sysparamparam/selectList.mvc',
            columns:[[
                {checkbox:true},
                {field:'sysParamId',value:"",title:'记录编号',width:200},
                {field:'sysParamField',title:'表字段/属性名',width:500},
                {field:'sysParamValue',value:"",title:'表字段值',width:300},
                {field:'sysParamText',value:"",title:'页面显示名称',width:500},
                {field:'sysParamType',value:"",title:'类型',width:200}
            ]],
            fitColumns:true,
            toolbar:[{
                text:'新增',
                iconCls:'icon-add',
                handler: function(){
                    $('#sysparamawin').window({
                        title:"添加餐桌",
                        width:500,
                        height:350,
                        modal:true,
                        content:"<iframe src='${proPath}/base/goURL/sys_Param/addSysParam.mvc' height='100%' width='100%' frameborder='0px' ></iframe>"
                    });
                }
            },'-', {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $('#sysparama').datagrid("getSelections");
                    if(array.length==1){
                        if(array[0].state != 0){
                            $('#sysparamawin').window({
                                title:"更新餐桌",
                                width:500,
                                height:350,
                                modal:true,
                                content:"<iframe src='${proPath}/base/goURL/sys_Param/updateSysParam.mvc' height='100%' width='100%' frameborder='0px' ></iframe>"
                            });
                        }else{
                            alert("餐桌当前不可修改");
                        }
                    }else{
                        $.messager.show({
                            title : '操作提示',
                            msg : '请只选择一条需要修改的记录。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }
            },'-',{
                text:'删除',
                iconCls:'icon-remove',
                handler: function(){
                    var rows = $('#sysparama').datagrid("getSelections");
                    if(0 == rows.length){
                        $.messager.show({
                            title: '提示',
                            msg: '请选择一条',
                            timeout: 3000,
                            showType: 'slide'
                        });
                    }else{
                        if (rows.length > 1) {
                            $.messager.show({
                                title: '提示',
                                msg: '只能选择一条',
                                timeout: 3000,
                                showType: 'slide'
                            });
                        }else{
                            $.ajax({
                                type : "POST",
                                url: "${baseURL}/sysparamparam/deleteByPks.mvc",
                                data: "sysParamId="+rows[0].sysParamId+"&sysParamField="+rows[0].sysParamField+"&sysParamValue="+rows[0].sysParamValue+"&sysParamType="+rows[0].sysParamType,
                                success : function (data) {
                                    if(data>0) {
                                        alert("删除成功");
                                    }else{
                                        alert("删除失败");
                                    }
                                    $('#sysparama').datagrid('reload');
                                },
                                error : function () {
                                    alert("系统出错,请稍后再试或联系管理员");
                                }
                            });
                        }
                    }
                }
            },'-', {
                text: '系统参数更新',
                iconCls: 'icon-edit',
                handler: function () {
                    $.ajax({
                        type : "POST",
                        url: "${baseURL}/sysparamparam/updateAll.mvc",
                        success : function (bool) {
                            if(bool) {
                                alert("更新成功");
                            }else{
                                alert("更新失败");
                            }
                            $('#sysparama').datagrid('reload');
                        },
                        error : function () {
                            alert("系统出错,请稍后再试或联系管理员");
                        }
                    });
                }  },'-',{
                text:'刷新',
                iconCls:'icon-remove',
                handler: function(){
                    $('#sysparama').datagrid('load', {
                    });
                }
            }],
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            striped:true
        });
    });
</script>
</body>
</html>
