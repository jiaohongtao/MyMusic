<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>


<div class="map"><b>热门音乐</b></div>
<div class="right_imgnews">
    <ul>
        <c:forEach var="list" items="${right2}">
            <li>
                <div class="layui-row  layui-col-space0">
                    <a href="${pageContext.request.contextPath}/Thing_show.action?thing.id=${list.id}">
                        <div class="layui-col-xs3"><img src="${pageContext.request.contextPath}/${list.singer.img}" alt="照片"/>
                        </div>
                        <div class="layui-col-xs9"><h3>${list.title }</h3><span
                                class="layui-badge  layui-bg-green">${list.thingtype.type }</span><span
                                class="layui-badge">${list.singer.name }</span></div>
                    </a>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>