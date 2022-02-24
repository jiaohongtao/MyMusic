<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>胶章音乐</title>

</head>

<body>
<%@ include file="top2.jsp" %>
<div class="layui-fluid formbg">
    <div class="formmain">
        <div class="formborder">

            <form class="layui-form" id="sqlform" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.login" lay-verify="required" placeholder="请输入" autocomplete="off"
                                   class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="password" name="user.pwd" lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>
<script type="text/javascript">
    //Demo
    layui.use(['form', 'layer'], function () {
        const form = layui.form
            , layer = layui.layer;
    });

    $(function () {
        $("form").submit(function () {
            $.ajax({
                type: "POST",
                datatype: "json",
                url: "${pageContext.request.contextPath}/User_Login.action",
                data: $("form").serialize(),
                contentType: "application/x-www-form-urlencoded",
                success: function (data) {
                    const result = eval("(" + data + ")");
                    if (result.success) {
                        layer.alert(result.mgf, function () {
                            location.href = "${pageContext.request.contextPath}/user/Ding_get.action?ding.state=0";
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
