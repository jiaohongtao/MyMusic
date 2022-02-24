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
                  action="${pageContext.request.contextPath}/admin/Introduce_addForm.action?introduce.id=${introduce.id}">
                <table cellpadding="0" cellspacing="0" id="addtable">
                    <tr>
                        <td class="left">类型：</td>
                        <td class="right">
                            <label>
                                <input type="text" lay-verify="required" name="introduce.type"
                                       class="layui-input" value="${introduce.type}"/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">内容：</td>
                        <td class="right">
                            <label for="content"></label><textarea id="content" name="introduce.content"
                                                                   lay-verify="content"
                                                                   style="width: 98%; height: 300px">${introduce.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">&nbsp;</td>
                        <td class="right">
                            <input class="layui-btn layui-btn-normal" lay-submit
                                   lay-filter="demo1" type="submit" value="提交"/>
                        </td>
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
        var form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate,
            upload = layui.upload,
            layer = layui.layer;

        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/editupload.action', //接口url
                type: 'post' //默认post
            }
        });
        const editIndex = layedit.build('content');
        //同步编辑器，否则获取不到更新的内容
        form.verify({
            content: function (value) {
                layedit.sync(editIndex)
            }
        })
    });

</script>

</body>
</html>
