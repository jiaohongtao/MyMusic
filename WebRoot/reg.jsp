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
                            <input type="text" name="user.login" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <label for="pwd"></label><input type="text" id="pwd" name="user.pwd" lay-verify="pwd"
                                                        placeholder="请输入"
                                                        autocomplete="off" class="layui-input">
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
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.name" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="user.sex" value="男" title="男" checked="">
                        <input type="radio" name="user.sex" value="女" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.tel" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.address" lay-verify="required" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <label>
                            <input type="text" name="user.mail" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </label>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
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

        //自定义验证规则
        form.verify({
            pwd: [/(.+){6,12}$/, '密码必须6到12位']
            , pwd2: function (value) {
                if ($("#pwd").val() != value)
                    return "两次输入的密码不一至";
            }
        });

    });

    $(function () {
        $("form").submit(function () {
            $.ajax({
                type: "POST",
                datatype: "json",
                url: "${pageContext.request.contextPath}/User_addForm.action?user.id=0",
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
