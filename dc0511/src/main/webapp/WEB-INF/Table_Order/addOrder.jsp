<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>预定餐桌</title>
</head>
<body>
<form id="ff4" method="post">
    <div>
        <label for="depName">部门名称:</label>
        <input type="text" name="depName" readonly="readonly" />
    </div>
    <div>
        <label for="diningtableId">餐桌编号:</label>
        <input  type="text" name="diningtableId" readonly="readonly"/>
    </div>
    <div>
        <label for="diningtableName">餐桌名称:</label>
        <input type="text" name="diningtableName" readonly="readonly"/>
    </div>
    <div>
        <label for="seating">座位数:</label>
        <input type="text" name="seating" readonly="readonly" />
    </div>
    <div>
        <label for="repastForm">就餐形式:</label>
        <input  type="text" name="repastForm"/>
    </div>
    <div>
        <label for="reservedNumber">手机号:</label>
        <input class="easyui-numberbox" name="reservedNumber" data-options="groupSeparator:','">
    </div>
    <div>
        <label for="beginTime">开始时间:</label>
        <input type="text" class="easyui-datetimebox" name="beginTime" required style="width:200px"></input>
    </div>
    <div>
        <label for="endTime">结束时间:</label>
        <input type="text" class="easyui-datetimebox" name="endTime" required style="width:200px"></input>
    </div>
    <div>
        <label for="remark">备注:</label>
        <input name="remark" class="easyui-textbox" data-options="multiline:true" style="width:300px;height:100px">
    </div>
    <div>
        <a id="btn25" href="#" class="easyui-linkbutton" onclick="save()" >保存</a>

    </div>
</form>
<script type="text/javascript">
    $(function() {

        var orderarray =parent.$("#table").datagrid("getSelections");
        $("#ff4").form('load',{
            depName :  orderarray[0].depName,
            diningtableId : orderarray[0].diningtableId,
            diningtableName : orderarray[0].diningtableName,
            seating :orderarray[0].seating
        });
        //禁用验证
//        $("#ff3").form("disableValidation");

        $("#btn25").click(function() {
            $("#ff4").form("enableValidation");
            if ($("#ff4").form("validate")) {
                $('#ff4').form('submit', {
                    url : '${proPath}/orderTable/addOrder.mvc',
                    onSubmit : function() {
                        $('#ff4').form('enableValidation');
                        return $('#ff4').form('validate');;
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
