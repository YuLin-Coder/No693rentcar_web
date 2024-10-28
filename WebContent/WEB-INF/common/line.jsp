<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>汽车租赁系统</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台管理系统HTML模板">
<meta name="description" content="基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="<%=path%>/resource/boot/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/html.css">
<script src="<%=path%>/resource/static/js/vue.min.js"></script>
<script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
<script src="<%=path%>/resource/static/admin/js/config.js"></script>
<script src="<%=path%>/resource/static/admin/js/script.js"></script>
<script type="text/javascript"
	src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
<style>
.main {
	overflow-y: auto;
}

.info .card {
	min-height: 330px;
}

.user .card {
	min-height: 500px;
}

.card h5 {
	margin-bottom: 20px;
}

.main ul li {
	margin-bottom: 3px;
}
</style>
<!-- <style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style> -->
</head>
<nav>
	<div class="logo">
		<h4>汽车租赁系统</h4>
	</div>
	<ul class="menu">
		<li><a href="toMain"><i class="iconfont mr-1">&#xe6a2;</i>首页</a></li>
		<c:if test="${admin !=null }">
		
		   <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>用户管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="userList">用户列表</a></li>
				<li><a href="toAddUser">添加用户</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>工作人员管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="EmployeeList">工作人员列表</a></li>
				<li><a href="toAddEmployee">去新增工作人员</a></li>
			</ul></li>
		
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>汽车类型管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="CategoryList">汽车类型列表</a></li>
				<li><a href="toAddCategory">去新增汽车类型</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>汽车品牌管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="BrandList">汽车品牌列表</a></li>
				<li><a href="toAddBrand">去新增汽车品牌</a></li>
			</ul></li>
			
				
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>用车需求管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="YcxqList">用车需求列表</a></li>
			</ul></li>
			
					
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>实名认证管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SmrzList">实名认证列表</a></li>
			</ul></li>
			
			
				
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>预约管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AppointmentList">预约信息列表</a></li>
			</ul></li>
			
					
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>汽车租赁管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="OrdersList">汽车租赁信息列表</a></li>
			</ul></li>
			
			
					
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>合同管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="HtList">合同信息列表</a></li>
			</ul></li>

					
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6d4;</i>系统设置<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toUpdateAdminPassword">修改密码</a></li>
			</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>数据统计<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="toEcharts">数据统计</a></li>
				</ul></li>
		
		</c:if>
		
		<c:if test="${employee !=null }">
		
		    <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>工作人员管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="EmployeeList">我的信息</a></li>
			</ul></li>
			
			

			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>汽车管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="CarList">汽车信息列表</a></li>
				
				<li><a href="toAddCar">去新增汽车信息</a></li>
			</ul></li>
			
			
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>预约管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AppointmentList">预约信息列表</a></li>
			</ul></li>
			
					
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>汽车租赁管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="OrdersList">汽车租赁信息列表</a></li>
			</ul></li>
			
			
					
			<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>合同管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="HtList">合同信息列表</a></li>
			</ul></li>
			
		</c:if>
		
		
		
		<li><a href="toLoginOutAct"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a>
		</li> 
	</ul>
</nav>