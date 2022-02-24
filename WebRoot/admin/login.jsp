<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--<%
String path_top = request.getContextPath();
String pageContext.request.contextPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_top+"/";
request.setAttribute("pageContext.request.contextPath", pageContext.request.contextPath);
%>--%>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/admin/css/login.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
    <title>My JSP 'login.jsp' starting page</title>
</head>

<body>
<form class="layui-form" id="sqlform" method="post">
    <div id="loginborder">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td><label>
                    <input type="text" name="admin.login" class="val"/>
                </label></td>
            </tr>
            <tr>
                <td><label>
                    <input type="password" name="admin.pwd" class="val"/>
                </label></td>
            </tr>
        </table>
        <input id="Button1" type="submit" lay-submit lay-filter="demo1" value="登录" class="btn"/>
    </div>
</form>
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
                url: "${pageContext.request.contextPath}/Admin_login.action",
                data: $("form").serialize(),
                contentType: "application/x-www-form-urlencoded",
                success: function (data) {
                    var result = eval("(" + data + ")");
                    if (result.success) {
                        layer.alert(result.mgf, function () {
                            location.href = "${pageContext.request.contextPath}/admin/Thing_get.action";
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
