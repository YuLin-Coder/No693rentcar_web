<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>主页面</title>
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
th,tr,td{    border: 1px solid #ced4da;}
</style>

<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
</head>
<body>

	<div id="app" class="d-flex">
		<jsp:include page="/WEB-INF/common/line.jsp" />
		<main>
			<jsp:include page="/WEB-INF/common/head.jsp" />
			<div id="body">

				<script>
					console.log(config);
					$(function() {
						$('#version').html(config.version);
					});
				</script>
				<main>
					<div class="main pt-5 pb-5">

						<div class="jumbotron bg-white pt-1 pb-1 mb-0">
							<h1 class="display-4">汽车租赁系统</h1>
							<p class="lead">基于Eclipse+SSM+Bootstrap+Mysql构建的后台系统</p>
						</div>

						<hr class="my-4">

						<div class="user">
							<div class="row">
								<div class="col-8">

									<div class="card">
										<div class="card-body ">
											<h5>最新汽车信息</h5>
											<table class="table">

												<thead>
													<tr>
													  	<th scope="col">汽车名称</th>
												    	<th scope="col">车牌号</th>
														<th scope="col">颜色</th>
														<th scope="col">车辆状态</th>
														<th scope="col">车辆照片</th>
													</tr>
												</thead>
												<tbody>
												
												<c:forEach items="${carList}" var="data">
												   <tr>
															<td>${data.name }</td>
											<td>${data.carno }</td>
											<td>${data.color }</td>
											<td>
											
											  <c:if test="${data.status == '0' }">
											     未租出
											  </c:if>
											  
											  <c:if test="${data.status == '1' }">
											     已租出
											  </c:if>
											
											</td>
                                             <td><img src="/images/${data.photo}" id="preview_img" style="width:50px; height:50px; "></td>	
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="card">
										<div class="card-body ">
											<h5>最新用户</h5>
											<table class="table">
												<thead>
													<tr>
														<th scope="col">姓名</th>
														<th scope="col">手机号</th>
														<th scope="col">状态</th>
														<th scope="col">注册时间</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${userList}" var="data">
													<tr>
														<th>${data.realName }</th>
														<td>${data.phone }</td>
														<td>
															   <c:if test="${data.status == '1' }">
															     已认证
															   </c:if>
															      <c:if test="${data.status == '0' }">
															     未认证
															   </c:if>
															</td>
														<td>${data.times }</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>

								</div>
							</div>
						</div>

					</div>

				</main>


			</div>

		</main>
	</div>
</body>
</html>
