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

<form id="ff3" method="post">
        <div>
            <label for="depName">分部名称:</label>
            <input type="text" name="depName" readonly="readonly" />
        </div>
    <div>
        <label for="diningtableId">餐桌编号:</label>
        <input type="text" name="diningtableId" readonly="readonly" />
    </div>
    <div>
        <label for="diningtableName">餐桌名称:</label>
        <input  type="text" name="diningtableName" />
    </div>
    <div>
        <label for="qrCode">二维码更新:</label>
        <input type="radio" name="qrCode" value="0">不更新<input type="radio" name="qrCode" value="1">更新
    </div>
    <div>
        <label for="seating">座位数:</label>
        <input type="text" name="seating"/>
    </div>
    <div>
        <label for="state">状态:</label>
        <input  type="text" name="state" />
       <%-- <select id="cc" class="easyui-combobox" name="supType" style="width:200px;">
            <c:forEach items="${applicationScope.sysParam.supType}" var="supType">
                <option value="${supType.key}">${supType.value}</option>
            </c:forEach>
        </select>--%>
    </div>
    <input id="btn12" type="button" value="提交"/>
</form>
<script type="text/javascript">
    $(function() {
        alert(1);
        var talbearray =parent.$("#table").datagrid("getSelections");
        alert(talbearray[0].depId);
        alert(2);
        $("#ff3").form('load',{
            depName : talbearray[0].depName,
            diningtableId : talbearray[0].diningtableId,
            diningtableName : talbearray[0].diningtableName,
            seating :talbearray[0].seating,
            state : talbearray[0].state
        });
        $("[name='diningtableName']").validatebox({
            required : true,
            missingMessage : '请填写餐桌名！'
        });
        //禁用验证
        $("#ff3").form("disableValidation");

        $("#btn12").click(function() {
            //alert("ddddddddddd");
            $("#ff3").form("enableValidation");
            if ($("#ff3").form("validate")) {
                alert("------------");
                $('#ff3').form('submit', {
                    url : '${proPath}/table/updateTable.mvc',
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
                        parent.$("#tablewin").window("close");
                        parent.$("#table").datagrid("reload");
                        //根据需要调整
                        parent.$("#table").datagrid("clearSelections");
                    }
                });
            }
        });
    });
</script>
</body>
</html>