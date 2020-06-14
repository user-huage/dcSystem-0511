<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后厨订单管理</title>

    <%--
            用error调试错误信息：
            可以alert出来，查看具体是哪里出错了
            具体参数：
            XMLHttpRequest：XMLHttpRequest.readyState: 状态码的意思
            0 － （未初始化）还没有调用send()方法
            1 － （载入）已调用send()方法，正在发送请求
            2 － （载入完成）send()方法执行完成，已经接收到全部响应内容
            3 － （交互）正在解析响应内容
            4 － （完成）响应内容解析完成，可以在客户端调用了
            XMLHttpRequest：XMLHttpRequest.status:
            textStatus：错误原因
            null timeout error notmodified  parsererror
            errorThrown:（可选）捕获的错误对象*/

    --%>
</head>
<body>
<table id="goodsOrder"></table>

<script type="text/javascript">
    $(function(){
        $('#goodsOrder').datagrid({
            url:'${baseURL}/goodsOrder/OrderSelectList.mvc',
            columns:[[
                {checkbox:true},
                {field:'orderId',title:'订单编号',width:100},
                {field:'depName',title:'部门名称',width:100},
                {field:'diningtableId',title:'餐桌编号',width:100},
                {field:'diningtableName',title:'餐桌名称',width:100},
                {field:'goodsNumber',title:'商品编号',width:100},
                {field:'goodsName',title:"商品名称",width:100},
                {field:'goodsImage',title:'商品图片',width:100,
                    align: 'center',
                    formatter: function (value, rec) {//使用formatter格式化刷子
                        return '<img src=' + value + '>';
                    }},
                {field:'placeNumber',title:'下单数量',width:100},
                {field:'returnNumber',title:'退菜数量',width:100},
                {field:'cookNumber',title:'应做数量',width:100},
                {field:'state',title:'订单状态',width:100,
                    formatter: function (value, row, index) {
                        if (value=='1'){
                            return value='待制作';
                        }else if(value=='2'){
                            return value='正在制作';
                        }else if(value=='3'){
                            return value='制作完成';
                        }else if(value=='4'){
                            return value='已经上菜';
                        }else if(value=='5'){
                            return value='订单退订';
                        }else if(value=='6'){
                            return value='删除';
                        }else {
                            return value='异常';
                        }
                    }},
                {field:'startTime',title:'下单时间',width:100},
                {field:'shoppingExplai',title:'备注',width:100}
            ]],
            fitColumns:true,
            toolbar:[{
                text:'正在制作',
                iconCls:'icon-add',
                handler: function(){
                    var rows = $("#goodsOrder").datagrid("getSelections");
                    var bool = true;
                    var state2 = 2;
                    //alert(array);
                    //判断是否选中
                    if (rows.length == 1) {
                        //定义数组，通过下边的用来存储选中记录的Id
//                        var states = new Array();
//                        for (i = 0; i < array.length; i++) {
                        var state = rows[0].state;
                        alert(rows[0].state);
                        if(state != 1){
                            bool = false;
                            $.messager.alert('提示消息',"请选择状态为 1、待用餐的订单");
                        }

                        if(bool){
                            sava(state2,rows);
                        }
                    } else {
                        $.messager.show({
                            title : '操作提示',
                            msg : '请先选择一条要改变的订单。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }

            },'-', {
                text: '已结束',
                iconCls: 'icon-edit',
                handler: function () {
                    var rows = $("#goodsOrder").datagrid("getSelections");
                    var bool = true;
                    var state3 = 3;

                    if (rows.length == 1) {
                        var state = rows[0].state;
                        alert(rows[0].state);
                        if(state != 2){
                            bool = false;
                            $.messager.alert('提示消息',"请选择状态为 2、正在用餐的订单");
                        }
                        if(bool){
                            sava(state3,rows);
                        }
                    } else {
                        $.messager.show({
                            title : '操作提示',
                            msg : '请先选择一条要改变的订单。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }
            },'-', {
                text: '取消订单',
                iconCls: 'icon-edit',
                handler: function () {
                    var rows = $("#goodsOrder").datagrid("getSelections");
                    var bool = true;
                    var state3 = 4;

                    if (rows.length == 1) {
                        var state = rows[0].state;
                        alert(rows[0].state);
                        if(bool){
                            sava(state3,rows);
                        }
                    } else {
                        $.messager.show({
                            title : '操作提示',
                            msg : '请先选择一条要取消的订单。',
                            timeout : 4000,
                            showType : 'slide'
                        });
                    }
                }
            }],
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            striped:true

        });
    });

    function sava(state,rows) {
        $.ajax({
            type: "POST",
            url: "${baseURL}/goodsOrder/updateGoodsOrder.mvc",
            data: "diningtableId="+rows[0].diningtableId+"&depName="+rows[0].depName+"&orderId="+rows[0].orderId+"&state="+state,
            success: function(i){
                if(i>0){
                    alert("恭喜您，修改成功，共修改了"+i+"条记录！");
                }else{
                    alert("对不起，修改失败！");
                }
                //重新刷新页面
                $("#goodsOrder").datagrid("reload");
                //请除所有勾选的行
                $("#goodsOrder").datagrid("clearSelections");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                //  $.messager.alert('删除错误','请联系管理员！','error');
                alert("修改错误,请联系管理员"+XMLHttpRequest.readyState+textStatus+errorThrown);
            }
        });

    }



    var websocket = null;
    var host = window.location.host;//localhost:8080
    //alert(host)
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        // 路径+端口号   项目名   webSocket路径              var wsPath = window.location.host + "/项目名/websocket";
        websocket = new WebSocket("ws://"+host+ "/websocket.mvc");//id可以自己设计?id=<%--<%=session.user.userId()%>--%>
    } else if ('MozWebSocket' in window) {
        websocket = new MozWebSocket("ws://" + host
            + "/websocket.mvc");
    } else {
        alert('Not support websocket')
        websocket = new SockJS("http://" + host
            + "/sockjs/websocket.mvc");
    }
    //连接发生错误的回调方法
    websocket.onerror = function() {
        setMessageInnerHTML("error");
    };
    //连接成功建立的回调方法
    websocket.onopen = function(event) {
        alert("页面client打开websocket连接-----open");
    }
    //接收到消息的回调方法
    websocket.onmessage = function() {
        alert(event.data);
    }
    //连接关闭的回调方法
    websocket.onclose = function() {
        setMessageInnerHTML("页面client关闭websocket连接-----close");
    }
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function() {
        websocket.close();
    }
    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        //document.getElementById('message').innerHTML += innerHTML + '<br/>';
    }
    //关闭连接
    function closeWebSocket() {
        websocket.close();
    }
    //发送消息
    function send(message) {
//        var message = document.getElementById('text').value;
        websocket.send(message);
    }


</script>
</body>
</html>
