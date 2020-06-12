<%@ include file="../../common/common.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $.messager.confirm("删除框","确认要删除吗？",function(r){
            if(r){
                $.ajax({
                    url:"${proPath}/removeDept.mvc",
                    method:"post",
                    data:{depNames:"${param.a}"},
                    success:function (msgg) {
                        if (msgg.msg) {
                            alert(msgg.msg);
                            if(msgg.msg=="删除成功！！！") {
                                $("#deptTree").tree("reload");
                            }
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
