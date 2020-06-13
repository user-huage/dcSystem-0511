<%--
  Created by IntelliJ IDEA.
  User: LYS
  Date: 2020/6/8
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
</head>
<body>
<textarea id="content1" name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
<script>
    var editor
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content1"]', {
            cssPath : 'kindeditor/plugins/code/prettify.css',
            uploadJson : 'kindeditor/jsp/upload_json.jsp',
            fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            /*afterCreate : function() {
             var self = this;
             K.ctrl(document, 13, function() {
             self.sync();
             document.forms['example'].submit();
             });
             K.ctrl(self.edit.doc, 13, function() {
             self.sync();
             document.forms['example'].submit();
             });
             },*/

            afterBlur: function () { this.sync(); }
        });
        prettyPrint();
    });
    <%--        function te() {
                //editor.sync();
                html=document.getElementById('content1').value;
                alert(html);

            }--%>
</script>
</body>
</html>
