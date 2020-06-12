<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <TITLE>后台管理平台2</TITLE>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <LINK rel="stylesheet" type="text/css" href="/dc-manager/css/style.css">
    <LINK rel="stylesheet" type="text/css" href="/dc-manager/css/login.css">

    <STYLE type="text/css">
        .btnalink {
            cursor: hand;
            display: block;
            width: 80px;
            height: 29px;
            float: left;
            margin: 12px 28px 12px auto;
            line-height: 30px;
            background: url('/dc-manager/images/login/btnbg.jpg') no-repeat;
            font-size: 14px;
            color: #fff;
            font-weight: bold;
            text-decoration: none;
        }
    </STYLE>
    <script type="text/javascript">

        $(function () {
            $("#usercode").focus();
        });
        //登录提示方法
        function loginsubmit() {
            var userName = $("#usercode").val();
            var userCode = $("#pwd").val();
            if(!userName){
                $("#usercode").focus();
                $("#err").html("<span style='color: red'>请输入用户名</span>");
                return;
            }
            if(!userCode){
                $("#pwd").focus();
                $("#err").html("<span style='color: red'>请输入密码</span>");
                return;
            }
            $("#loginform").submit();
        }
    </SCRIPT>
</HEAD>
<BODY style="background: #f6fdff url(/dc-manager/images/login/bg1.jpg) repeat-x;">
<FORM id="loginform" name="loginform" action="${proPath}/login.mvc"
      method="post">
    <DIV class="logincon">

        <DIV class="title">
            <IMG alt="" src="/dc-manager/images/login/logo.png">
        </DIV>

        <DIV class="cen_con">
            <IMG alt="" src="/dc-manager/images/login/bg2.png">
        </DIV>

        <DIV class="tab_con">

            <input type="password" style="display:none;" />
            <TABLE class="tab" border="0" cellSpacing="6" cellPadding="8">
                <TBODY>
                <TR>
                    <TD>用户名：</TD>
                    <TD colSpan="2"><input type="text" id="usercode"
                                           name="userName" style="WIDTH: 130px" required/></TD>
                </TR>
                <TR>
                    <TD>密 码：</TD>
                    <TD><input type="password" id="pwd" name="userCode" style="WIDTH: 130px" />
                    </TD>
                </TR>

                <TR>
                    <TD colSpan="2" align="center"><input type="button"
                                                          class="btnalink" onclick="loginsubmit()" value="登&nbsp;&nbsp;录" />
                        <input type="reset" class="btnalink" value="重&nbsp;&nbsp;置" /></TD>
                </TR>
                <tr><span style="color: red"><%--这里是登录有误的情况下返回的提示信息--%></span></tr>
                </TBODY>
            </TABLE>

        </DIV>
    </DIV>
</FORM>
</BODY>
</HTML>
