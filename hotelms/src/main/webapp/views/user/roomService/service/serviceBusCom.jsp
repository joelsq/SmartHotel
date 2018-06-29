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
	href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/plugin/calendar/dateCustom.css"
	rel="stylesheet" type="text/css" />
<%--<link href="${pageContext.request.contextPath}/css/smart/user/roomService/roomService.css" rel="stylesheet" type="text/css"/>--%>
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomService/service/serviceBusCom.css"
	rel="stylesheet" type="text/css" />
<title>通勤车</title>
</head>
<body>
	<jsp:include page="../../_header.jsp"></jsp:include>
	<jsp:include page="../../_modal.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../home/homeUser.jsp" title="回到首页"><i
					class="icon-home"></i></a>
				<%--<i class="icon-path"></i> --%>
				<%--<a href="serviceIndex.jsp">客房服务</a>--%>
				<i class="icon-path"></i> <a href="serviceBus.jsp">车费</a> <i
					class="icon-path"></i> <a href="serviceBusCom.jsp">通勤车</a>
			</div>
			<a class="btn btn-new btnnew" href="serviceNewBusCom.jsp">新增通勤车车费记录</a>
			<div class="bill-area">
				<div class="search">
					<span>房间号：</span><input id="searchRoomNum" type="text" value="">
					<div class="calendarPart">
						<span class="span">日期：</span>
						<div class="tool_date cf">
							<div class="ta_date" id="div_month_picker">
								<span class="date_title" id="month_picker"></span>
							</div>
						</div>

						<span style="color: red; padding-left: 10px;">总计：</span><span
							id="total">0</span><span style="color: red; padding-left: 10px;">元</span>
						<a class="btn btn-edit btnEdit" onclick="searchFareByDate(1);">搜索</a>
						<a class="btn btn-edit btnEdit " onclick="exportList();">导出</a> <a
							class="btn btn-edit btnEdit" style="margin-left: 0em;"
							onclick="printList();">打印</a>
					</div>
				</div>



				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th style="font-weight: bold;">房间号</th>
								<th style="font-weight: bold;">客户姓名</th>
								<th style="font-weight: bold;">通勤天数</th>
								<th style="font-weight: bold;">合计费用</th>
								<th style="font-weight: bold;">通勤年月</th>
								<th style="font-weight: bold;">其他人员</th>
								<th style="font-weight: bold;">上传时间</th>
								<th style="font-weight: bold;">最后编辑时间</th>
								<th style="font-weight: bold;">操作</th>
							</tr>
						</thead>
						<tbody id="busTable"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceBusBottom" class="bottom"></div>
					<!-- 底部页码 end -->
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
		src="${pageContext.request.contextPath}/js/plugin/calendar/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>

	<!-- 导出插件 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomService/roomService.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomService/service/serviceBusCom.js"></script>
	<script type="text/javascript">

	    // 拉取第一页 本月车费信息
	    monthPicker.create('month_picker', {
			autoCommit : true,
			callback : function(obj){
				//console.log(obj);
			}
	  	});
	  	var nowDate = new Date();
	  	var date = formatYearMonth(nowDate);
	  	console.log(date);
	  	searchFareByDate(1, date);
	</script>
</body>
</html>