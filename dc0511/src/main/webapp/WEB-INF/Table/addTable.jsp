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
    总部门： <input id="cc1" class="easyui-combobox" data-options="
        valueField: 'depName',
        textField: 'depName',
        url: '/dep/depselectListparent.mvc',
        onSelect: function(depName){
            var url = '/dep/depselectListson.mvc?depName='+depName.depName;
            $('#cc2').combobox('reload', url);
        }" />
    分部门： <input id="cc2" class="easyui-combobox" data-options="valueField:'depName',textField:'depName'" />

</div>

      <form id="ff11" method="post">
      <div>
        <label for="diningtableId">餐桌编号:</label>
        <input class="easyui-validatebox" type="text" name="diningtableId" data-options="validType:['length[4,20]']" />
    </div>
    <div>
        <label for="diningtableName">餐桌名称:</label>
        <input class="easyui-validatebox" type="text" name="diningtableName" data-options="validType:['length[4,100]']" />
    </div>
     <div>
         <label for="seating">座位数:</label>
          <input class="easyui-validatebox" type="text" name="seating" data-options="validType:['length[1,2]']" />
     </div>
    <div>
        <label for="state">状态:</label>
        <input class="easyui-validatebox" type="text" name="state" data-options="validType:['length[1,2]']" />
    </div>
    <a id="btn12" href="#" onclick="save()"  class="easyui-linkbutton" data-options="iconCls:'icon-save'">添加餐桌</a>

</form>
<script type="text/javascript">
    function save() {
        $('#ff11').form('submit', {
            url:'${baseURL}/table/addTable.mvc',
            onSubmit: function (dep) {//
                dep.depName=$("#cc2").combobox("getValue");
                var bool = $('#ff11').form('validate');
                return bool;	// 返回false终止表单提交
            },
            success: function (data) {
                if(data>0){
                    alert("添加成功");
                }else{
                    alert("添加失败");
                }
                    parent.$('#tablewin').window("close");

                    //调用前面的的dg 重新加载
                    parent.$('#table').datagrid('load');
                }

        });
    }

</script>

</body>
</html>