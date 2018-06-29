<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/home/public.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomService/roomService.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomService/service/serviceNew.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/office/shopManage.css"
	rel="stylesheet" type="text/css" />
<title>新增商品</title>
</head>
<body>
	<jsp:include page="../_header.jsp"></jsp:include>
	<jsp:include page="../_modal.jsp" />

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="body">
				<div class="body-content">
					<ul id='addGoodUL'>
						<li><span class="span"></span> <a href="shopManage.jsp"
							class="btn btn-goback firstGoback">返&nbsp;回</a></li>
						<li><span class="span">商品名：</span> <input id="goodsName"
							type="text" value="汇源果汁" /> <span class="red red-right">*&nbsp;必填</span></li>
						<li id="goodsNameWarning"><span class="span"></span><span
							class="red">不能为空！</span></li>
						<li><span class="span">种类：</span><input type="text"
							value="饮料"></li>
						<li><span class="span">子类：</span><input type="text"
							value="果汁"></li>
						<li><span class="span">进价：</span><input type="text"
							value="10" /></li>
						<li><span class="span">售价：</span><input type="text"
							value="12" /></li>
						<li><span class="span">总量：</span><input type="text"
							value="50" /></li>
						<li><span class="span"></span><a onclick="addGood();"
							class="btn btn-goback goback">确认添加</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	<div class="shadow"></div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/office/shopNew.js"></script>
</body>
</html>