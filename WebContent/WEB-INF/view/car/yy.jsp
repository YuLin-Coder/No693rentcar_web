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
	content="width=device-width, Appointment-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加汽车</title>
<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/resource/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/html.css">
<script src="<%=path%>/resource/static/js/vue.min.js"></script>
<script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
<script src="<%=path%>/resource/static/admin/js/config.js"></script>
<script src="<%=path%>/resource/static/admin/js/script.js"></script>
<script src="<%=path%>/resource/layui/layui.js"></script>
<script  type="text/javascript" src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>

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

		<main>

		     <div class="main">

						<div class="title-box">
							<h5>预约汽车</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
									 <input type="hidden" value="${id}" name="cid">
									 <input type="hidden" value="${eid}" name="eid">

										<div class="form-group">
											<label>预约时间</label> <input type="text" name="create_date"
											autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>


										<div class="form-group">
											<label>具体时段</label>
                                                       <select name="times" class="form-control">
														  <option value="9:00-10:00">9:00-10:00</option>
														  <option value="10:00-11:00">10:00-11:00</option>
											        </select> 
											 <small
												class="form-text text-muted"></small>
										</div>

									</form>
								</div>
							</div>

						</div>


						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">确认预约</button>
							<!--             <button type="button" onclick="window.history.back()" class="btn btn-outline-secondary">取消</button>
 -->
						</div>
					</div>




		</main>
	</div>
	<script>
		$("#save").click(function() {
			$.ajax({
				cache : true,
				type : "post",
				url : "addAppointment",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("预约成功！");
						window.parent.location.reload();
					} else {
						alert("预约失败！");
					}
				}
			})
		});
	</script>
	

</body>
</html>
