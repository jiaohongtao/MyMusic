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
                  action="${pageContext.request.contextPath}/admin/Singer_addForm.action?singer.id=${singer.id}">
                <table cellpadding="0" cellspacing="0" id="addtable">
                    <tr>
                        <td class="left">姓名：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="singer.name"
                                   class="layui-input" value="${singer.name}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">别名：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="singer.abbr"
                                   class="layui-input" value="${singer.abbr}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">所在城市：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="singer.city"
                                   class="layui-input" value="${singer.city}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">身高：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="singer.height"
                                   class="layui-input" value="${singer.height}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">体重：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="singer.weight"
                                   class="layui-input" value="${singer.weight}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">生日：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="singer.birthday"
                                   class="layui-input" value="${singer.birthday}"/>
                        </label></td>
                    </tr>
                    <tr>
                        <td class="left">照片：</td>
                        <td class="right">
                            <button type="button" class="layui-btn" id="test6"><i class="layui-icon"></i>上传照片</button>
                            <input type="hidden" id="img" name="singer.img" value="${singer.img}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">介绍：</td>
                        <td class="right"><label for="content"></label><textarea id="content" name="singer.content"
                                                                                 lay-verify="content"
                                                                                 style="width:98%; height:300px">${singer.content}</textarea>
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

        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/editupload.action' //接口url
                , type: 'post' //默认post
            }
        });
        var editIndex = layedit.build('content');
        //同步编辑器，否则获取不到更新的内容
        form.verify({
            content: function (value) {
                layedit.sync(editIndex);
            }
        })

        upload.render({
            elem: '#test6'
            , url: '${pageContext.request.contextPath}/upload.action'
            , accept: 'file' //音频
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
