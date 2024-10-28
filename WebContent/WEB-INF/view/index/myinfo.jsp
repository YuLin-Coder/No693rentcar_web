<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();//获得当前的项目根目录路径赋值给path
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>汽车租赁系统</title>
<meta name="description" content="XXX汽车"/>
<meta name="keywords" content="郑州二手车,河南二手车,郑州二手名车"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/sell.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/alert.css">
<link rel="stylesheet"  type="text/css" href="<%=path%>/resource/layui/css/layui.css">

<script type="text/javascript" src="<%=path%>/resource/index/js/jquery-1.8.2.min.js"></script>
</head>                                        
<body>
<jsp:include page="/WEB-INF/view/index/header.jsp" />
		
<script src="<%=path%>/resource/layui/layui.js"></script>
						
<div id="about">
	<div class="mTags wrap">
		<a href="#">汽车租赁系统</a>><a href="3.html">我的个人信息</a>
	</div>
				<div class="selDetail" style="float:left;margin-left:500px;">
					<div class="sell-form right dInline" style="height:600px;background-color:#009FE0">
						<form   method="post" name="forms" id="saveForm" >
							<input type="hidden" name="id" id="id" value="${data.id }" />
							
							<h3>我的个人信息</h3>
							<div class="sell-info" style="margin-top:5px">
							
						     	<div class="select-item clearfix">
						     	   <label> 姓名：</label><br><br> 
						     	  <input type="text" value="${data.realName }" class="form_datetime cPut"  name="realName" />
								</div> <br>
							
						     	<div class="select-item clearfix">
						     	   <label> 密码：</label><br><br> 
						     	  <input type="text" value="${data.password }" class="form_datetime cPut"  name="password" />
								</div><br>
                               
							
						     	<div class="select-item clearfix">
						     	   <label> 昵称：</label><br><br> 
						     	  <input type="text" value="${data.nickname }" class="form_datetime cPut"  name="nickname" />
								</div><br>
                               
							
						     	<div class="select-item clearfix">
						     	   <label> 手机号：</label><br><br> 
						     	  <input type="text" value="${data.phone }" class="form_datetime cPut"  name="phone" />
								</div><br>
                               
                            <%--    	
						     	<div class="select-item clearfix">
						     	   <label>是否实名认证：</label><br><br> 
						     	   
						     	   <c:if test="${data.status == '0' }">
						     	     <input type="text" value="否" class="form_datetime cPut"   readonly/>
						     	   </c:if>
						     	     <c:if test="${data.status == '1' }">
						     	     <input type="text" value="是" class="form_datetime cPut"   readonly/>
						     	   </c:if>
								</div><br> --%>
								
                           <input type="hidden" name="img" class="img" value="${data.img }">
                               
                                <div class="select-item clearfix">
                                   <label for="name">图片:</label><br><br>
										        <div class="layui-upload">
										          <div class="layui-upload-list">
										                <img class="layui-upload-img" src="/images/${data.img }" style="width:200px;height:100px;" id="demo1">
										                <button type="button" class="layui-btn layui-btn-sm " id="test1">+</button>
										                <p id="demoText"></p>
										            </div>
										           
										        </div>
								</div><br><br><br><br><br><br><br>
								<div class="select-item clearfix">
							      <button type="button" id="save" class="layui-btn layui-btn-sm " >确定提交</button>
							      	
								</div>
							</div>
						</form>
				
					</div>
				</div>
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
	  
	  
		 $('#rz').on("click",function(e){
			 layer.open({
		  	      //调整弹框的大小
		  		  area:['500px','650px'],
		  		  shadeClose:true,//点击旁边地方自动关闭
		  		  //动画
		  		  anim:2,
		  		  //弹出层的基本类型
		  		  type: 2, 
		  		  title: '预约看车',
		  		  //刚才定义的弹窗页面
		  		  content: '${pageContext.request.contextPath}/toYyCar?id='+id+'&eid='+eid, 
		  	  });
		    }); 
		  
	  
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

              var fileupload = $(".img");
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
					url : "updateUser",
					data : $("#saveForm").serialize(),
					async : false,
					success : function(e) {
						if (e) {
							alert("修改成功！");
							window.parent.location.href = "toMyinfo";
						} else {
							alert("修改失败！");
						}
					}
				})
			});
</script>	

</body>
</html>