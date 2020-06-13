<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>添加商品信息</title>
</head>
<body>
<p align="center">所属菜单名称:<input id="ccc" name="menuName" onchange="menu2()"></p><br>
<div align="center">
    <div id="tt" class="easyui-tabs" style="width:750px;height:450px;" align="center">
        <div title="基本数据" style="padding:20px;" align="center">
            <table>
                <tr>
                    <td>商品名称：<input id="t1" class="easyui-validatebox" data-options="required:true,validType:'text'"/>
                    </td>
                    <td>商品编号：<input id="t2" class="easyui-validatebox" data-options="required:true,validType:'text'"/>
                    </td>
                </tr>
                <tr>
                    <td>商品价格：<input id="t3" class="easyui-validatebox"/></td>
                    <td>商品品牌：<input id="t4" class="easyui-validatebox"/></td>
                </tr>
                <tr>
                    <td>商品卖点：<input id="t5" class="easyui-validatebox"/></td>
                    <td>商品状态：<select id="t6" class="easyui-combobox" name="goodsStatus" style="width:100px;">
                        <option value="1">上架</option>
                        <option value="2">下架</option>
                        <option>--请选择--</option>
                    </select></td>
                </tr>
                <tr>
                    <td>售后条款：<input id="t7" class="easyui-validatebox" style="width: 200px;height: 80px;"/></td>
                    <td>
                        <div>
                            <p>图片上传：</p><br>
                            <p>
                                <img class="user-header" style="width: 100px;height: 100px;object-fit: cover;"
                                     src="${imgUser.data.userProfilePhoto}">
                            </p>
                            <br>
                            <form id="test22"  method="post" enctype="multipart/form-data">
                                <input type="file" name="files" onchange="imgChange(event)" id="file" style="display: none"/>
                            </form>
                            <button data-role="none" onclick="testUpload();" class="btn btn-info">上传</button>
                        </div>
                        <input id="img" name="goodsImage" type="hidden">
                    </td>
                </tr>
            </table>
        </div>
        <div title="商品描述" style="overflow:auto;padding:20px;">
            商品描述：
            <iframe id="myiframe" name="myiframe" frameborder="0" height="100%" width="100%"
                    src="/KindEditor.jsp"></iframe>
        </div>
        <div id="yyy" title="规格参数" data-options="iconCls:'icon-reload'" style="padding:20px;">
        </div>
    </div>
</div>
<input type="hidden" name="goodsImage">
<div align="center">
    <input type="button" value="保存" onclick="save()">
    <input type="button" value="返回" onclick="exit()">
</div>
<script type="text/javascript">
    $('#ccc').combobox({
        url: '${baseURL}/menu2/selectMenu.mvc',
        valueField: 'menuId',
        textField: 'menuName',
        onSelect: function () {
            var newPtion = $("#ccc").combobox('getText');
            $.ajax({
                type: 'post',
                url: '${baseURL}/menuParameter/selectImt.mvc',
                traditional: true,
                data: {menuName: newPtion},
                dataType: 'JSON',
                cache: false,
                success: function (data) {
                    var select = $('#yyy');
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
        var menu1 = $("#ccc").val();
        var menu2 = $("select option:selected").val();
        alert(menu1 + menu2);
    }
    function exit() {
        $("#win5").window("close");
    }
    function save() {
        var s1 = $("#ccc").combobox('getText');
        var t1 = $("#t1").val();
        var t2 = $("#t2").val();
        var t3 = $("#t3").val();
        var t4 = $("#t4").val();
        var t5 = $("#t5").val();
        var t6 = $("#t6").combobox('getValues');
        var t7 = $("#t7").val();
        var img = $("#img").val();
        /* var content1 = $("#content1").val();*/
        var fuWenBen = window.frames["myiframe"].document.getElementById("content1").value;
        var t8 = $("#yyy").children("div").length;
        var eee = "";
        for (i = 0; i < t8; i++) {
            var t9 = $("input[name='radio" + i + "']:checked").val();
            if (t9 != null) {
                eee += t9;
            }
        }
        alert(t1 + t2 + t8);
        //使用
        $.ajax({
            type: "POST",//表示请求的提交方式有POST、GET
            url: "${baseURL}/goods/insert.mvc",// 请求地址
            traditional: true,
            cache: false,
            dataType: "json",
            data: {
                menuName: s1,
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
            }//请求的数据
            /*data:{ menuName:$("[name=menuName]").val()}*/,
            //success表示请求成功后调用的方法，返回信息会自动传给参数msg
            success: function () {
                alert('添加成功');
            },
            //error表示系统出错，调用的方法
            error: function () {
                alert("系统出错了！");
            }
        });
        $("#qwe").datagrid("reload");
        $("#win5").window("close");
    };
    function imgChange(e) {
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
    function testUpload() {
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