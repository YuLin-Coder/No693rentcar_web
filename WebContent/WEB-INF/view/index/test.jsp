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
	content="width=device-width, Car-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
<script src="https://cdn.bootcdn.net/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
</head>
<style>
  .trcss{
	  font-size:8px;
	  color:black;
	  text-align: initial;
	  padding-left:1px;
  }
</style>
<body >
<table class="reference"  style="width:252px; height:168px;text-align: center;border: 1px solid #151515 ">
    <tbody>
    <!--http://aquaitseoms.oss-cn-beijing.aliyuncs.com/eoms/objattch/20220311/qrcode20220311192058734.png-->
    <tr >
        <td colspan="3" style="font-size:18px;color:black">
             资料卡片
        </td>
     </tr>
    <tr>
        <td rowspan="1" class="trcss">
           设备编号：1552412
        </td>
          <td colspan="4" rowspan="4">
         <img  style="width:140px;height:140px;margin:0px auto 0px;box-sizing:border-box;"  
            src="http://aquaitseoms.oss-cn-beijing.aliyuncs.com/eoms/objattch/20220311/qrcode20220311192058734.png"> 
        </td>	
    </tr>
       <tr>
        <td rowspan="1"  class="trcss">
            设备名称：消防栓0001
        </td>
    </tr>
       <tr>
        <td rowspan="1"  class="trcss"> 
            出厂日期：2022-06-14 
        </td>
    </tr>
     <tr>
        <td rowspan="1"  class="trcss">
            水工二局  
        </td>
    </tr>
</tbody>
</table>
	

</body>
</html>
