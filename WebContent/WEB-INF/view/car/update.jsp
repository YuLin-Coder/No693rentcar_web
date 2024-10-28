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
	content="width=device-width, CarDate-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加汽车</title>
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
							<h5>修改汽车</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
									<input type="hidden" name="id" value="${CarDate.id }"> 

											<div class="form-group">
											<label>汽车名称</label> <input type="text" name="name" value="${CarDate.name }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
										
												<div class="form-group">
											<label>汽车类型</label> <select name="cid" class="form-control">
														<c:forEach items="${categoryList}" var="data">
														  <option value="${data.id }" <c:if test="${CarDate.cid ==  data.id }">selected</c:if>  >${data.name }</option>
														</c:forEach>
											         
											</select> <small class="form-text text-muted"></small>
										</div>
										
										
										
												<div class="form-group">
											<label>汽车品牌</label> <select name="bid" class="form-control">
														<c:forEach items="${brandList}" var="data">
														  <option value="${data.id }"  <c:if test="${CarDate.bid ==  data.id }">selected</c:if> >${data.bname }</option>
														</c:forEach>
											         
											</select> <small class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>车牌号</label> <input type="text" name="carno" value="${CarDate.carno }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>颜色</label> <input type="text" name="color" value="${CarDate.color }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>车辆价格</label> <input type="number" name="price1" value="${CarDate.price1 }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>租赁价格/天</label> <input type="number" name="price2" value="${CarDate.price2 }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>上牌时间</label> <input type="text" name="sp_date" value="${CarDate.sp_date }"
											autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>年检日期</label> <input type="text" name="nj_date" value="${CarDate.nj_date }"
											autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>保险到期</label> <input type="text" name="bxdq_date" value="${CarDate.bxdq_date }"
											autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>排放标准</label>
                                                       <select name="pf_stand" class="form-control">
														  <option value="国四"  <c:if test="${'国四' ==  CarDate.pf_stand }">selected</c:if>>国四</option>
														  <option value="国五"  <c:if test="${'国五' ==  CarDate.pf_stand }">selected</c:if>>国五</option>
											        </select> 
											 <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>行驶里程</label> <input type="text" name="distance" value="${CarDate.distance }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>排量</label> <input type="text" name="pl" value="${CarDate.pl }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

									
										<div class="form-group">
											<label>使用年限</label>
                                                       <select name="ycnx" class="form-control">
														  <option value="1年以内"  <c:if test="${'1年以内' ==  CarDate.ycnx }">selected</c:if> >1年以内</option>
														  <option value="2年以内"  <c:if test="${'2年以内' ==  CarDate.ycnx }">selected</c:if> >2年以内</option>
														  <option value="3年以内"  <c:if test="${'3年以内' ==  CarDate.ycnx }">selected</c:if> >3年以内</option>
											        </select> 
											 <small
												class="form-text text-muted"></small>
										</div>
									
										
										<div class="form-group">
											<label>车况描述</label> <textarea name="note"
												class="form-control">${CarDate.note } </textarea><small
												class="form-text text-muted"></small>
										</div>
										
 										 <input type="hidden" name="photo" class="photo" value="${CarDate.photo }">
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
							<a type="button" href="CarList" class="btn btn-outline-secondary">返回</a>

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
				url : "updateCar",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("修改成功！");
						window.parent.location.href = "CarList";
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
