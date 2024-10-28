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
  <div class="mTags wrap"> <a href="#">汽车租赁系统</a>><a href="#">汽车详情</a> </div>
  <div class="wrap clearfix buyTop" style="padding-bottom:40px;">
    <div class="left dInline" style="width:592px;" >
      <!--图片切换部分开始-->
      <div id="play">
  <ul class="img_ul">
    <li style="display:block;"><a class="img_a"><img src="/images/${car.photo }"></a></li>
  </ul>
</div>
      <!--图片切换部分结束-->
    </div>
    <div class="buyTxt right dInline">
      <h1>${car.name }</h1>
      <div class="byDl clearfix">
        <div class="price" style="width:235px;">
          <p>售价价：</p>
          <span class="num nBlue"> ${car.price1 } </span> 
          <p style="padding-top:6px;">租价/天:${car.price2 }</p>
        </div>
      <div class="byDl clearfix byDl_tab"> <span class="left bItem">
        <div> 上牌时间
          <p>${car.sp_date }</p>
        </div>
        </span> <span class="left bItem">
        <div> 行驶里程
          <p>${car.distance }</p>
        </div>
        </span> <span class="left bItem">
        <div> 排量
          <p>${car.pl }</p>
        </div>
        </span> <span class="left bItem">
        <div> 排放标准
          <p>${car.pf_stand }</p>
        </div>
        </span> </div>
        
         <input type="hidden" value="${car.id}" name="cid" id="cid">
	     <input type="hidden" value="${car.eid}" name="eid"  id="eid">
        
      <div class="byBtn clearfix"> <a class="by_qd b-login" id="yy" type="button"  >立即预约</a>
       <a type="button" id="zl" class="balance_2">立即租赁</a>
        
      </div>
    
    </div>
  </div>
  <div class="wrap speciality lazy-mod" id="speciality">
    <ul class="clearfix unstyled">
      <li class="notbad" style="width:148px"> <span> <i></i> </span> <em>杜绝事故车</em> </li>
      <li class="choiceness" style="width:148px"> <span> <i></i> </span> <em>精选优质名车</em> </li>
      <li class="check_360" style="width:148px"> <span> <i></i> </span> <em>365项检测认证</em> </li>
      <li class="new_car_standa" style="width:148px"> <span> <i></i> </span> <em>准新车上市车标准</em> </li>
      <li class="O2O" style="width:148px"> <span> <i></i> </span> <em>待售车辆专人护理</em> </li>
      <li class="km" style="width:148px"> <span> <i></i> </span> <em>5千公里无需保养</em> </li>
      <!--<li class="free_year_check">
	            <span>
	                <i></i>
	            </span>
	            <em>终身免费车辆年检</em>
	        </li>-->
      <li class="one_year_ok" style="width:148px"> <span> <i></i> </span> <em>一年或2万公里无忧质保</em> </li>
      <!--<li class="free_upkeep">
	            <span>
	                <i></i>
	            </span>
	            <em>一年免费保养</em>
	        </li>-->
      <li class="hover_24" style="width:148px"> <span> <i></i> </span> <em>24小时道路救援</em> </li>
    </ul>
  </div>
  <div class="wrap">
    <div class="buyDetail">
      <div class="b_tab_nav">
        <div class="b-tab"> <a class="on b_ta" href="#cBox1" data-scroll data-speed="1000">基本信息<i></i></a> 
      </div>
      <div class="b-cont">
        <div id="cBox1" class="c_box">
          <h2>${car.name }</h2>
          <div class="cbox-a">
            <div class="ca-table">
              <table>
                <tr>
                  <td class="ca-td1">上牌时间</td>
                  <td>${car.sp_date }</td>
                  <td class="ca-td1">年检到期时间</td>
                  <td>${car.nj_date }</td>
                  <td class="ca-td1">强险到期时间</td>
                   <td>${car.bxdq_date }</td>
                  <td class="ca-td1">车辆编号</td>
                  <td>${car.carno }</td>
                </tr>
                <tr>
                  <td class="ca-td1">车身颜色</td>
                  <td>${car.color }</td>
                  <td class="ca-td1">排量</td>
                  <td>${car.pl }</td>
                </tr>
              </table>
            </div>
            <div class="ca-dl"> <span class="caItem on">基本信息</span>
              <div class="clearfix">
                <div class="jb_infor left">
                  <table>
                    <tr>
                      <td width="270">排放标准</td>
                     <td>${car.pf_stand }</td>
                    </tr>
                  </table>
                </div>
                <div class="jb_infor right">
                  <table>
                    <tr>
                      <td width="270">行驶里程</td>
                      <td>${car.distance }</td>
                    </tr>
                    <tr>
                      <td class="ca-td1">车源状态</td>
                      <td>未出租</td>
                    </tr>
                  </table>
                </div>
                <div class="jb_infor left">
                  <table>
                    <tr>
                      <td width="270">内饰颜色</td>
                       <td>${car.color }</td>
                    </tr>
                  </table>
                </div>
                <div class="jb_infor left">
                  <table>
                    <tr>
                      <td width="270">商业险到期日</td>
                       <td>${car.bxdq_date }</td>
                    </tr>
                    <tr></tr>
                  </table>
                </div>
              </div>
            </div>
            
            <div class="ca-dl"> <span class="caItem on">详细描述</span>
              <div class="clearfix">
                <table>
                  <tr>
                    <td colspan="8"><p>${car.note }</p></td>
                  </tr>
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