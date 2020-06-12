<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#deptTree').tree({
            url:'${proPath}/queryAllDept.mvc',
            method:'post',
            checkbox:true,
            cascadeCheck:false
        });
    })
    function mainAddTotalDept(){
        $('#deptPanel').panel('refresh',"${proPath}/goUrl.mvc?src=addTotalDept");
    }
    function mainAddSubDept(){
        var nodes=$("#deptTree").tree("getChecked");
        if(nodes.length>1){
            alert("只能选择一个部门进行添加！！！");
            return;
        }else if(nodes.length==0){
            alert("必须选择一个部门才能进行添加！！！");
            return;
        }
        if(nodes[0].parentId != 0){
            alert("必须选择总公司才能进行添加！！！");
            return;
        }
        $('#deptPanel').panel('refresh',"${proPath}/goUrl.mvc?src=addSubDept&depName="+nodes[0].text+"&parentId="+nodes[0].id);
    }
    function mainUpdateDept(){
        var nodes=$("#deptTree").tree("getChecked");
        if(nodes.length>1){
            alert("只能选择一个部门进行修改！！！");
            return;
        }else if(nodes.length==0){
            alert("必须选择一个部门才能进行修改！！！");
            return;
        }
        $.ajax({
            url:"${proPath}/queryDept.mvc",
            method:"post",
            data:{depName:nodes[0].text},
            success:function (data) {
                $('#deptPanel').panel('refresh',"${proPath}/goUrl.mvc?src=updateDept&depName="+data.depName+"&depId="+data.depId+"&depAddress="+data.depAddress+"&status="+data.status+"&remarks="+data.remarks);
            }
        });
    }
    function mainRemoveDept(){
        var nodes=$("#deptTree").tree("getChecked");
        if(nodes.length==0){
            alert("必须选择一个部门才能进行删除！！！");
            return;
        }
        var depNames=new Array();
        $(nodes).each(function (i,node) {
            depNames[i]=node.text;
        });
        $('#deptPanel').panel('refresh',"${proPath}/goUrl.mvc?src=removeDept&a="+depNames);
    }
</script>
<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'部门列表',split:true" style="width:250px;">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="mainAddTotalDept()">添加总公司</a></br>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="mainAddSubDept()">添加分公司</a></br>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="mainUpdateDept()">修改部门</a></br>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="mainRemoveDept()">删除部门</a>
        <hr>
        <ul id="deptTree"></ul>
    </div>
    <div data-options="region:'center',split:true">
        <div id="deptPanel" class="easyui-panel" data-options="fit:true"></div>
    </div>
</div>
</body>
</html>