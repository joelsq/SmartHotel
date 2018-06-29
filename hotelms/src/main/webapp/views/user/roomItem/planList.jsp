<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.smart.model.User"%>
<%@ page import="java.util.Date, java.text.*"%>
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
	href="${pageContext.request.contextPath}/css/smart/user/roomItem/roomItem.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomItem/planList.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomService/roomService.css"
	rel="stylesheet" type="text/css" />

<title>物品申请</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />

	<%--<div class="nav-second">--%>
	<%--<div class="toolbar">--%>
	<%--<div class="nav-secondul">--%>
	<%--<ul>--%>
	<%--<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemRoomOverview.jsp">客房物品统计</a></li>--%>
	<%--<li class="linormal"><a	href="${pageContext.request.contextPath}/views/user/roomItem/itemRepoOverview.jsp">库房物品统计</a></li>--%>
	<%--<li class="liactive"><a	href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>--%>
	<%--</ul>--%>
	<%--</div>--%>
	<%--</div>--%>
	<%--</div>--%>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">

			<div class="nav-path">
				<a href="../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i> <a href="planList.jsp">物品申请</a>
			</div>


			<div class="nav-path" style="margin-top: -20px;">
				<span class="span">采购计划编号：</span> <input type="text" value=""
					id="plan_id" /> <a class="btn btn-edit btnEdit"
					style="margin-left: 10px;" onclick="requestItemByItemType();">搜索</a>
			</div>
			<a class="btn btn-new btnnew" href="planNew.jsp">新增采购计划</a>
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>计划编号</span></th>
								<th><span>计划名称</span></th>
								<th><span>计划负责人</span></th>
								<th><span>计划创建时间</span></th>
								<th><span>计划总价</span></th>
								<th><span>备注</span></th>
								<th><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="planListTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="planListBottom" class="bottom"></div>
					<!-- 底部页码 end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomItem/roomItem.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomItem/planList.js"></script>
	<script>
	    // 请求第一页客房物品信息
		requestPlanList(1);
	</script>
</body>
</html>
