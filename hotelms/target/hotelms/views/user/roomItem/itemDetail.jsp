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
	href="${pageContext.request.contextPath}/css/plugin/simpleCalendar/date_pack.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomItem/roomItem.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/smart/user/roomItem/itemDetail.css"
	rel="stylesheet" type="text/css" />
<title>物品分配页</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_modal.jsp" />

	<% String itemID = request.getParameter("itemID"); %>

	<!-- 页面内容 strat -->
	<!-- 标题 start -->
	<div class="fac-title">
		<div class="item">
			<span id="facID" style="display: none;"><%= itemID %></span> <span
				class="span">物品种类：<span class="type"></span></span> <span
				class="span">物品子类：<span class="cat"></span></span> <span
				class="span">物品品牌：<span class="com"></span></span> <span
				class="span">物品名称：<span class="name"></span></span> <span
				class="span">物品归属权：<span class="owner"></span></span> <a
				href="itemRepoOverview.jsp" class="btn btngoback">返&nbsp;回</a>
		</div>
	</div>
	<!-- 标题 end -->
	<div class="main">
		<div class="fac-sta">
			<span class="text">总量：<span class="count"></span></span> <span
				class="text">待分配：<span class="count"></span></span> <span
				class="text">已分配：<span class="count"></span></span> <span
				class="text">可用：<span class="count"></span></span> <span
				class="text">维修：<span class="count"></span></span> <span
				class="text">报废：<span class="count"></span></span> <a
				href="javascript:void(0);" onclick="showNewfacBadModal();"
				class="btn btn-bad">新报废</a> <a href="javascript:void(0);"
				onclick="showNewfacRepairModal();" class="btn btn-repair">新维修</a> <a
				href="javascript:void(0);" onclick="showNewfacBorrowModal();"
				class="btn btn-borrow">新借用</a> <a href="javascript:void(0);"
				onclick="showDistributeModal();" class="btn btn-new">新分配</a>
		</div>
		<div class="main-page">
			<div class="bill-area">
				<div class="bill-table">
					<!-- 费用 table start -->
					<table>
						<thead>
							<tr>
								<th><span>所在房间</span></th>
								<th><span>物品编号</span></th>
								<th><span>分配类型</span></th>
								<th><span>借用时间</span></th>
								<th><span>归还时间</span></th>
								<th><span>状态</span></th>
								<th><span>维修时长</span></th>
								<th><span>备注</span></th>
								<th><span>操作</span></th>
							</tr>
						</thead>
						<tbody id="facDetailTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<div id="roomItemBottom" class="bottom"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面内容 end -->
	<div class="shadow"></div>

	<!-- 转移物品弹出框 start -->
	<div id="transferMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				转移物品 <span onclick="closeTransferDiv();">×</span>
			</div>
			<div class="fac-body">

				<span class="rec-id" style="display: none;"></span>
				<div id="transfer-div" class="item">
					<span class="span">转移至房间：</span>
					<div class="item-content">
						<input type="text" value="W34-1" />
					</div>
				</div>

				<div id="ifborrow-radio" class="item">
					<span class="span">转移方式：</span>
					<div class="item-content">
						<input type="radio" name="ifborrow" checked="checked"
							onclick="checkAllocateRadio();" /> <span>&nbsp;&nbsp;分配</span>
						&nbsp;&nbsp; <input type="radio" name="ifborrow"
							onclick="checkBorrowRadio();" /> <span>&nbsp;&nbsp;借用</span>
					</div>
				</div>

				<div id="transfer-borrow-date" class="item" style="display: none;">
					<span class="span">借用时间：</span>
					<div class="item-content">
						<input type="text" class="pack_maintain" />
					</div>
				</div>

				<div id="transfer-return-date" class="item" style="display: none;">
					<span class="span">归还时间：</span>
					<div class="item-content">
						<input type="text" class="pack_maintain" />
					</div>
				</div>
			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestTransferFac(this);">确认转移</a>
			</div>
		</div>
	</div>
	<!-- 转移物品弹出框 end -->

	<!-- 回仓库弹出框 start -->
	<div id="backMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				物品放回仓库 <span onclick="closeBackDiv();">×</span>
			</div>
			<div class="fac-body">

				<span class="rec-id" style="display: none;"></span>
				<div id="repo-number" class="item">
					<span class="span">放回至仓库：</span>
					<div class="item-content">
						<input type="text" value="" />
					</div>
				</div>
			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestToWarehouse();">确认放回</a>
			</div>
		</div>
	</div>
	<!-- 回仓库物品弹出框 end -->

	<!-- 新分配物品弹出框 start -->
	<div id="newDistributeMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				新分配物品 <span onclick="closeDistributeDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="room-number" class="item">
					<span class="span">分配至房间：</span>
					<div class="item-content">
						<input type="text" value="W34-1" />
					</div>
				</div>
				<div id="tag-name" class="item">
					<span class="span">物品编号：</span>
					<div class="item-content">
						<input type="text" value="123" />
					</div>
				</div>
				<div id="fac-comment" class="item">
					<span class="span">备注：</span>
					<div class="item-content">
						<input type="text" value="无" />
					</div>
				</div>
			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewDistribute();">确认分配</a>
			</div>
		</div>
	</div>
	<!-- 新分配物品弹出框 end -->

	<!-- 新借用物品弹出框 start -->
	<div id="newBorrowMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				新借用物品 <span onclick="closeBorrowDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="room-number" class="item">
					<span class="span">分配至房间：</span>
					<div class="item-content">
						<input type="text" value="W34-1" />
					</div>
				</div>
				<div id="tag-name" class="item">
					<span class="span">物品编号：</span>
					<div class="item-content">
						<input type="text" value="123" />
					</div>
				</div>

				<div id="borrow-date" class="item">
					<span class="span">借用时间：</span>
					<div class="item-content">
						<input type="text" class="pack_maintain" />
					</div>
				</div>

				<div id="return-date" class="item">
					<span class="span">归还时间：</span>
					<div class="item-content">
						<input type="text" class="pack_maintain" />
					</div>
				</div>

				<div id="fac-comment" class="item">
					<span class="span">备注：</span>
					<div class="item-content">
						<input type="text" value="无" />
					</div>
				</div>
			</div>
			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewBorrow();">确认借用</a>
			</div>
		</div>
	</div>
	<!-- 新借用物品弹出框 end -->

	<!-- 新维修弹出框 start -->
	<div id="newRepairMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				新维修物品 <span onclick="closeRepairDiv();">×</span>
			</div>

			<div class="fac-body">
				<div id="repair-duration" class="item">
					<span class="span">维修时长：</span>
					<div class="item-content">
						<input type="text" value="3" />&nbsp;&nbsp;天
					</div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewFacRepair();">确认维修</a>
			</div>
		</div>
	</div>
	<!-- 新维修弹出框 end -->

	<!-- 新报废弹出框 start -->
	<div id="newItemTypeMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				新报废物品 <span onclick="closeFacBadDiv();">×</span>
			</div>

			<div class="fac-body">
				<div id="bad-count" class="item">
					<span class="span">报废数量：</span>
					<div class="item-content">
						<input type="text" value="1" />
					</div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewFacBad();">确认报废</a>
			</div>
		</div>
	</div>
	<!-- 新报废弹出框 end -->

	<!-- 维修弹出框 start -->
	<div id="turnRepairMenu" class="addItemDiv">
		<div class="facContent">
			<div class="title">
				维修物品 <span onclick="closeTurnRepairDiv();">×</span>
			</div>

			<div class="fac-body">

				<span class="rec-id" style="display: none;"></span>
				<div id="repair-duration" class="item">
					<span class="span">维修时长：</span>
					<div class="item-content">
						<input type="text" value="3" />&nbsp;&nbsp;天
					</div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestFacRepair();">确认维修</a>
			</div>
		</div>
	</div>
	<!-- 维修弹出框 end -->


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomItem/roomItem.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomItem/itemDetail.js"></script>
	<script>(function(){
		// 初始化时间
		var nowDate = new Date();
		$(".pack_maintain").val(formatDateForm(nowDate));
		$('.pack_maintain').date_input();

		    requestFacSta();  // 请求物品库存信息
			requestRoomItem(1);  // 请求物品在客房的分配信息
		})();
	</script>
</body>
</html>
