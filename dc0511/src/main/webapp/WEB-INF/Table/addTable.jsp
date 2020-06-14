<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加餐桌</title>
</head>
<body>
<!--
定义控件：
          方式一，在标签中定义：class="easyui-控件名"
          方式二，在JS中定义,并可同时定义属性和事件：     $(选择器).控件名({属性名:属性值,属性名:属性值,事件:function,事件:function});
定义控件属性（标签中）：data-options="属性名:属性值,属性名:属性值,事件:function,事件:function"
使用方法（只能JS中）：
  1.无参数方法调用：$(选择器).控件名（"方法名"）
  2.有参数方法调用：$(选择器).控件名（"方法名",参数）
  3.多参数方法调用：$(选择器).控件名（"方法名",{参数名:参数值，参数名:参数值}）
 -->

<div>
    <p>总部门： <input id="cc1" class="easyui-combobox" data-options="
        valueField: 'depName',
        textField: 'depName',
        url: '${proPath}/deptselcetPage.mvc',
        onSelect: function(depName){
            var url = '${proPath}/deptselcetPage.mvc?depName='+depName.depName;
            $('#cc2').combobox('reload', url);
        }" /></p>
    <p> 分部门： <input id="cc2" class="easyui-combobox" data-options="valueField:'depName',textField:'depName'" /></p>

</div>

<form id="ff11" method="post">
    <p>
        <label for="diningtableId">餐桌编号:</label>
        <input class="easyui-validatebox" type="text" name="diningtableId" data-options="validType:['length[4,20]']" />
    </p>
    <p>
        <label for="diningtableName">餐桌名称:</label>
        <input class="easyui-validatebox" type="text" name="diningtableName" data-options="validType:['length[4,100]']" />
    </p>
    <p>
        <label for="seating">座位数:</label>
        <input class="easyui-validatebox" type="text" name="seating" data-options="validType:['length[1,2]']" />
    </p>
    <p>
        <label for="state">状态:</label>
        <select id="cx18" class="easyui-combobox" name="state"  style="width:200px;">
            <c:forEach items="${applicationScope.sysParam.tableState}" var="tableState">
                <option value="${tableState.key}">${tableState.value}</option>
            </c:forEach>
        </select>
    </p>
    <a id="btn12" href="#" onclick="save()"  class="easyui-linkbutton" data-options="iconCls:'icon-save'">添加餐桌</a>

</form>
<script type="text/javascript">
    function save() {
        alert("save");
        $('#ff11').form('submit', {
            url:'${baseURL}/table/addTable.mvc',
            onSubmit: function (dep) {//
                dep.depName=$("#cc2").combobox("getValue");
                var bool = $('#ff11').form('validate');
                alert(bool);
                return bool;	// 返回false终止表单提交
            },
            success: function (data) {
                if(data>0){
                    alert("添加成功");
                }else{
                    alert("添加失败");
                }
                parent.$('#Tablewin').window("close");
                //调用前面的的dg 重新加载
                parent.$('#table').datagrid('load');
            }

        });
    }

</script>

</body>
</html>