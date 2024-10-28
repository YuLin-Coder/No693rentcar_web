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
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/alert.css">
<link rel="stylesheet" href="<%=path%>/resource/index/css/quanju.css" type="text/css" media="all">
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery-1.8.2.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/view/index/header.jsp" />

<style type="text/css">
#header{position:absolute;}
.nav_fixed{position:fixed;top:0px;}
* html .nav_fixed{position:absolute;bottom:auto;top:expression(eval(document.documentElement.scrollTop));}
.mTags span.right{font-size:14px;padding-top:4px;display:inline-block;}
.mTags span.right a{font-size:14px;color:#f60;}
.l_dizhi{height:35px; line-height:35px;}
.l_dizhi img{vertical-align: middle;position:relative;top:-1px;}
#jShow{position:absolute;left:0;top:0;color:#fff;background:#d00;width:20px;text-align: center;z-index: 100;padding:10px;font-size:18px;font-weight: bold;}
</style>
<div id="about">
  <div class="mTags wrap"> <a href="#">汽车租赁系统</a>><a href="#">我的订单</a> </div>
  <div class="wrap clearfix buyTop" style="padding-bottom:40px;">
  
  <div class="wrap">
    <div class="buyDetail">
      <div class="b_tab_nav">
        <div class="b-tab"> <a class="on b_ta" href="#cBox1" data-scroll data-speed="1000">我的订单<i></i></a> 
      </div>
      <div class="b-cont">
        <div id="cBox1" class="c_box">
          <h2>${car.name }</h2>
          <div class="cbox-a">
            <div class="ca-dl"> <span class="caItem on">我的预约</span>
              <div class="clearfix">
                <div class="jb_infor">
                  <table border='1' style="width:200%">
                    <tr>
                      <td width="270">预约车辆</td>
                      <td width="270">预约日期</td>
                      <td width="270">详细时间</td>
                      <td width="270">预约状态</td>
                    </tr>
					<c:forEach items="${appointmentList}" var="data">
					<tr>
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
                          </tr>
                   	</c:forEach>
                  </table>
                </div>
            
              </div>
            </div>
            
            <div class="ca-dl"> <span class="caItem on">我的订单</span>
              <div class="clearfix">
                 <table border='1'>
                    <tr>
                      <td width="270">订单编号</td>
                      <td width="270">车辆名称</td>
                      <td width="270">车辆号牌</td>
                      <td width="270">开始日期</td>
                      <td width="270">结束日期</td>
                      <td width="270">租赁天数</td>
                      <td width="270">总价</td>
                      <td width="270">支付方式</td>
                      <td width="270">状态</td>
                      <td width="270">下单时间</td>
                      <td width="270">我的合同</td>
                    </tr>
                    
                    <c:forEach items="${ordersList}" var="data">
					<tr>
						<td>${data.order_no }</td>
						<td>${data.car.name }</td>
						<td>${data.car.carno }</td>
						<td>${data.start_date }</td>
						<td>${data.end_date }</td>
						<td>${data.days }</td>
						<td>${data.total_price }</td>
						<td>${data.pay_way }</td>
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
						<td>${data.create_time }</td>
						<td>
						     <c:if test="${data.ht == null}">
							   暂未上传合同
								 </c:if>
						
						  <c:if test="${data.ht != null}">
							   <a  href='downLoad?resPath=${data.ht.htwj}' style="color:blue">点击下载</a>
								 </c:if>
						 </td>
							
                          </tr>
                   	</c:forEach>
                  </table>
              </div>
            </div>
       
       
       
          </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
    </div>
  </div>


</div>


<script type="text/javascript"
	src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
	
<script src="<%=path%>/resource/layui/layui.js"></script>

<script>
 
  layui.use(['layer','form','jquery'], function () {//调用layui组件
		var form = layui.form;
   		var layer=layui.layer;
	    $=layui.jquery;  
	    form.render();
	    
	    
	 $('#yy').on("click",function(e){
		 var id = $("#cid").val();
		 var eid = $("#eid").val();
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
	  		  content: '${pageContext.request.contextPath}//toYyCar?id='+id+'&eid='+eid, 
	  	  });
	    }); 
	    
	 $('#zl').on("click",function(e){
		 var cid = $("#cid").val();
		 layer.open({
	  	      //调整弹框的大小
	  		  area:['500px','650px'],
	  		  shadeClose:true,//点击旁边地方自动关闭
	  		  //动画
	  		  anim:2,
	  		  //弹出层的基本类型
	  		  type: 2, 
	  		  title: '汽车租赁',
	  		  //刚才定义的弹窗页面
	  		  content: '${pageContext.request.contextPath}//toAddOrders?cid='+cid 
	  	  });
	    }); 
	  
  });

  </script>      
	
	
