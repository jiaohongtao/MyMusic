<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%
String path_top = request.getContextPath();
String pageContext.request.contextPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_top+"/";
request.setAttribute("pageContext.request.contextPath", pageContext.request.contextPath);
request.setAttribute("menu", request.getSession().getAttribute("menu"));
request.setAttribute("right1", request.getSession().getAttribute("right1"));
request.setAttribute("right2", request.getSession().getAttribute("right2"));
request.setAttribute("introducelist", request.getSession().getAttribute("introducelist"));
%>--%>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/layui/layui.js"
        type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/css.css"
      rel="stylesheet" type="text/css"/>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
<div id="headerline"></div>
<div class="layui-fluid menu">
    <div class="main">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/Web_index.action">首页</a>
            </li>
            <c:forEach var="list" items="${menu}">
                <li>
                    <a href="${pageContext.request.contextPath}/News_get.action?news.newstypeId=${list.id }">${list.type}</a>
                </li>
            </c:forEach>
            <li>
                <a href="${pageContext.request.contextPath}/Thing_get.action">音乐商城</a>
            </li>
            <c:forEach var="list" items="${introducelist}">
                <li>
                    <a href="${pageContext.request.contextPath}/Introduce_show.action?introduce.id=${list.id }">${list.type}</a>
                </li>
            </c:forEach>

            <li>
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        onclick=location.href="reg.jsp">注册
                </button>
            </li>
            <li>
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        onclick=location.href="login.jsp">登录
                </button>
            </li>

        </ul>
    </div>
</div>


