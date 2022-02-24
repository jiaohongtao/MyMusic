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

                <div class="map"><b>新闻资讯</b></div>

                <div style="overflow:hidden; text-align:center">
                    <h2>${news.title }</h2>
                </div>
                <div class="content">

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>祥细介绍</legend>
                    </fieldset>
                    <div style="line-height:32px; padding:30px">
                        ${news.content }
                    </div>
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
