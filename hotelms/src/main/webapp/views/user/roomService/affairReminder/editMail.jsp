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
	href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomService/affairReminder/public.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomService/affairReminder/writeMail.css"
	rel="stylesheet" type="text/css" />
<title>信件详情</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_modal.jsp" />

	<!-- 页面内容 start -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path nav-path0">
				<a href="../../home/homeUser.jsp" title="回到首页"><i
					class="icon-home"></i></a> <i class="icon-path"></i> <a
					href="mailboxIndex.jsp;">站内信</a> <i class="icon-path"></i> <a
					href="outboxOverview.jsp">发件箱</a> <i class="icon-path"></i> <a
					href="javascript:void(0);">详情</a>
			</div>
			<div class="body">
				<div class="body-content">
					<ul>
						<li><span>信件状态：</span><span id="receiveState"></span></li>
						<li id="dropDownList"><span>收件人：</span> <input type="text"
							id="dropDownInput" value="" rid="" readonly disabled />
							<div class="dropDownMenu">
								<ul>
								</ul>
							</div></li>
						<li><span>提醒时间：</span><input type="text"
							class="pack_maintain"></li>
						<li><span>主题：</span><input type="text" id="reminderTitle" /></li>
						<li style="margin-bottom: -15px;"><span>内容：</span></li>
						<textarea id="reminderContent" cols="155" rows="10"></textarea>
						<li style="margin-bottom: -15px; margin-top: 15px;"><span>收件人回复：</span></li>
						<textarea id="reminderReply" cols="155" rows="10" disabled></textarea>
						<li><a onclick="updateMailReminder(${param.id});"
							class="btn btn-goback goback">更新</a></li>
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
	<script
		src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomService/affairReminder/outboxMailReminder.js"></script>
	<script type="text/javascript">

		// 设置为当前时间
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();


		// 事件冒泡（隐藏下拉菜单）
		$(document).on("click",function(e){
			$(".dropDownMenu").css("display","none");

		})

		// 显示问题分类下拉菜单
		$("#dropDownInput").click(function(e){
			$(".dropDownMenu").css("display","block");

			// 阻止事件冒泡
			e.stopPropagation();
		});

		//拉取所有用户
		searchAllUsers();


		searchMailReminderDetail('${param.id}');
	</script>
</body>
</html>