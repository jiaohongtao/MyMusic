<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>胶章音乐</title>
</head>

<body>
<%@ include file="top.jsp" %>
<div class="main" style="margin-top:10px">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-xs8">

                <div class="map"><b>最新新闻</b></div>
                <div class="right_news">
                    <ul>
                        <c:forEach var="list" items="${list}">
                            <li>
                                <a href="${pageContext.request.contextPath}/News_show.action?news.id=${list.id}">${list.title }</a><span><fmt:formatDate
                                    value="${list.intime }" pattern="MM-dd"/></span></li>
                        </c:forEach>
                    </ul>
                </div>

                <div style="width:100%; margin-left:24px; background:white; text-align:center" id="pagediv">
                    <style>
                        #pagediv a, #pagediv a:visited {
                            color: #A51010;
                            margin: 5px;
                            font-size: 12px
                        }
                    </style>
                    ${pages }
                </div>

            </div>
            <div class="layui-col-xs4">
                <%@ include file="right.jsp" %>
                <%@ include file="right2.jsp" %>
            </div>
        </div>


    </div>
</div>
<%@ include file="foot.jsp" %>

</body>
</html>
