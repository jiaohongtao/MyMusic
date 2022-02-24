<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<div class="menumain">
    <div><b>音乐管理</b></div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/user/Ding_get.action?ding.type=2">试听记录</a></li>
        <li><a href="${pageContext.request.contextPath}/user/Ding_get.action?ding.type=1">下载记录</a></li>
    </ul>
</div>

<div class="menumain">
    <div><b>系统中心</b></div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/user/edit.jsp">修改资料</a></li>
        <li><a href="${pageContext.request.contextPath}/user/pwd.jsp">修改密码</a></li>
        <li><a href="javascript:;" id="leftExit">安全退出</a></li>
        <li><a href="${pageContext.request.contextPath}/Web_index.action">网站首页</a></li>
    </ul>
</div>

<script>
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer,
            form = layui.form;
    });
    $(function () {
        $("#leftExit").click(function () {

            $.ajax({
                type: "get",
                datatype: "post",
                url: "${pageContext.request.contextPath}/User_Exit.action",
                success: function (data) {
                    var result = eval("(" + data + ")");
                    layer.alert(result.mgf, function () {
                        location.href = "${pageContext.request.contextPath}/Web_index.action";
                    })
                }
            })
            return false;
        })
    })
</script>