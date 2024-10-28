<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html >
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, Attendance-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>修改密码</title>
<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/html.css">
<script  type="text/javascript" src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
<script  type="text/javascript" src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
<script  type="text/javascript" src="<%=path%>/resource/static/admin/js/config.js"></script>
<script  type="text/javascript" src="<%=path%>/resource/static/admin/js/script.js"></script>
<script  type="text/javascript" src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
<style>
iframe {
 width: 218px !important;
    height: 350px !important;
    position: absolute;
    z-index: 117;
    top: -97px !important;
    right: -500px !important;
    width: 100%;
    height: 100%;
    border: 0;
    padding-top: 60px;
}
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

						<div class="title-box">
							<h5>修改密码</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
										<div class="form-group">
											<label>初始密码</label> 
											
											<input type="text" name="nowpass" id="nowpass"  class="form-control" autocomplete="off"  > 
												<small class="form-text text-muted"></small>
										</div>
										<div class="form-group">
											<label>新密码</label> 
											
											<input type="text" name="newpass" id="newpass"  class="form-control" autocomplete="off"   > 
												<small class="form-text text-muted"></small>
										</div>
									</form>
								</div>
							</div>

						</div>


						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">确定提交</button>
							<!--             <button type="button" onclick="window.history.back()" class="btn btn-outline-secondary">取消</button>
 -->
						</div>
					</div>
				</main>



			</div>

		</main>
	</div>
	<script>
		$("#save").click(function() {
			$.ajax({
				cache : true,
				type : "post",
				url : "updateAdminPassword",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("修改成功！");
						window.parent.location.href = "toLogin";
					} else {
						alert("修改失败！");
					}
				}
			})
		});
	</script>

</body>
</html>
