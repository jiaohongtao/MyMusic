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
                  action="${pageContext.request.contextPath}/admin/ThingType_addForm.action?thingtype.id=${thingtype.id}">
                <table cellpadding="0" cellspacing="0" id="addtable">
                    <tr>
                        <td class="left">类型名称：</td>
                        <td class="right"><label>
                            <input type="text" lay-verify="required" name="thingtype.type"
                                                     class="layui-input" value="${thingtype.type}"/>
                        </label></td>
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
    layui.use(['form', 'layedit', 'laydate', 'layer'], function () {
        var form = layui.form
            , layedit = layui.layedit
            , laydate = layui.laydate
            , layer = layui.layer;
    });

</script>

</body>
</html>
