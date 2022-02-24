<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>胶章音乐</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/js/layui/css/layui.css"
          media="all">
</head>

<body>
<%@ include file="top.jsp" %>
<div class="main" style="margin-top:10px">
    <div class="layui-container">

        <div class="layui-row">
            <div class="layui-col-xs8">

                <div class="map">
                    <b>音乐收听</b>
                </div>

                <div style="overflow:hidden" id="ting">
                    <img src="${pageContext.request.contextPath}/${thing.singer.img}"
                         style=" float:left; width:350px; padding:5px; border:solid 1px #CCCCCC; margin:10px" alt="照片"/>
                    <ul class="jinmes">
                        <li><h2>${thing.title }</h2>
                        <li><span
                                style="color:red; font-size:30px; font-weight:bold">歌手：${thing.singer.name
                                }</span></li>
                        <li><span style="color:C0C0C0; margin-right:30px">类别:</span>${thing.thingtype.type}</li>
                        <li>
                            <button class="layui-btn layui-btn-normal" id="down">音乐下载</button>
                        </li>
                    </ul>
                </div>
                <div class="content">

                    <fieldset class="layui-elem-field layui-field-title"
                              style="margin-top: 30px;">
                        <legend>音乐区域</legend>
                    </fieldset>
                    <div style="line-height:32px; padding:30px">
                        <blockquote class="layui-elem-quote">
                            <div id="player3" class="aplayer">
									<pre class="aplayer-lrc-content">
                                        ${thing.content}
                                    </pre>
                            </div>
                            <div class="layui-progress layui-progress-big"
                                 lay-showpercent="true" lay-filter="demo">
                                <div class="layui-progress-bar layui-bg-red" lay-percent="25%"></div>
                            </div>
                            <div class="layui-progress layui-progress-big" lay-filter="demo"
                                 lay-showPercent="true">
                                <div class="layui-progress-bar" lay-percent="36%"></div>
                            </div>
                            <script
                                    src="${pageContext.request.contextPath}/js/music/APlayer.min.js"></script>
                            <link rel="stylesheet"
                                  href="${pageContext.request.contextPath}/js/music/APlayer.min.css"/>
                            <script>
                                var ap3 = new APlayer({
                                    element: document.getElementById('player3'),
                                    narrow: false,
                                    autoplay: false,
                                    showlrc: true,
                                    music: {
                                        title: '${thing.title}',
                                        author: '歌手：${thing.singer.name}',
                                        url: '${pageContext.request.contextPath}/${thing.img}',
                                        pic: '${pageContext.request.contextPath}/${thing.singer.img}'
                                    }
                                });
                                ap3.init();
                            </script>
                        </blockquote>
                    </div>
                </div>


                <div>
                    <label for="comment"></label><textarea id="comment" cols="80" rows="8">${thing.id}</textarea>
                </div>
                <div>
                    <input id="addComment" type="button" value="评论" onclick="addComment();"/>
                </div>
            </div>
            <div class="layui-col-xs4">
                <%@ include file="right.jsp" %>
                <%@ include file="right2.jsp" %>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">

    function addComment() {
        debugger;
        const id = ${thing.id};
        const content = $("#addComment").val();
        // $("#addComment").click(function() {
        $.post("${pageContext.request.contextPath}/Comment_add.action", {
            "comment.thindId": id,
            "comment.content": content
        }, function (data) {
            // alert("ok");
            if (data.success) {
                alert("评论成功");
            } else {
                alert("评论失败！");
            }
        });
    }


    $(function () {

        $("#addComment").click(function () {
            const id = "${thing.id}";
            const content = $("#comment").val();
            debugger;
            $.post("${pageContext.request.contextPath}/Comment_add.action", {
                "comment.thindId": id,
                "comment.content": content
            }, function (data) {
                // alert("ok");
                if (data.success) {
                    // layer.alert(data.mgf);
                    layer.alert("评论成功");
                    // location.href='${pageContext.request.contextPath}/${thing.img}';
                } else {
                    layer.alert("评论失败");
                }
            }, "json");
        });
    });
</script>
<%@ include file="foot.jsp" %>
<script>
    $(function () {


        const id = "${thing.id}";
        $("#down").click(function () {
            $.post("${pageContext.request.contextPath}/Ding_add.action", {
                "ding.thingId": id,
                "ding.type": 1
            }, function (data) {
                if (data.success) {
                    location.href = '${pageContext.request.contextPath}/${thing.img}';
                } else {
                    layer.alert(data.mgf);
                }
            }, "json");

        });

        $(".aplayer-icon-play").click(function () {
            $.post("${pageContext.request.contextPath}/Ding_add.action", {
                "ding.thingId": id,
                "ding.type": 2
            }, function (data) {
                if (!data.success) {
                    layer.alert(data.mgf);
                }
            }, "json");

        });
    })
</script>
</body>
</html>
