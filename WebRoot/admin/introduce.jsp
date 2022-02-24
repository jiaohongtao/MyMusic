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
                    <td>分类</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="list" items="${list}">
                    <tr class="rows">
                        <td>${list.type}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/Introduce_addPage.action?introduce.id=${list.id}">更新</a>
                            <!-- <a href="javascript:;;" id="${list.id }" class="del">删除</a> -->
                        </td>
                    </tr>
                </c:forEach>
            </table>
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
                $.post("${pageContext.request.contextPath}/admin/Introduce_del.action", {'newstype.id': id}, function (result) {
                    location.href = '${pageContext.request.contextPath}/admin/Introduce_get.action'
                });
            });

        });
    })
</script>
</body>
</html>
