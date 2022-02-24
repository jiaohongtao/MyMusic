<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%
String path_top = request.getContextPath();
String pageContext.request.contextPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_top+"/";
request.setAttribute("pageContext.request.contextPath", pageContext.request.contextPath);
if(request.getSession().getAttribute("admin")==null)
{
	out.print("<script>alert('请先登录');location.replace('"+pageContext.request.contextPath+"admin/login.jsp');</script>");
	return;
}
%>--%>

<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/admin/css/css.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>

<div id="top">
    <b>音乐网站</b>
    <ul id="topmenu">
        <li><a href="${pageContext.request.contextPath}/Web_index.action">返回首页</a></li>
        <li><a href="#" id="exit">退出系统</a></li>
    </ul>
</div>

<script>
    $(function () {
        $("#exit").click(function () {
            $.ajax({
                type: "get",
                datatype: "post",
                url: "${pageContext.request.contextPath}/Admin_Exit.action",
                success: function (data) {
                    const result = eval("(" + data + ")");
                    layer.alert(result.mgf, function () {
                        location.href = "${pageContext.request.contextPath}/Web_index.action";
                    })
                }
            })
            return false;
        })
    })
</script>