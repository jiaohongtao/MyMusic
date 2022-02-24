<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>胶章音乐</title>
</head>

<body>
<%@ include file="top.jsp" %>
<table cellpadding="0" cellspacing="0" id="maintable">
    <tr>
        <td class="lefttd">
            <%@ include file="left.jsp" %>
        </td>
        <td>
            <table id="sqltable">
                <tr class="title">
                    <td>登录名</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>电话</td>
                    <td>邮箱</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="list" items="${list}">
                    <tr class="rows">
                        <td>${list.login}</td>
                        <td>${list.name}</td>
                        <td>${list.sex}</td>
                        <td>${list.tel}</td>
                        <td>${list.mail}</td>
                        <td>
                            <a href="javascript:;" id="${list.id }" class="del">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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
        </td>
        <td class="mainrightborder"></td>
    </tr>
</table>
<%@ include file="foot.jsp" %>

<script>
    $(function () {
        $(".del").click(function () {
            const id = $(this).attr("id");//以逗号作为分隔字符串
            //询问框
            layer.confirm('您确认要删除这条数据吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("${pageContext.request.contextPath}/admin/User_del.action", {'user.id': id}, function (result) {
                    location.href = '${pageContext.request.contextPath}/admin/User_get.action'
                });
            });

        });
    })
</script>
</body>
</html>
