<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <select id="year1" style="width:100px;">
        <option value="2019">2019</option>
        <option value="2020">2020</option>
        <option value="2021">2021</option>
    </select>年
    <select id="month1"  style="width:100px;">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
    </select>月
    <select id="day1"  style="width:100px;">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
    </select>号
    <input type="button" onclick="queryLog()" value="查询">
</div>
<div id="logWin" class="easyui-window" title="日志信息查看" closed="true" style="width:480px;height:320px;padding:1px;">
    <p id="pid"></p>
</div>

<div id="updateWin" class="easyui-window" title="指定日期更新" closed="true" style="width:480px;height:320px;padding:1px;">
    <p id="pid1"></p>
</div>

<table id="dgLog"></table>
<script type="text/javascript">
    function showUpdate() {
        $('#pid1').html("选择报表类型：<select id='s1'  style='width:100px;'>" +
                "<option value='D'>订单</option><option value='T'>退款</option>"+
            "</select><p/>" +
            "选择日期：<select id='sYear'  style='width:100px;'><option value='2019'>2019</option><option value='2020'>2020</option><option value='2021'>2021</option></select>年" +
            "<select id='sMonth'  style='width:100px;'><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option></select>月" +
            "<select id='sDay'  style='width:100px;'><option value='1'>1</option><option value='2'>2</option>" +
            "<option value='3'>3</option><option value='4'>4</option>" +
            "<option value='5'>5</option><option value='6'>6</option>" +
            "<option value='7'>7</option><option value='8'>8</option>" +
            "<option value='9'>9</option><option value='10'>10</option>" +
            "<option value='11'>11</option><option value='12'>12</option>" +
            "<option value='13'>13</option><option value='14'>14</option>" +
            "<option value='15'>15</option><option value='16'>16</option>" +
            "<option value='17'>17</option><option value='18'>18</option>"+
            "<option value='27'>27</option><option value='28'>28</option>" +
            "<option value='29'>29</option><option value='30'>30</option><option value='31'>31</option></select>号<p/>" +
            "<input type='button' onclick='updateLog1()' value='确定'>");
        $('#updateWin').window('open');
        $('#updateWin').window('center');
    }
    function updateLog1() {
        var year=$("#sYear").val();
        var month=$("#sMonth").val();
        var day=$("#sDay").val();
        var s=$("#s1").val();
        var dateString=year+"-"+month+"-"+day;
        //var date1 = new Date(dateString);
        $.post(
            "${proPath}/log/updateLog.mvc",
            {date:dateString,s:s},
            function(json){
                alert(json.msg);
                $('#updateWin').window('minimize');
                $('#dgLog').datagrid("reload");

                //$('#dgLog').datagrid("clearSelections");
            },
            "json"
        );
    }
    function showLog() {
        var row=$("#dgLog").datagrid("getSelected");
        if(row==null){
            alert("请先选择查询的行");
            return false;
        }
        $('#pid').text(row.logMsg);
        $('#logWin').window('open');
        $('#logWin').window('center');

    }
    function queryLog() {
        var year=$("#year1").val();
        var month=$("#month1").val();
        var day=$("#day1").val();
        var dateString=year+"-"+month+"-"+day;
        //var date1 = new Date(dateString);
        //alert(dateString);
        $("#dgLog").datagrid("load",{
            dates:dateString
        });
    }
    function updateLog() {
        var row = $('#dgLog').datagrid('getSelected');
        if(row==null){
            alert("请先选择需要更新的行");
            $('#dgLog').datagrid("reload");
            $('#dgLog').datagrid("clearSelections");
            return false;
        }
        $.post(
            "${proPath}/log/updateLog.mvc",
            {taskId:row.taskId},
            function(json){
                alert(json.msg);
                $('#dgLog').datagrid("reload");
                $('#dgLog').datagrid("clearSelections");
            },
            "json"
        );
    }
    $(function () {
        $('#dgLog').datagrid({
            url:'${proPath}/log/selectLog.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'taskId',title:'任务编号',width:100},
                {field:'taskName',title:'任务名称',width:100},
                {field:'taskText',title:'任务内容',width:100},
                {field:'dateTime',title:'所属日期',width:100},
                {field:'taskTime',title:'执行时间',width:100},
                {field:'operStatus',title:'操作状态',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='操作成功';
                        }else if(value=='0'){
                            return value='操作失败';
                        }else {
                            return value='异常';
                        }
                    }
                },
                {field:'logMsg',title:'日志信息',width:100},
                {field:'updateTime',title:'修改时间',width:100},
                {field:'user',title:'用户',width:100},
                {field:'functions',title:'功能',width:100,
                    formatter: function (value, row, index) {
                        return '<a href="#" onclick="updateLog()">更新数据</a>';
                    }
                }
            ]],
            toolbar: [{
                iconCls: 'icon-search',
                text: '查询日志',
                handler: showLog
            }, {
                iconCls: 'icon-reload',
                text: '指定日期更新',
                handler:showUpdate
            }],

            fitColumns:true,
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
    });
</script>
</body>
</html>

