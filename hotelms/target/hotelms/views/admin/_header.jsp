<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.smart.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 一级导航栏 start-->
<header class="navbar navbar-fixed-top navbar-ld">
	<div class="container-fluid">
		<div class="header-content">
			<div class="header-logo">
				<img src="${pageContext.request.contextPath}/img/logo.png">
			</div>
			<div class="navbar-collapse">
				欢迎您，${curUser.USERNAME}
				<div class="logoutDiv">
					<a title="退出" class="logoutImg"
						href="${pageContext.request.contextPath}/logout.action"></a>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- 一级导航栏 end-->

