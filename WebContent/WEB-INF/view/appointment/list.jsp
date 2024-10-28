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
	content="width=device-width, Category-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>车辆预约列表</title>
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
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
<style>
th,tr,td{    border: 1px solid #ced4da;}
</style>
</head>
<body>

	<div id="app" class="d-flex">
		<jsp:include page="/WEB-INF/common/line.jsp" />
		<main>
			<jsp:include page="/WEB-INF/common/head.jsp" />
			<div id="body">
				<main>
					<div class="main">
						<div class="search">
							<form class="form-inline float-left" action="AppointmentList"
								method="post">
								<div class="form-group">
									<input type="text" name="key" value="${key}"
										class="form-control" placeholder="预约日期">
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="iconfont"></i>搜索
								</button>
							</form>
						</div>

						<div class="table-box">


							<table class="table">
								<thead>
									<tr>
								    	<th scope="col">预约人</th>
										  <td scope="col">预约车辆</td>
					                      <td scope="col">预约日期</td>
					                      <td scope="col">详细时间</td>
					                      <td scope="col">预约状态</td>
										<th scope="col">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="data">
										<tr>
											<td>${data.user.realName }</td>
											<td>${data.car.name }</td>
												<td>${data.create_date }</td>
												<td>${data.times }</td>
												<td>
												  <c:if test="${data.status == '0' }">
												     待审核
												  </c:if>
												  <c:if test="${data.status == '1' }">
												     审核成功
												  </c:if>
												    <c:if test="${data.status == '2' }">
												     审核失败
												  </c:if>
												</td>
                                   <td><input id="${data.id}" value="${data.id}"
												type="hidden" class="weui-input" />
												 <c:if test="${data.status == '0'  && admin == null }">
												  <a class="btn btn-primary btn-sm" type="button" onclick="updateAppStatus(${data.id},1)">通过</a>
												 <a class="btn btn-warning btn-sm" type="button" onclick="updateAppStatus(${data.id},2)">拒绝</a>
												    
												  </c:if>
										<%-- 		 <a class="btn btn-primary btn-sm"
												href="toUpdateCategory?id=${data.id }">修改</a> --%>
												
												 <a  class="btn btn-danger btn-sm del" 
												href="javascript:;">删除</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

						<div class="page">
							<!-- 							<span class="total float-left page-link">共23223条</span>
 -->
							<ul class="pagination">
								<li class="page-item"><a class="page-link"
									href="AppointmentList?currentPage=1">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li class="page-item"><a class="page-link"
										href="AppointmentList?currentPage=${pageInfo.pageNum-1}">&lt;&lt;</a></li>
								</c:if>

						        <c:forEach begin="${pageInfo.pageNum  }"  end="${pageInfo.pages }" var="i">
                                        <li class="page-item"><a class="page-link" href="AppointmentList?currentPage=${i }">${i }</a></li>
                                </c:forEach>
                                        
								<c:if test="${pageInfo.hasNextPage }">
									<li class="page-item"><a class="page-link"
										href="AppointmentList?currentPage=${pageInfo.pageNum+1}">&gt;&gt;</a></li>
								</c:if>
								<li class="page-item"><a class="page-link"
									href="AppointmentList?currentPage=${pageInfo.pages}">尾页</a></li>
								 <li style="margin-left: 10px; margin-top: 6px;">共<i
									class="blue">${pageInfo.total }</i>条记录，当前显示第<i class="blue">${pageInfo.pageNum }</i>页,&nbsp;
									总<i class="blue">${pageInfo.pages }</i>页
								</li> 
							</ul>

						</div>
					</div>
				</main>
			</div>

		</main>
	</div>
	<script>
	
	function updateAppStatus(id,status){
		if(confirm("确定要审批这条数据吗?")){
	 		 　 $.ajax({
					url:"updateAppointment",
				  	data:{"id": id,"status":status},
					type:"post",
					dataType:"json",
				  	success:function (data) {
					 	if (data) {
							alert("审核成功！");
							document.location.reload();//当前页面
					  	}else{
					  		alert("审核失败！");
					  	}
				 	}  
			 	}); 
	 		}
	}
	
	   $('a.del').click(function(e) 
   		        {
   		            var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			   		if(confirm("确定删除吗?")){
			 		 　 $.ajax({
							url:"deleteCategory",
						  	data:{"id": id},
							type:"post",
							dataType:"json",
						  	success:function (data) {
							 	if (data) {
									alert("删除成功！");
									document.location.reload();//当前页面
							  	}else{
							  		alert("删除失败！");
							  	}
						 	}  
					 	}); 
			 		}

   		        })
	
	</script>
</body>
</html>
