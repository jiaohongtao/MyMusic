<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<div class="map"><b>最新新闻</b></div>
<div class="right_news">
    <ul>
        <c:forEach var="list" items="${right1}">
            <li><a href="${pageContext.request.contextPath}/News_show.action?news.id=${list.id}">${list.title }</a></li>
        </c:forEach>
    </ul>
</div>
