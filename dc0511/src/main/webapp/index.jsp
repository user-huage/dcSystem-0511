<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/common.jspf"%>
<html>
<head>
    <title>点餐系统</title>
    <script type="text/javascript">
        //创建选项卡
        function addTabs(name,src){
            if($('#indexTabs').tabs('exists',name)){
                $('#indexTabs').tabs ('select',name);
            }else{
                $('#indexTabs').tabs ('add',{
                    title:name,
                    closable:true,
                    href:src
                });
            }
        }
    </script>
</head>
<body>
<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',split:false" style="height:25px;background-image:url(${proPath}/image/top.png);background-repeat: no-repeat; background-size:100%,100%;">
        <span style="float: right;">
            欢迎当前用户：${sessionScope.user.userName}&nbsp;&nbsp;&nbsp;
            <a href="${proPath}/quit.mvc">退出系统</a>&nbsp;&nbsp;&nbsp;
        </span>
    </div>
    <div data-options="region:'south',collapsible:false" style="height:40px;"></div>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
        <div class="easyui-accordion" data-options="fit:true" id="indexAccordion">
            <c:forEach items="${sessionScope.menus}" var="menu">
                <c:if test="${menu.parentId==0}">
                    <div title=${menu.menuName}>
                        <ul class="easyui-tree">
                            <c:forEach items="${sessionScope.menus}" var="menus">
                                <c:if test="${menus.parentId==menu.menuId}">
                                    <li><a onclick="addTabs('${menus.menuName}','${proPath}${menus.url}')">${menus.menuName}</a></li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div data-options="region:'center'">
        <div class="easyui-tabs" data-options="fit:true" id="indexTabs">
            <div title="欢迎使用"></div>
        </div>
    </div>
</div>
<div id="win"></div>
</body>
</html>
