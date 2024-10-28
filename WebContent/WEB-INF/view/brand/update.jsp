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
	content="width=device-width, BrandDate-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加汽车品牌</title>
<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/resource/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/html.css">
<script src="<%=path%>/resource/static/js/vue.min.js"></script>
<script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
<script src="<%=path%>/resource/static/admin/js/config.js"></script>
<script src="<%=path%>/resource/static/admin/js/script.js"></script>
<script src="<%=path%>/resource/layui/layui.js"></script>
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


				<main>
					<div class="main">

						<div class="title-box">
							<h5>修改汽车品牌</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
									<input type="hidden" name="id" value="${BrandDate.id }"> 

										
										<div class="form-group">
											<label>品牌名称</label> <input type="text" name="bname" value="${BrandDate.bname }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>车系</label> <input type="text" name="cx" value="${BrandDate.cx }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>描述</label> <textarea   name="note"
												class="form-control">${BrandDate.note }</textarea> <small
												class="form-text text-muted"></small>
										</div>
										
										

 										 <input type="hidden" name="photo" class="photo" value="${BrandDate.photo }">
										   <div class="form-group">
										        <label for="name">图片:</label>
										        <div class="layui-upload">
										          <div class="layui-upload-list">
										                <img class="layui-upload-img" style="width:200px;height:100px;" id="demo1">
										                <button type="button" class="btn btn-primary" id="test1">+</button>
										                <p id="demoText"></p>
										            </div>
										           
										        </div>
										    </div>
									</form>
								</div>
							</div>
						</div>

						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">确定提交</button>
							<a type="button" href="BrandList" class="btn btn-outline-secondary">返回</a>

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
				url : "updateBrand",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("修改成功！");
						window.parent.location.href = "BrandList";
					} else {
						alert("修改失败！");
					}
				}
			})
		});
	</script>
	
		
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
          ,accept:'images'
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

              var fileupload = $(".photo");
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
</body>
</html>
