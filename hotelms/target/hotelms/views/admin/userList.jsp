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
<link href="${pageContext.request.contextPath}/css/smart/admin/public.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/smart/admin/user.css"
	rel="stylesheet" type="text/css" />
<title>用户列表</title>
</head>
<body>
	<jsp:include page="_header.jsp" />
	<jsp:include page="_leftMenu.jsp" />

	<!-- 右侧菜单 start  -->
	<div class="nav-second">
		<div class="toolbar">
			<div class="nav-secondul">
				<ul>
					<li class="liactive"><a href="javascript:void(0);">用户列表</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 右侧菜单 start  -->

	<!-- 页面内容 start-->
	<div class="body-content">
		<div class="content">
			<section class="activities"> <!-- 新建用户 start-->
			<div class="new">
				<a class="btn btn-edit" onclick="exportUserList();">导出</a> <a
					class="btn btn-edit" onclick="printUserList();">打印</a> <a
					href="${pageContext.request.contextPath}/views/admin/newUser.jsp"
					class="btn btn-new">新建用户</a>
			</div>
			<!-- 新建用户  end--> <!-- 用户table start-->
			<div class="nav-block">
				<table id="users_table" class="table"></table>
			</div>
			<!-- 用户table end--> <!-- 用户页码 start-->
			<div id="userBottom" class="bottom"></div>
			<!-- 用户页码 end --> </section>
		</div>
	</div>
	<!-- 页面内容 end-->


	<div class="shadow"></div>
	<!-- 更改角色对话框 -->
	<div id="changeRoleMenu" class="addItemDiv">
		<div class="facContent">
			<div class="fac-title">
				更改角色 <span onclick="closeChangeRoleDiv();">×</span>
			</div>
			<div class="fac-body">
				<div id="room-number" class="item">
					<div id="AdminRole" onclick="requestAjaxRole();"
						class="form-control" style="width: 300px; display: inline-block;">
						<span class="caret" style="float: right; margin-top: 10px;"></span>
					</div>
					<div id="AdminRoleMenu" class="dropdownMenu"></div>
				</div>
			</div>
			<div class="fac-foot">
				<span id="currentDate" style="display: none"></span> <span
					id="userId" style="display: none"></span> <a class="btn btn-submit"
					id="finishBtn" onclick="requestChangeRole();">确认更改</a>
			</div>
		</div>
	</div>




	<!-- 重置密码弹出框 start -->
	<div class="dialog-resetPasswd-success">
		<div class="dialog-main">
			<div class="dialog-title">
				<a onclick="hideDialogPasswdSuccess();" class="close"><i>×</i></a>
			</div>
			<div class="dialog-body">
				<!-- <h4><span>&radic;</span>&nbsp;&nbsp;重置密码成功！</h4> -->
				<div class="logo-success"></div>
				<h4></h4>
			</div>
		</div>
	</div>
	<!-- 重置密码弹出框 end -->

	<!-- 删除用户弹出框 start -->
	<div class="dialog-deleteUser-success">
		<div class="dialog-main">
			<div class="dialog-title">
				<a onclick="hideDialogDeleteSuccess();" class="close"><i>×</i></a>
			</div>
			<div class="dialog-body">
				<!-- <h4><span>&radic;</span>&nbsp;&nbsp;重置密码成功！</h4> -->
				<div class="logo-success"></div>
				<h4></h4>
			</div>
		</div>
	</div>
	<!-- 删除用户弹出框 end -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/admin/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/smart/admin/user.js"></script>

	<script type="text/javascript">
       // 请求 角色 ID-名称 对应关系（拉取第一页用户编号）
       $(function(){
    	  requestAjaxRoleArraySave();
    	  changeLeftMenu(1);
       });
    </script>
</body>
</html>
