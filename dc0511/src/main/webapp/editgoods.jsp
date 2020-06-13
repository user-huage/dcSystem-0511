<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/4
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>修改商品信息</title>
</head>
<body>
<form id="editGoods" method="post">
    <p align="center">所属菜单名称:<input id="" name="menuName"></p><br>
    <div align="center">
        <div id="tt" class="easyui-tabs" style="width:750px;height:450px;">
            <div title="基本数据" style="padding:20px;">
                <table>
                    <tr>
                        <td>商品名称：<input id="b1" name="goodsName" class="easyui-validatebox"
                                        data-options="required:true,validType:'text'"/></td>
                        <td>商品编号：<input id="b2" name="goodsNumber" class="easyui-validatebox"
                                        data-options="required:true,validType:'text'"/></td>
                    </tr>
                    <tr>
                        <td>商品价格：<input id="b3" name="goodsPrice" class="easyui-validatebox"/></td>
                        <td>商品品牌：<input id="b4" name="goodsType" class="easyui-validatebox"/></td>
                    </tr>
                    <tr>
                        <td>商品卖点：<input id="b5" name="goodsSell" class="easyui-validatebox"/></td>
                        <td>商品状态：<select id="b6" class="easyui-combobox" name="goodsStatus" style="width:100px;">
                            <option value="1">上架</option>
                            <option value="2">下架</option>
                            <option>--请选择--</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>售后条款：<input id="b7" name="goodsAfter" class="easyui-validatebox"
                                        style="width: 200px;height: 80px;"/></td>
                        <td>
                            <div>
                                <p>更换图片：</p><br>
                                <p>
                                    <img class="user-header" style="width: 100px;height: 100px;object-fit: cover;"
                                         src="${imgUser.data.userProfilePhoto}">
                                    <img id="img" name="goodsImage">
                                </p>
                                <br>
                                <form id="test22"  method="post" enctype="multipart/form-data">
                                    <input type="file" name="files" onchange="imgChange1(event)" id="file" style="display: none"/>
                                </form>
                                <button data-role="none" onclick="testUpload1();" class="btn btn-info">上传</button>
                            </div>
                            <input id="image" name="goodsImage" type="hidden">
                        </td>
                    </tr>
                </table>
            </div>
            <div title="商品描述" style="overflow:auto;padding:20px;">
                商品描述：
                <iframe id="myiframe" name="myiframe" frameborder="0" height="100%" width="100%"
                        src="/KindEditor.jsp"></iframe>
            </div>
            <div id="lll" title="规格参数" data-options="iconCls:'icon-reload'" style="padding:20px;">
                <input id="menuParameter" name="menuParameter">
               <%-- <input type="radio" class="zxc" name="colors"  value="1">大
                <input type="radio" class="zxc" name="colors"  value="2">中
                <input type="radio" class="zxc" name="colors"  value="3">小
                        <a onclick="zxc()">sdsdsdsdsdd</a>--%>
            </div>
        </div>
    </div>
</form>
<div align="center">
    <input type="button" value="保存" onclick="save1()">
    <input type="button" value="返回" onclick="exit1()">
