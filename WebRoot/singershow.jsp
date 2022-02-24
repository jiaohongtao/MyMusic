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

                <div class="map"><b>歌手介绍</b></div>

                <div style="overflow:hidden">
                    <img src="${pageContext.request.contextPath}/${singer.img}"
                         style=" float:left; width:350px; padding:5px; border:solid 1px #CCCCCC; margin:10px" alt="照片"/>
                    <ul class="jinmes">
                        <li><h2>${singer.name }</h2>
                        <li><span style="color:#C0C0C0; margin-right:30px">别名:</span>${singer.abbr}</li>
                        <li><span style="color:#C0C0C0; margin-right:30px">出生城市:</span>${singer.city}</li>
                        <li><span style="color:#C0C0C0; margin-right:30px">身高:</span>${singer.height}</li>
                        <li><span style="color:#C0C0C0; margin-right:30px">体重:</span>${singer.weight}</li>
                        <li><span style="color:#C0C0C0; margin-right:30px">生日:</span>${singer.birthday}</li>
                    </ul>
                </div>
                <div class="content">

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>歌手介绍</legend>
                    </fieldset>
                    <div style="line-height:32px; padding:30px">
                        ${singer.content }
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
<script>
    $(function () {
        $("#buy").click(function () {
            const id =${thing.id};
            layer.confirm("您确认要加入购物车吗？", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.post("${pageContext.request.contextPath}/Buy_add.action", {
                    tid: id
                }, function (result) {
                    if (result.mgf != "成功加入购物车")
                        layer.alert(result.mgf);
                    else
                        layer.alert(result.mgf, function () {
                            location.href = '${pageContext.request.contextPath}/Buy_get.action';
                        });
                }, "json");
            }, function () {
            });
        });
    })
</script>
</body>
</html>
