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
<title>添加租赁</title>
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
		<main>
		     <div class="main">

						<div class="title-box">
							<h5>租车</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
									 <input type="hidden" value="${cid}" name="cid">

										<div class="form-group">
											<label>开始日期</label> <input type="text" name="start_date" id="start_date"
											 	autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_date\')}'})"
											 class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
										
									   <div class="form-group">
											<label>结束日期</label> <input type="text" name="end_date" id="end_date"
											 	autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'start_date\')}'})"
											 class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
										
										<div class="form-group">
											<label>付款方式</label> <select name="pay_way" class="form-control">
														  <option value="支付宝">支付宝</option>
														  <option value="微信">微信</option>
											         
											</select> <small class="form-text text-muted"></small>
										</div>
										
										
									</form>
								</div>
							</div>

						</div>

						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">立即提交</button>
						</div>
					</div>

		</main>
	</div>

	
	
	<script>

layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 laydate = layui.laydate,
	 upload = layui.upload,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	
	  /*   laydate.render({
	    elem: '#schoolTime'
	  }); 
	    laydate.render({
	    elem: '#day'
	  });  */
	  
	  
	  var uploadInst = upload.render({
          elem: '#test1'
          ,url: 'upload2'
          ,accept:'file'
          ,size:50000
          ,before: function(obj){

              obj.preview(function(index, file, result){

                  $('#demo1').attr('src', result);
              });
          }
          ,done: function(res){
              //如果上传失败
              if(res.code > 0){
                  return layer.msg('上传失败');
              }
              //上传成功
              var demoText = $('#demoText');
              demoText.html('<span style="color: #4cae4c;">上传成功</span>');

              var fileupload = $(".htwj");
              fileupload.attr("value",res.data.src);
              console.log(fileupload.attr("value"));
          }
          ,error: function(){
              //演示失败状态，并实现重传
              var demoText = $('#demoText');
              demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
              demoText.find('.demo-reload').on('click', function(){
                  uploadInst.upload();
              });
          }
      });
	 
	  
	  var uploadInst = upload.render({
          elem: '#test2'
          ,url: 'upload2'
          ,accept:'images'
          ,size:50000
          ,before: function(obj){

              obj.preview(function(index, file, result){

                  $('#demo2').attr('src', result);
              });
          }
          ,done: function(res){
              //如果上传失败
              if(res.code > 0){
                  return layer.msg('上传失败');
              }
              //上传成功
              var demoText = $('#demoText2');
              demoText.html('<span style="color: #4cae4c;">上传成功</span>');

              var fileupload = $(".photo2");
              fileupload.attr("value",res.data.src);
              console.log(fileupload.attr("value"));
          }
          ,error: function(){
              //演示失败状态，并实现重传
              var demoText = $('#demoText');
              demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
              demoText.find('.demo-reload').on('click', function(){
                  uploadInst.upload();
              });
          }
      });
	    

	  });


</script>
	
	<script>
		$("#save").click(function() {
			$.ajax({
				cache : true,
				type : "post",
				url : "addOrders",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("租赁成功！");
						window.parent.location.reload();
					} else {
						alert("租赁失败！");
					}
				}
			})
		});
	</script>
	

</body>
</html>