</div>
<div id="div_5" style="width:50%;"></div>
<script type="text/javascript">
    /*function zxc(){
       alert( $('input[name="colors"]:checked').val())   }*/
    $('#rrr').combobox({
        url: '${baseURL}/menu2/selectMenu.mvc',
        valueField: 'menuId',
        textField: 'menuName',
        onSelect: function () {
            var newPtion = $("#rrr").combobox('getText');
            $.ajax({
                type: 'post',
                url: '${baseURL}/menuParameter/selectImt.mvc',
                traditional: true,
                data: {menuName: newPtion},
                dataType: 'JSON',
                cache: false,
                success: function (data) {
                    var select = $('#lll');
                    select.empty();
                    for (var i = 0; i < data.length; i++) {
                        for (var j in data[i]) {
                            if (j.valueOf() == "menuParameter") {
                                var s1 = data[i][j];
                            } else if (j.valueOf() == "menuStyleselect") {
                                var str = data[i][j];
                                var strs = new Array(); //定义一数组
                                strs = str.split("/"); //字符分割
                                var s2 = "";
                                for (var n = 0; n < strs.length; n++) {
                                    var s3 = "<input style='margin-left: 5px' type='radio' name='radio" + i + "' value='" + s1 + "-" + strs[n] + "'/><span>" + strs[n] + "</span>";
                                    s2 = s2 + s3;
                                }
                            }
                        }
                        select.append('<div>' + s1 + "：" + s2 + '<div>');
                        console.log('<div>' + s1 + "：" + s2 + '<div>');
                    }
                }
            })
        }
    })
    function menu2() {
        var menu1 = $("#rrr").val();
        var menu2 = $("select option:selected").val();
        alert(menu1 + menu2);
    }
    function exit1() {
        parent.$("#win6").window("close");
    }
    function save1() {
        var a1 = window.parent;
        var arr = a1.$('#qwe').datagrid("getSelections");
        var goodsId = arr[0].goodsId;
        var menuName = $('#rrr').val();
        var t1 = $("#b1").val();
        var t2 = $("#b2").val();
        var t3 = $("#b3").val();
        var t4 = $("#b4").val();
        var t5 = $("#b5").val();
        var t6 = $("#b6").combobox('getValues');
        var t7 = $("#b7").val();
        var img = $("#image").val();
        var fuWenBen = window.frames["myiframe"].document.getElementById("content1").value;
        var t8 = $("#lll").children("div").length;
        var eee = "";
        for (i = 0; i < t8; i++) {
            var t9 = $("input[name='radio" + i + "']:checked").val();
            if (t9 != null) {
                eee += t9;
            }
        }
        $.ajax({
            type: "POST",//表示请求的提交方式有POST、GET
            url: "${baseURL}/goods/update.mvc",// 请求地址
            traditional: true,
            cache: false,
            dataType: "json",
            data: {
                goodsId: goodsId,
                menuName: menuName,
                goodsName: t1,
                goodsNumber: t2,
                goodsImage: img,
                goodsPrice: t3,
                goodsType: t4,
                goodsSell: t5,
                goodsStatus: t6,
                goodsAfter: t7,
                menuParameter: eee,
                goodsDescribe: fuWenBen
            },
            success: function (data, textStaus, jqXHR) {
                $("#div_5").html(data);
                if (data.code == 200) {
                    alert("1");
                }
            },
            //error表示系统出错，调用的方法
            error: function (data, textStaus) {
                if (data.code == 999) {
                    alert("-1");
                }
            }
        });
        a1.$("#qwe").datagrid("reload");
        parent.$('#win6').window("close");
    }
    var array = parent.$("#qwe").datagrid("getSelections");
    $('#editGoods').form('load', {
        menuName: array[0].menuName,
        goodsName: array[0].goodsName,
        goodsNumber: array[0].goodsNumber,
        goodsPrice: array[0].goodsPrice,
        goodsType: array[0].goodsType,
        goodsSell: array[0].goodsSell,
        goodsStatus: array[0].goodsStatus,
        goodsAfter: array[0].goodsAfter,
        menuParameter: array[0].menuParameter,
        goodsDescribe: array[0].goodsDescribe
    });
    $("#img").attr("src","/img/"+array[0].goodsImage);
    function imgChange1(e) {
        console.info(e.target.files[0]);//图片文件
        console.log(e.target.value);//这个也是文件的路径和上面的dom.value是一样的
        var reader = new FileReader();
        reader.onload = (function (file) {
            return function (e) {
                $('.user-header').attr('src', this.result);
            };
        })(e.target.files[0]);
        reader.readAsDataURL(e.target.files[0]);
    }

    $('.user-header').click(function () {
        $("#file").click();
    });
    function testUpload1() {
        $('#test22').form('submit', {
            url:"/fileUploadController/upload.mvc",
            onSubmit: function(){
                return true;
            },
            success:function(data){
                document.getElementById("img").value=data;
                alert(data)
            }
        });
    }
</script>
</body>
</html>
