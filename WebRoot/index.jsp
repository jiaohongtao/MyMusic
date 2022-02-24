<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>胶章音乐</title>
</head>

<body>
<%@ include file="top.jsp" %>
<div class="main" style="margin-top: 10px">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-xs7">
                <img src="images/banner.png" id="bannerimg"/>
            </div>
            <div class="layui-col-xs5">
                <%@ include file="right.jsp" %>
            </div>
        </div>

        <div class="map">
            <b>歌手推荐</b>
        </div>
        <div class="layui-row  layui-col-space20 thinglist">
            <c:forEach var="list" items="${singerlist}">
                <div class="layui-col-xs3">
                    <a href="${pageContext.request.contextPath}/Singer_show.action?singer.id=${list.id}">
                        <img src="${pageContext.request.contextPath}/${list.img}" alt="照片"/> <b>${list.name }</b>
                    </a>
                </div>
            </c:forEach>

        </div>

    </div>
</div>

<%@ include file="foot.jsp" %>

</body>
</html>
