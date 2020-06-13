<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>更新餐桌</title>
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

<form id="sysp3" method="post">
    <div>
        <label for="sysParamId">识别编号:</label>
        <input class="easyui-validatebox" type="text" name="sysParamId" data-options="validType:['length[1,10]']" readonly="readonly" />
    </div>
    <div>
        <label for="sysParamField">表字段/属性名:</label>
        <input class="easyui-validatebox" type="text" name="sysParamField" data-options="validType:['length[2,100]']" />
    </div>
    <div>
        <label for="sysParamValue">表字段值:</label>
        <input class="easyui-validatebox" type="text" name="sysParamValue" data-options="validType:['length[1,20]']" />
    </div>
    <div>
        <label for="sysParamText">页面显示名称:</label>
        <input class="easyui-validatebox" type="text" name="sysParamText" data-options="validType:['length[1,20]']" />
    </div>
        <div>
            <label for="sysParamType">类型:</label>
            <input class="easyui-validatebox" type="text" name="sysParamType" data-options="validType:['length[1,20]']" />
        </div>
    <input id="btnsys" type="button" value="提交"/>
</form>
<script type="text/javascript">
    $(function() {
        var array =parent.$("#sysparama").datagrid("getSelections");
        $("#sysp3").form('load',{
            sysParamId:array[0].sysParamId,
            sysParamField:array[0].sysParamField,
            sysParamValue:array[0].sysParamValue,
            sysParamText:array[0].sysParamText,
            sysParamType:array[0].sysParamType
//            sysparamId,sysParamField，sysParamValue，sysParamText，sysParamType
        });

        $("#btnsys").click(function() {
            //alert("ddddddddddd");
//            $("#ff3").form("enableValidation");
            if ($("#sysp3").form("validate")) {
                alert("------------");
                $('#sysp3').form('submit',{
                    url : '${proPath}/sysparamparam/update.mvc',
                    onSubmit : function() {
                        return true;
                    },
                    success : function(count) {
                        if(count>0){
                            //可以定义为对应消息框
                            alert("修改成功");
                        }else{
                            alert("修改失败");
                        }
                        parent.$("#sysparamawin").window("close");
                        parent.$("#sysparama").datagrid("reload");
                        //根据需要调整
                        parent.$("#sysparama").datagrid("clearSelections");
                    }
                });
            }
        });
    });
</script>
</body>
</html>