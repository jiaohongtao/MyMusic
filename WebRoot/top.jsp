<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
<div id="headerline"></div>
<div class="layui-fluid menu">
    <div class="main">
        <ul>
            <li><a href="${pageContext.request.contextPath}/Web_index.action">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/Singer_get.action">歌手</a></li>
            <c:forEach var="list" items="${thingtypemenu}">
                <li>
                    <a href="${pageContext.request.contextPath}/Thing_get.action?thing.thingtypeId=${list.id }">${list.type }</a>
                </li>
            </c:forEach>
            <c:forEach var="list" items="${menu}">
                <li>
                    <a href="${pageContext.request.contextPath}/News_get.action?news.newstypeId=${list.id }">${list.type }</a>
                </li>
            </c:forEach>
            <c:forEach var="list" items="${introducelist}">
                <li>
                    <a href="${pageContext.request.contextPath}/Introduce_show.action?introduce.id=${list.id }">${list.type }</a>
                </li>
            </c:forEach>
            <% if (request.getSession().getAttribute("user") == null) { %>
            <li>
                <button class="layui-btn layui-btn-sm layui-btn-normal" onclick="location.href='reg.jsp'">注册</button>
            </li>
            <li>
                <button class="layui-btn layui-btn-sm layui-btn-normal" onclick="location.href='login.jsp'">登录</button>
            </li>
            <%} else { %>
            <li>
                <button class="layui-btn layui-btn-sm layui-btn-normal"
                        onclick="location.href='${pageContext.request.contextPath}/user/Ding_get.action?ding.state=0'">
                    用户中心
                </button>
            </li>
            <li>
                <button class="layui-btn layui-btn-sm layui-btn-normal" id="exit">退出</button>
            </li>
            <%} %>
        </ul>
    </div>
</div>

<div class="main banner">
    <div class="layui-carousel" id="test1" lay-filter="test1">
        <div carousel-item="">
            <%--<div><img src="images/b1.jpg" /></div>--%>
            <div><img src="images/b2.jpg" alt="照片"/></div>
            <div><img src="images/b3.jpg" alt="照片"/></div>
            <div><img src="images/b4.jpg" alt="照片"/></div>
        </div>
    </div>
</div>
<div class="main search">
    <label class="layui-form-label">关键词</label>
    <div class="layui-input-block" style="width:70%">
        <label>
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入音乐名称"
                   class="layui-input">
        </label>
    </div>
    <%-- <a href="${pageContext.request.contextPath}/Thing_Get_By_Title.action?thing.title=${list.title}"> --%>
    <button id="su" class="layui-btn layui-btn-normal">搜索</button>
</div>

<script>
    $("#su").click(function () {
        window.location.href = "${pageContext.request.contextPath}/Thing_GetByTitle.action?thing.title=" + $("input[name='title']").val();
    })
</script>

<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1',
            // arrow: 'always',
            width: '1150px',
            height: '370px',
            anim: 'fade',
            autoplay: 'true',
            interval: '3000',
            arrow: 'hover'
        });
    });

    $(function () {
        $("#exit").click(function () {

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