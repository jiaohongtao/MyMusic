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
            <table class="layui-table" lay-skin="line">
                <thead>
                <tr>
                    <th>快照</th>
                    <th>名称</th>
                    <th>类别</th>
                    <th>歌手</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list}">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/${list.thing.singer.img}" style="width:100px" alt="照片"/>
                        </td>
                        <td>${list.thing.title }</td>
                        <td>${list.thing.thingtype.type }</td>
                        <td>${list.thing.singer.name }</td>
                        <td><a href="javascript:;" id="${list.id }" class="del">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
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
            const id = $(this).attr("id");
            layer.confirm("您确定删除吗？", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("${pageContext.request.contextPath}/Ding_del.action", {'ding.id': id}, function (result) {
                    if (result.success) {
                        location.reload();
                    } else
                        layer.alert(result.mgf);
                }, "json");

            }, function () {
            });
        });

    })
</script>
</body>
</html>
