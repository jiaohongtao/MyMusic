<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    request.setAttribute("user", request.getSession().getAttribute("user"));
%>
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
                  action="${pageContext.request.contextPath}/User_addForm.action?user.id=0">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.login" disabled="disabled" lay-verify="required"
                                   value="${user.login}" placeholder="请输入" autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.name" lay-verify="required" placeholder="请输入"
                                   value="${user.name}"
                                   autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="user.sex" value="0" title="男" checked="checked">
                        <input type="radio" name="user.sex" value="1" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.tel" lay-verify="required" value="${user.tel}"
                                   placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.address" lay-verify="required" value="${user.address}"
                                   placeholder="请输入" autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.mail" lay-verify="required" value="${user.mail}"
                                   placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </td>
        <td class="mainrightborder"></td>
    </tr>
</table>
<%@ include file="foot.jsp" %>

<script type="text/javascript">
    //Demo
    layui.use(['form', 'layer'], function () {
        var form = layui.form
            , layer = layui.layer;

    });

    $(function () {
        $("form").submit(function () {
            $.ajax({
                type: "POST",
                datatype: "json",
                url: "${pageContext.request.contextPath}/User_addForm.action?user.id=${user.id}",
                data: $("form").serialize(),
                contentType: "application/x-www-form-urlencoded",
                success: function (data) {
                    var result = eval("(" + data + ")");
                    if (result.success) {
                        layer.alert(result.mgf, function () {
                            location.href = "${pageContext.request.contextPath}/login.jsp";
                        })
                    } else {
                        layer.alert(result.mgf);
                    }
                }
            })
            return false;
        })
    })

</script>
</body>
</html>
