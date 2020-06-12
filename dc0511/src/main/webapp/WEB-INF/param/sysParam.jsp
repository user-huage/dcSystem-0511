<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table id="dgparam"></table>

<script type="text/javascript">
    $(function(){
        $('#dgparam').datagrid({
            url:'${proPath}/sysParam/selectParam.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'field',title:'所属类型键',width:100},
                {field:'type',title:'所属类型名',width:100},
                {field:'fieldName',title:'参数键',width:100},
                {field:'fieldValue',title:'参数值',width:100}
            ]],
            fitColumns:true,
            toolbar:[{
                iconCls: 'icon-reload',
                text:'重新加载系统参数',
                handler: function(){
                    $('#dgparam').datagrid("reload");
                }
            }],
            //nowrap:false,
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            /* queryParams: {
             userName: '1'
             }
             */
            /* rowStyler: function(index,row){
             if (row.unitcost>80){
             return 'background-color:#6293BB;color:#fff;';
             }
             }, */

            striped:true

        });

//        $("#dg").datagrid("load",{
//            sysParamField:"mode"
//        });
    })

</script>
</body>
</html>
