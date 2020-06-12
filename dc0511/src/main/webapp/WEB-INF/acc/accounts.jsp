<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <select id="year"  style="width:100px;">
        <option value="2019">2019</option>
        <option value="2020">2020</option>
        <option value="2021">2021</option>
    </select>年
    <select id="month" style="width:100px;">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
    </select>月
    <select id="day"  style="width:100px;">
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
    <input type="button" onclick="queryAcc()" value="查询">
</div>
<table id="dgAcc"></table>
<div style="float: right" id="abc">

</div>

<script type="text/javascript">
    function loadSuccess() {
        var a=$("#dgAcc").datagrid("getRows");
        var num=0;
        var money=0.0;
        for(var i=0;i<a.length;i++){
            num=num+a[i].finalNum;
            money=money+a[i].finalPayment;
        }
        $("#abc").html("<table> <tr> <td><p>合计:</p></td> <td>总销售额&nbsp;&nbsp;"+money+"元，总销售量&nbsp;&nbsp;"+num+"</td> </tr> </table>");
    }
    function queryAcc() {
        var year=$("#year").val();
        var month=$("#month").val();
        var day=$("#day").val();
        var dateString=year+"-"+month+"-"+day;
        //var date1 = new Date(dateString);
        //alert(dateString);
        $("#dgAcc").datagrid("load",{
            dates:dateString
        });
    }
    $(function () {
        $('#dgAcc').datagrid({
            url:'${proPath}/acc/selectAcc.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'goodsName',title:'商品',width:100},
                {field:'salePayment',title:'销售额',width:100},
                {field:'refundPayment',title:'销售退款',width:100,
                    formatter: function (value, row, index) {
                        if (value==null){
                            return value='0';
                        }else {
                            return value=value;
                        }
                    }
                },
                {field:'finalPayment',title:'实际销售额',width:100},
                {field:'saleNum',title:'销售量',width:100},
                {field:'refundNum',title:'销售退货量',width:100,
                    formatter: function (value, row, index) {
                        if (value==null){
                            return value='0';
                        }else {
                            return value=value;
                        }
                    }
                },
                {field:'finalNum',title:'实际销售量',width:100},
                {field:'orderTime',title:'所属日期',width:100}
            ]],
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
            onLoadSuccess:loadSuccess,
            striped:true

        });
    });
</script>
</body>
</html>
