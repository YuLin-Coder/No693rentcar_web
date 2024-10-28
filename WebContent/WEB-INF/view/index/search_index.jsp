<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
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
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/pro.css">
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery-1.8.2.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/view/index/header.jsp" />


<style>
.s-form { margin-top:5px;}
.toselect{background-color: rgb(64, 100, 156); color:#FFF}
</style>
<div id="about">
  <div class="mTags" style="margin-bottom:20px">
    <div class="wrap"> <a href="#">汽车租赁系统</a>><a href="#">我要租车</a> </div>
  </div>
  <div class="wrap text-left">
    <div class="carfliter-box">
      <div class="condition">
        <ul>
          <li class=""> <span class="c-name left">品牌：</span>
            <div class="spec-moudle left dInline"> 
                <c:forEach items="${brandList}" var="data">
                      <a href="toSearchIndex?bid=${data.id }" ><img src="/images/${data.photo }" style="height:32px;"/>${data.bname }</a>
                
		        </c:forEach>
            </div>
          </li>
        
          <li class="" style="height:48px;"> <span class="c-name left">车型：</span>
            <div class="spec-moudle left dInline" style="height:auto;">
              <c:forEach items="${categoryList}" var="data">
               <a  href="toSearchIndex?cid=${data.id }" ><img src="/images/${data.photo }" height="30"/><br/>${data.name }</a>
                </c:forEach>
               </div>
          </li>
        
          <li class=""> <span class="c-name left">排放标准：</span>
            <div class="spec-moudle left dInline"> <a href="toSearchIndex?pf_stand=国四" >国四</a> 
            <a href="toSearchIndex?pf_stand=国五" >国五</a> </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="aWrap clearfix wrap">
    <div class="left dInline aLeft">
      <div class="carSou">
        <div class="cs-tit">
          <div class="clearfix">
         
          </div>
          <div class="cs-tit1"></div>
        </div>
        
        
        
        <div class="cs-list">
          <ul>
          
           <c:forEach items="${pageInfo.list}" var="data">
           
            <li class="clearfix" style="position: relative;"> <span class="carImg left dInline">
            <a href="toCarDetail?cid=${data.id }" >
              <div class="car_bg"> </div>
              <img src="/images/${data.photo }"  width="300" /></a> </span>
              <div class="carTxt right dInline">
                <h2><a href="toCarDetail?cid=${data.id }" >${data.name }</a></h2>
                <p> <span>上牌时间：${data.sp_date }</span> <span>行驶里程：${data.distance }</span> <span>排量：${data.pl }</span> <span>排放标准：${data.pf_stand }</span> </p>
                <div class="price clearfix" style="margin:8px 0;">
                  <div class="left dInline pNum" style="width:110px;"> <font>一口价</font><br/>
                    <span class="num nBlue">${data.price1 } </span> </div>
                  <span class="num1 left" style="height:43px; width:450px;padding-top:10px;"><em>租金/天：${data.price2 } </em><br/>
                 
                  </span> </div>
                <div class="cs_bt clearfix" style="padding-top:7px;"> 
                <a href="toCarDetail?cid=${data.id }" class="cs-q b-login" id="Order_1165">查看详情</a> 
              </div>
            </li>
            
            </c:forEach>
            
            
          </ul>
          <div class="pages"> 
            <a class="" href="toSearchIndex?currentPage=1" >首页</a>
             <c:if test="${pageInfo.hasPreviousPage }">
               <a class="" href="toSearchIndex?currentPage=${pageInfo.pageNum-1}"  >上一页</a>
            </c:if>
            
			        <c:forEach begin="${pageInfo.pageNum  }"  end="${pageInfo.pages }" var="i">
                             <a class=""  	<c:if test="${i== pageInfo.pageNum}">class="on" </c:if>  href="toSearchIndex?currentPage=${i }">${i }</a>
                      </c:forEach>
                      
                      	<c:if test="${pageInfo.hasNextPage }">
									<a class=""
										href="toSearchIndex?currentPage=${pageInfo.pageNum+1}">下一页</a>
								</c:if>
							<a class="" href="toSearchIndex?currentPage=${pageInfo.pages}">尾页</a>
          
	      <!--     <a class="on" href="#">1</a>
	          <a class="" href="#">2</a>
	          <a class="" href="#">3</a>
	          <a class="" href="#">4</a>
	          <a class="" href="#">5</a> 
	          <a href="#">>></a> 
	          <a href="#">32</a>  -->
          </div>
        </div>
      </div>
    </div>
    <div class="right dInline aRight"> 
      <div class="dBox">
        <link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/alert.css">
        <style type="text/css">
input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #000;}
input:-moz-placeholder, textarea:-moz-placeholder {color:#000;}
input::-moz-placeholder, textarea::-moz-placeholder {color:#000;}
input:-ms-input-placeholder, textarea:-ms-input-placeholder {color:#000;}
</style>
       
        <script type="text/livescript">
$("#sendMESS").live("click",function(){
	var ckmobile=$("#ckmobile").val();
	if(ckmobile){
		$("#yzcode").attr("src",'/Admin/Login/buildVerify');
		$('#popBoxYzm').fadeIn();
	}else{
		sendtosend();
	}
});
function sendtosend(){
	if ($('#remembermobile').attr('checked')){
		remember = 2;
	}else{
		remember='';
	}
	var mobile=$("#shoujihao").val();
	var verify=$("#yanzhengma").val();
	var re = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
	if(!re.exec(mobile)){
		alert("手机号格式不正确");
		$("#shoujihao").focus();
		return false;
	}else{
		$("#input-phone").val(mobile);
		$("#input-verify").val(verify);
		$('#popBoxYzm').fadeOut();
		$('#dForm').submit();
	}
}
</script> 
      </div>
        <div id="d_gd">
      
      
   <%--    <div class="gd_box">
          <!--<div class="dWx"> <a href="javascript:;"><img src="<%=path%>/resource/index/images/5678b0dbe039f.jpg-thumb.jpg"/></a> </div>-->
          <div class="txtMarquee-top">
            <div class="sameCar bd">
              <h4>在途同类型车源<a style="float:right; color:#FFF" href="2/sta/B/ord/STA/url_form/.html">更多>></a></h4>
              <ul class="infoList">
                <li> <a href="2/id/1175.html">宝马X3(进口) 2014 款 2.0T 自动 xDrive28i X设计套装</a> </li>
                <li> <a href="2/id/1174.html">宝马3系 2014 款 2.0T 自动 320i时尚型</a> </li>
                <li> <a href="2/id/1173.html">宝马3系GT(进口) 2014款 2.0T 自动 320i 领先型</a> </li>
                <li> <a href="2/id/1172.html">奔驰E级 2015 款 2.0T 自动 E260L运动型(改款）</a> </li>
                <li> <a href="2/id/1171.html">别克 昂科威 2014 款 2.0T 自动 28T四驱全能运动旗舰型</a> </li>
                <li> <a href="2/id/1170.html">奥迪A6L 2014 款 2.0T  TFSI舒适型</a> </li>
                <li> <a href="2/id/1167.html">大众 Tiguan 2011 款 2.0T 自动 TSI R-Line</a> </li>
                <li> <a href="2/id/1169.html">宝马5系 2014 款 2.0T 自动 528Li豪华设计套装</a> </li>
                <li> <a href="2/id/1168.html">宝马X3(进口) 2013 款 2.0T 自动 xDrive20i豪华型(改款)</a> </li>
                <li> <a href="2/id/1166.html">宝马5系 2014 款 2.0T 自动 525Li豪华设计套装</a> </li>
                <li> <a href="2/id/1091.html">宝马X5(进口) 2013款 3.0T xDrive35i（美规）</a> </li>
                <li> <a href="2/id/1090.html">路虎 揽胜 2014 款 3.0T 自动 V6 SC Vogue</a> </li>
                <li> <a href="2/id/1089.html">宝马5系 2013 款 2.0T 自动 525Li领先型</a> </li>
              </ul>
            </div>
          </div>
        </div>
     
      --%>
     
      </div>
      <style type="text/css">
			.sameCar{margin-top:20px;padding-bottom:15px;border:1px solid #ccc;border-top:none;}
			.sameCar h4{font-size:14px;color:#fff;padding:10px;background:#3F7DDD;}
			.sameCar ul{}
			.sameCar li{line-height:20px; margin:0px 10px;border-bottom:1px solid #ccc;padding:5px 0;}
			.nav_fixed{position:fixed;top:0px;z-index: 10;}
* html .nav_fixed{position:absolute;bottom:auto;top:expression(eval(document.documentElement.scrollTop));}
			#header{position:absolute;}
			#d_gd,.gd_box{width:253px;overflow:hidden;}
			
			</style>
    </div>
  </div>
</div>




<script type="text/javascript">
$(function(){
})
</script>
<jsp:include page="/WEB-INF/view/index/footer.jsp" />


<script type="text/javascript" src="<%=path%>/resource/index/js/miniBar.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/lg_reg.js"></script>
 
<script type="text/javascript" src="<%=path%>/resource/index/js/search_car.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery.SuperSlide.2.1.1.js"></script>
<!--右侧搜索加入对比结束-->
<!--右侧滚动开始--> 
<script type="text/javascript">
$(function(){
	$(window).scroll(function(){
	})
})
jQuery(".txtMarquee-top").slide({mainCell:".bd ul",autoPlay:true,effect:"topMarquee",vis:5,interTime:50,trigger:"click"});
</script>
<!--右侧滚动结束--> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/bootstrap/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=path%>/resource/index/bootstrap/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script> 
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
       format: 'yyyy-mm',
		language:"zh-CN",        
		startView: 3,
		minView: 3,
		autoclose:true	

    });
</script> 

</body>
</html>