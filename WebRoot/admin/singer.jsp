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
                    <td>形象照</td>
                    <td>姓名</td>
                    <td>别名</td>
                    <td>出生城市</td>
                    <td>身高</td>
                    <td>体重</td>
                    <td>生日</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="list" items="${list}">
                    <tr class="rows">
                        <td><img src="${pageContext.request.contextPath}/${list.img}" style="width:80px" alt="头像"/></td>
                        <td>${list.name}</td>
                        <td>${list.abbr}</td>
                        <td>${list.city}</td>
                        <td>${list.height}</td>
                        <td>${list.weight}</td>
                        <td>${list.birthday}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/Singer_addPage.action?singer.id=${list.id}">更新</a>
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
            var id = $(this).attr("id");//以逗号作为分隔字符串
            //询问框
            layer.confirm('您确认要删除这条数据吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("${pageContext.request.contextPath}/admin/Singer_del.action", {'singer.id': id}, function (result) {
                    location.href = '${pageContext.request.contextPath}/admin/Singer_get.action'
                });
            });

        });
    })
</script>
</body>
</html>
