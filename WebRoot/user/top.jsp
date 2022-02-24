<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%
String path_top = request.getContextPath();
String pageContext.request.contextPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_top+"/";
request.setAttribute("pageContext.request.contextPath", pageContext.request.contextPath);
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
        <li><a id="topExit" href="javascript:;">退出系统</a></li>
    </ul>
</div>

<script>
    layui.use(['layer', 'form'], function () {
        const layer = layui.layer,
            form = layui.form;
    });
    $(function () {
        $("#topExit").click(function () {

            $.ajax({
                type: "get",
                datatype: "post",
                url: "${pageContext.request.contextPath}/User_Exit.action",
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