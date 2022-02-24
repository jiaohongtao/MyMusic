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

            <form class="layui-form" id="sqlform" method="post"
                  action="${pageContext.request.contextPath}/admin/Thing_addForm.action?thing.id=${thing.id}">
                <table cellpadding="0" cellspacing="0" id="addtable">
                    <tr>
                        <td class="left">音乐名称：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="thing.title"
                                   class="layui-input" value="${thing.title}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">歌手：</td>
                        <td class="right">
                            <label>
                                <select name="thing.singerId">
                                    <c:forEach var="list" items="${singer}">
                                        <option value="${list.id }">${list.name }</option>
                                    </c:forEach>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">类别：</td>
                        <td class="right">
                            <label>
                                <select name="thing.thingtypeId">
                                    <c:forEach var="list" items="${thingtype}">
                                        <option value="${list.id }">${list.type }</option>
                                    </c:forEach>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">音乐文件：</td>
                        <td class="right">
                            <button type="button" class="layui-btn" id="test6"><i class="layui-icon"></i>上传音乐</button>
                            <input type="hidden" id="img" name="thing.img" value="${thing.img}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">歌词：</td>
                        <td class="right"><label for="content"></label><textarea id="content" name="thing.content"
                                                                                 lay-verify="content"
                                                                                 style="width:98%; height:300px">${thing.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">&nbsp;</td>
                        <td class="right"><input class="layui-btn layui-btn-normal" lay-submit lay-filter="demo1"
                                                 type="submit" value="提交"/></td>
                    </tr>
                </table>
            </form>
        </td>
        <td class="mainrightborder"></td>
    </tr>
</table>
<%@ include file="foot.jsp" %>
<script type="text/javascript">
    //Demo
    layui.use(['form', 'layedit', 'laydate', 'layer', 'upload'], function () {
        var form = layui.form
            , layedit = layui.layedit
            , laydate = layui.laydate
            , upload = layui.upload
            , layer = layui.layer;


        upload.render({
            elem: '#test6'
            , url: '${pageContext.request.contextPath}/upload.action'
            , accept: 'audio' //音频
            , size: 102400//上传附件大小
            , field: 'image'
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                $("#img").val(res.data.src);
                return layer.msg('上传成功');
            }
        });
    });

</script>

</body>
</html>
