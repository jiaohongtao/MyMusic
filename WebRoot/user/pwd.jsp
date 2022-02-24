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
                    <label class="layui-form-label">原始密码</label>
                    <div class="layui-input-block">
                        <label for="old"><input type="text" id="old" name="old" lay-verify="old"
                                                placeholder="请输入" autocomplete="off"
                                                class="layui-input"></label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <label for="pwd"><input type="text" id="pwd" name="user.pwd" lay-verify="pwd" placeholder="请输入"
                                                autocomplete="off" class="layui-input"></label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="pwd2" lay-verify="pwd2" placeholder="请输入" autocomplete="off"
                                   class="layui-input">
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
        //自定义验证规则
        form.verify({
            pwd: [/(.+){6,12}$/, '密码必须6到12位']
            , pwd2: function (value) {
                if ($("#pwd").val() != value)
                    return "两次输入的密码不一至";
            }
            , old: function (value) {
                if (value != ${user.pwd})
                    return "原始密码错误";
            }
        });
    });

    $(function () {
        $("form").submit(function () {
            $.ajax({
                type: "POST",
                datatype: "json",
                url: "${pageContext.request.contextPath}/User_pwd.action?user.id=${user.id}",
                data: $("form").serialize(),
                contentType: "application/x-www-form-urlencoded",
                success: function (data) {
                    const result = eval("(" + data + ")");
                    layer.alert(result.mgf, function () {
                        document.getElementById("sqlform").reset();
                        layui.form.render();
                        layer.closeAll();
                    })
                }
            })
            return false;
        })
    })


</script>
</body>
</html>
