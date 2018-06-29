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
	href="${pageContext.request.contextPath}/css/smart/user/roomItem/planNew.css"
	rel="stylesheet" type="text/css" />
<title>新增采购计划</title>
</head>
<body>

	<jsp:include page="../_header.jsp" />
	<jsp:include page="../_modal.jsp" />

	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="linormal"><a
						href="${pageContext.request.contextPath}/views/user/roomItem/itemRoomOverview.jsp">物品统计</a></li>
					<li class="liactive"><a
						href="${pageContext.request.contextPath}/views/user/roomItem/planList.jsp">采购管理</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="planTitle">
				<h4>新增采购计划</h4>
				<a class="btn btn-goback goback" href="planList.jsp">返&nbsp;&nbsp;&nbsp;回</a>
				<ul class="ul">
					<li class="li"><span class="span">计划名称：</span> <input
						type="text" value="采购冰箱" /></li>
					<li class="li"><span class="span">计划负责人：</span> <input
						type="text" value="Alice" /></li>
					<li class="li"><span class="span">备注：</span> <input
						class="note" type="text" value="无" /></li>
				</ul>
			</div>
			<div class="planContent">
				<div class="itemList">
					<h3>计划采购物品：</h3>
					<table>
						<thead>
							<tr>
								<th>序号</th>
								<th>种类</th>
								<th>子类</th>
								<th>品牌</th>
								<th>名称</th>
								<th>归属权</th>
								<th>供应商</th>
								<th>所在库房</th>
								<th>数量</th>
								<th>单价</th>
								<th>总价</th>
								<th>开票信息</th>
								<th>是否收到</th>
								<th>下单日期</th>
								<th>到货日期</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="addItem">
								<td colspan="17">+ 添加物品</td>
							</tr>
						</tbody>
					</table>
				</div>
				<a class="btn btn-goback submit" onclick="addPlan();">确认添加采购计划</a>
			</div>
		</div>
	</div>

	<!-- 添加采购计划物品弹出框 start -->
	<div class="shadow"></div>
	<div id="addItemModal" class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				<span>添加采购计划中物品</span> <span class="cross">×</span>
			</div>
			<div class="fac-body">
				<div id="item-type" class="item">
					<span class="span">物品种类：</span>
					<div class="item-content" style="margin-bottom: 5px;"></div>
					<div class="item-content1">
						<a style="color: #2277da; cursor: pointer;"
							onclick="showNewItemTypeModal();">新增种类</a>
					</div>
				</div>
				<div id="item-cat" class="item" style="margin-top: 10px;">
					<span class="span">物品子类：</span>
					<div class="item-content" style="margin-bottom: 5px;"></div>
					<div class="item-content1">
						<a style="color: #2277da; cursor: pointer;"
							onclick="showNewItemSubTypeModal();">新增子类</a>
					</div>
				</div>
				<div id="item-com" class="item" style="margin-top: 10px;">
					<span class="span">物品品牌：</span>
					<div class="item-content" style="margin-bottom: 5px;"></div>
					<div class="item-content1">
						<a style="color: #2277da; cursor: pointer;"
							onclick="showNewItemBrandModal();">新增品牌</a>
					</div>
				</div>
				<div id="item-name" class="item" style="margin-top: 10px;">
					<span class="span">物品名称：</span>
					<div class="item-content">
						<input type="text" value="GT双开门冰箱" />
					</div>
				</div>

				<div id="item-count" class="item">
					<span class="span">数量：</span>
					<div class="item-content">
						<input type="text" value="10"
							oninput="calTotalPriceByCount(this.value);" />
					</div>
				</div>

				<div id="item-unitPrice" class="item">
					<span class="span">单价：</span>
					<div class="item-content">
						<input type="text" value="10"
							oninput="calTotalPriceByUnitPrice(this.value);" />
					</div>
				</div>

				<div id="item-totalPrice" class="item">
					<span class="span">总价：</span>
					<div class="item-content">
						<input type="text" value="100" disabled="disabled" />
					</div>
				</div>

				<div id="item-repoNum" class="item">
					<span class="span">库房号：</span>
					<div class="item-content">
						<input type="text" value="R3-2" />
					</div>
				</div>

				<div id="item-provider" class="item">
					<span class="span">供应商：</span>
					<div class="item-content">
						<input type="text" value="国美电器" />
					</div>
				</div>

				<div id="item-ownerType" class="item">
					<span class="span">归属权：</span>
					<div class="item-content">
						<a class="btn btn-item" onclick="changeOwner(this);">LE固定资产</a> <a
							class="btn btn-item" onclick="changeOwner(this);">LE管理资产</a>
					</div>
				</div>

				<div id="item-ownerManage" class="item">
					<span class="span"></span>
					<div class="item-content">
						<a class="btn btn-item item-active"
							onclick="changeSelection(this);">SPC</a> <a class="btn btn-item"
							onclick="changeSelection(this);">小业主</a>
					</div>
				</div>

				<div id="item-invoiceInfo" class="item">
					<span class="span">开票信息：</span>
					<div class="item-content">
						<a class="btn btn-item" onclick="changeInvoiceInfo(this);">含普票</a>
						<a class="btn btn-item" onclick="changeInvoiceInfo(this);">含增票</a>
						<a class="btn btn-item" onclick="changeInvoiceInfo(this);">不含票</a>
					</div>
				</div>

				<div id="item-ifReceived" class="item">
					<span class="span">是否收到：</span>
					<div class="item-content">
						<a class="btn btn-item item-active"
							onclick="changeSelection(this);">是</a> <a class="btn btn-item"
							onclick="changeSelection(this);">否</a>
					</div>
				</div>

				<div id="item-orderDate" class="item">
					<span class="span">下单日期：</span>
					<div class="item-content">
						<input type="text" class="pack_maintain" />
					</div>
				</div>

				<div id="item-arrivalDate" class="item">
					<span class="span">到货日期：</span>
					<div class="item-content">
						<input type="text" class="pack_maintain" />
					</div>
				</div>

				<div id="item-comment" class="item">
					<span class="span">备注：</span>
					<div class="item-content">
						<input type="text" value="无" />
					</div>
				</div>
			</div>
			<div class="fac-foot">
				<a id="addItemBtn" class="btn btn-submit" onclick="addOneItem();">确定</a>
			</div>
		</div>
	</div>
	<!-- 添加采购计划物品弹出框 end -->

	<!-- 新增物品种类弹出框 start -->
	<div id="newItemTypeMenu" class="addItemDiv"
		style="width: 300px; height: 300px; left: 40%; top: 200px;">
		<div class="facContent">
			<div class="fac-title">
				<span>新增物品种类</span> <span class="cross"
					onclick="closeNewItemTypeDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="item-type-name" class="item">
					<span class="span">名称</span>
					<div class="item-content">
						<input type="text" value="" />
					</div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewItemType();">确定新增</a>
			</div>
		</div>
	</div>

	<!-- 新增物品种类弹出框 start -->
	<div id="newItemSubTypeMenu" class="addItemDiv"
		style="width: 300px; height: 300px; left: 40%; top: 200px;">
		<div class="facContent">
			<div class="fac-title">
				<span>新增物品子类</span> <span class="cross"
					onclick="closeNewItemSubTypeDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="item-subtype-name" class="item">
					<span class="span">名称</span>
					<div class="item-content">
						<input type="text" value="" />
					</div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewItemSubType();">确定新增</a>
			</div>
		</div>
	</div>

	<!-- 新增物品种类弹出框 start -->
	<div id="newItemBrandMenu" class="addItemDiv"
		style="width: 300px; height: 300px; left: 40%; top: 200px;">
		<div class="facContent">
			<div class="fac-title">
				<span>新增物品品牌</span> <span class="cross"
					onclick="closeNewItemBrandDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="item-brand-name" class="item">
					<span class="span">名称</span>
					<div class="item-content">
						<input type="text" value="" />
					</div>
				</div>
			</div>

			<div class="fac-foot">
				<a class="btn btn-submit" onclick="requestNewItemBrand();">确定新增</a>
			</div>
		</div>
	</div>



	<%--<div id="newItemTypeMenu" class="addItemDiv">--%>
	<%--<div class="facContent">--%>
	<%--<div class="title">--%>
	<%--新增物品种类--%>
	<%--<span onclick="closeNewItemTypeDiv();">×</span>--%>
	<%--</div>--%>

	<%--<div class="fac-body">--%>
	<%--<div id="type-name" class="item">--%>
	<%--<span class="span">名称：</span>--%>
	<%--<div class="item-content"><input type="text" value="XXX" /></div>--%>
	<%--</div>--%>
	<%--</div>--%>

	<%--<div class="fac-foot">--%>
	<%--<a class="btn btn-submit" onclick="requestNewItemType();">确认新增</a>--%>
	<%--</div>--%>
	<%--</div>--%>
	<%--</div>--%>
	<!-- 新增物品种类弹出框 end -->



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/plugin/simpleCalendar/date_pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/home/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomItem/roomItem.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/user/roomItem/planNew.js"></script>

	<script type="text/javascript">
			// 初始化时间
			var nowDate = new Date();
			$(".pack_maintain").val(formatDateForm(nowDate));
			$('.pack_maintain').date_input();

		</script>
</body>
</html>
