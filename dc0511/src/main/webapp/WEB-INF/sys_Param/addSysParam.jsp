<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加系统参数</title>
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

<form id="sysParam1" method="post">
    <%-- <div>
         <label for="sysParamId">识别编号:</label>
         <input class="easyui-validatebox" type="text" name="sysParamId" data-options="validType:['length[4,20]']" />
     </div>--%>
    <div>
        <label for="sysParamField">表字段/属性名:</label>
        <%--<input class="easyui-validatebox" type="text" name="sysParamField" data-options="validType:['length[4,100]']" />--%>
        <select id="cc135" class="easyui-combobox" name="sysParamField"  style="width:200px;">
            <option value="">请选择</option>
            <c:forEach items="${applicationScope.sysParam}" var="sysParam">
                <option value="${sysParam.key}">${sysParam.key}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label for="sysParamValue">表字段值:</label>
        <input class="easyui-validatebox" type="text" name="sysParamValue" data-options="validType:['length[1,20]']" />
    </div>
    <div>
        <label for="sysParamText">页面显示名称:</label>
        <input class="easyui-validatebox" type="text" name="sysParamText" data-options="validType:['length[1,50]']" />
    </div>
    <div>
        <label for="sysParamType">类型:</label>
        <input class="easyui-validatebox" type="text" name="sysParamType" data-options="validType:['length[1,10]']" />
    </div>
    </div>
    <a id="btnsys2" href="#" onclick="save()"  class="easyui-linkbutton" data-options="iconCls:'icon-save'">添加系统参数</a>

</form>
<script type="text/javascript">
    function save() {
        alert("save");
        $('#sysParam1').form('submit', {
            url:'${baseURL}/sysparamparam/insert.mvc',
            onSubmit: function () {//
                var bool = $('#sysParam1').form('validate');
                alert(bool);
                return bool;	// 返回false终止表单提交
            },
            success: function (data) {
                if(data>0){
                    alert("添加成功");
                }else{
                    alert("添加失败");
                }
                parent.$('#sysparamawin').window("close");
                //调用前面的的dg 重新加载
                parent.$('#sysparama').datagrid('load');
            }

        });
    }

</script>

</body>
</html>
