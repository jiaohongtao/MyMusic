<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>胶章音乐</title>
</head>
  
  <body>
  	<%@ include file="top.jsp"%>
  	<div class="main" style="margin-top:10px">
        <div class="layui-container">
             
             <div class="map"><b>音乐</b></div>
             <div class="layui-row  layui-col-space20 thinglist">
                <c:forEach var="list"  items="${thinglist}">
                <div class="layui-col-xs3">
                	<a href="${pageContext.request.contextPath}/Thing_show.action?thing.id=${list.id}">
                    <img src="${pageContext.request.contextPath}/${list.singer.img}" />
                    <b>${list.title }</b>
                    </a>
                </div>
                </c:forEach>
                
             </div>
             <div style="width:100%; margin-left:24px; background:white; text-align:center" id="pagediv">
					<style>
					#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
					</style>
			  		${pages }
		  	</div>
             
        </div>
    </div>
    <%@ include file="foot.jsp"%>
  	
  </body>
</html>
