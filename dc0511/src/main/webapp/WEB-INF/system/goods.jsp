<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/5/20
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品表列表</title>
</head>
<body>
<form id="aaa" method="post">
    <div align="center">
        总公司:<input id="totalName" class="easyui-combobox" data-options="
        valueField: 'id',
        textField: 'text',
        url: 'get_data1.php',
        onSelect: function(rec){
            var url = 'get_data2.php?id='+rec.id;
            $('#subName').combobox('reload', url);
        }"/>
        分公司:<input id="subName" class="easyui-combobox" data-options="valueField:'id',textField:'text'"/>
        商品名称:<input class="easyui-validatebox" type="text" name="goodsName"/>
        商品分类:<input class="easyui-validatebox" type="text" name="menuName"/>
        商品编号:<input class="easyui-validatebox" type="text" name="goodsNumber"/>
        商品状态:<select id="goodsStatus" class="easyui-combobox" name="goodsStatus" style="width:200px;">
        <option value="1">上架</option>
        <option value="2">下架</option>
        <option>--请选择--</option>
    </select>
        <input type="button" onclick="queryGoods()" value="搜索">
    </div>
</form>
<table id="qwe" title="商品表列表"></table>
<div id="win5"></div>
<div id="win6"></div>
<script type="text/javascript">
    $('#totalName').combobox({});
    $('#subName').combobox({});
    function queryGoods() {
        $("#qwe").datagrid("load", {
            goodsId: $("[name=goodsId]").val(),
            totalName: $("[name=totalName]").val(),
            subName: $("[name=subName]").val(),
            goodsName: $("[name=goodsName]").val(),
            menuName: $("[name=menuName]").val(),
            goodsNumber: $("[name=goodsNumber]").val(),
            goodsStatus: $("[name=goodsStatus]").val(),
            menuParameter: $("[name=menuParameter]").val(),
            goodsDescribe: $("[name=goodsDescribe]").val()
        });
    }
    $(function () {
        $('#qwe').datagrid({
            url: '${baseURL}/goods/selectPage.mvc',
            columns: [[
                {checkbox: true},
                {field: 'totalName', title: '总公司', width: 100},
                {field: 'subName', title: '分公司', width: 100},
                {
                    field: 'goodsImage', title: '商品图片', width: 100, formatter: function (value, row, index) {
                    return "<img src='/img/"+value+"' style='height: 40px ;width: 40px;'>";
                }
                },
                {field: 'goodsNumber', title: '商品编号', width: 100},
                {field: 'goodsName', title: '商品名称', width: 100},
                {field: 'menuName', title: '商品分类', width: 100},
                {field: 'goodsPrice', title: '商品价格', width: 100},
                {
                    field: 'goodsStatus', title: '商品状态', width: 100, formatter: function (value) {
                    if (value == "1") {
                        return "上架";
                    } else if (value == "2") {
                        return "下架";
                    } else {
                        return "未知类型";
                    }
                }
                },
                {field: 'goodsDate', title: '创建时间', width: 100, align: 'right',formatter: formatDatebox}
            ]],
            fitColumns: true,
            toolbar: [{
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    $('#win5').window({
                        title: "添加商品信息",
                        width: 800,
                        height: 600,
                        href: '/addgoods.jsp',
                        modal: true
                    });
                }
            }, '-', {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var array = $("#qwe").datagrid("getSelections");
                    if (array.length == 1) {
                        parent.$('#win6').window({
                            title: '修改商品信息',
                            width: 800,
                            height: 600,
                            modal: true,
                            content: "<iframe src='../../editgoods.jsp' height='100%' width='100%' frameboder='0px'  scrolling='no' ></iframe>"
                        });
                    } else {
                        $.messager.show({
                            title: '操作提示',
                            msg: '请只选择一条需要修改的记录。',
                            timeout: 4000,
                            showType: 'slide'
                        });
                    }
                }
            }, '-', {
                text: '删除',
                iconCls: 'icon-remove',
                handler: function del(index) {
                    var r = $('#qwe').datagrid('getSelected');
                    if (r == null) {
                        alert("请选择一项要删除的商品");
                        return false;
                    }
                    $.messager.confirm('确认', '确认删除', function (row) {
                        if (row) {
                            $.ajax({
                                url: '${baseURL}/goods/delete.mvc',
                                method: "post",
                                data: "goodsId=" + r.goodsId,
                                success: function () {
                                    alert('删除成功');
                                    $("#qwe").datagrid("reload");
                                }
                            });
                        }
                    })
                }
            }],
            pagination: true,
            rownumbers: true,
            pageSize: 5,
            pageList: [5, 10, 15, 20, 25],
            striped: true
        });
    });

    /**
     * Created by Administrator on 2020/5/18.
     */
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
            // millisecond
        }
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }


    function formatDatebox(value) {

        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }

        return dt.format("yyyy-MM-dd hh:mm:ss");
    }
</script>
</body>
</html>