<jsp:include page="/WEB-INF/view/index/footer.jsp" />

<script type="text/javascript" src="<%=path%>/resource/index/js/miniBar.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/lg_reg.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/smooth-scroll.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery.SuperSlide.2.1.1.js"></script> 

<script type="text/javascript" src="<%=path%>/resource/index/js/CarLoad.js"></script> 
<!--图片切换-->
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery.min.js"></script>
<script>
	var i=0; //图片标识
var img_num=$(".img_ul").children("li").length; //图片个数
$(".img_ul li").hide(); //初始化图片	
play();
$(function(){
	 $(".img_hd ul").css("width",($(".img_hd ul li").outerWidth(true))*img_num); //设置ul的长度
	 
	 $(".bottom_a").css("opacity",0.7);	//初始化底部a透明度
	 //$("#play").css("height",$("#play .img_ul").height());
	 if (!window.XMLHttpRequest) {//对ie6设置a的位置
	 $(".change_a").css("height",$(".change_a").parent().height());}
	 $(".change_a").focus( function() { this.blur(); } );
	 $(".bottom_a").hover(function(){//底部a经过事件
		 $(this).css("opacity",1);	
		 },function(){
		$(this).css("opacity",0.7);	 
			 });
	 $(".change_a").hover(function(){//箭头显示事件
		 $(this).children("span").show();
		 },function(){
		 $(this).children("span").hide();
			 });
	 $(".img_hd ul li").click(function(){
		 i=$(this).index();
		 play();
		 });
	 $(".prev_a").click(function(){
		 //i+=img_num;
		 i--;
		 //i=i%img_num;
		 i=(i<0?0:i);
		 play();
		 }); 
	 $(".next_a").click(function(){
		 i++;
		 //i=i%img_num;
		 i=(i>(img_num-1)?(img_num-1):i);
		 play();
		 }); 
	 }); 
function play(){//动画移动	
	var img=new Image(); //图片预加载
	img.onload=function(){img_load(img,$(".img_ul").children("li").eq(i).find("img"))};
	img.src=$(".img_ul").children("li").eq(i).find("img").attr("src");
	//$(".img_ul").children("li").eq(i).find("img").(img_load($(".img_ul").children("li").eq(i).find("img")));
	
	$(".img_hd ul").children("li").eq(i).addClass("on").siblings().removeClass("on");
	if(img_num>7){//大于7个的时候进行移动
		if(i<img_num-3){ //前3个
		$(".img_hd ul").animate({"marginLeft":(-($(".img_hd ul li").outerWidth()+4)*(i-3<0?0:(i-3)))});
		}
		else if(i>=img_num-3){//后3个
			$(".img_hd ul").animate({"marginLeft":(-($(".img_hd ul li").outerWidth()+4)*(img_num-7))});
			}
	}
	if (!window.XMLHttpRequest) {//对ie6设置a的位置
	$(".change_a").css("height",$(".change_a").parent().height());}
	}
function img_load(img_id,now_imgid){//大图片加载设置 （img_id 新建的img,now_imgid当前图片）
    
    if(img_id.width/img_id.height>1)
	{
		if(img_id.width >=$("#play").width()) $(now_imgid).width($("#play").width());
		}
	else {
		if(img_id.height>=500) $(now_imgid).height(365);
		}
		$(".img_ul").children("li").eq(i).show().siblings("li").hide(); //大小确定后进行显示
	}
function imgs_load(img_id){//小图片加载设置
	if(img_id.width >=$(".img_hd ul li").width()){img_id.width = 80};
	//if(img_id.height>=$(".img_hd ul li").height()) {img_id.height=$(".img_hd ul li").height();}
	}
	</script>




</body>
</html>