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
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/index.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/layout.css">
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery-1.8.2.min.js"></script> 
<!--[if IE 6]>
<script type="text/javascript" src="<%=path%>/resource/index/js/DD_belatedPNG.js"></script>
<script>
        DD_belatedPNG.fix('*');
    </script>
<![endif]-->
</head>
<body>
<div id="header">
  <div class="top">
    <div class="wrap clearfix"> <a href="#" class="logo left"><img src="<%=path%>/resource/index/images/logo.png"/></a>
      <div class="nav left dInline" id="headerMenu">
      <a class="on" href="toIndex">首页</a>
      <a href="toSearchIndex">租车大厅</a>
      <a href="toSrdz">私人定制</a>
<!--       <a href="toTest">测试</a>
 -->           <c:if test="${user !=null }">
                 <a  href="toMyinfo">个人信息</a>
                 <a  href="toMyOrders">我的订单</a>
        </c:if>
      </div>
        <c:if test="${user !=null }">
            <span class="right" id="rightMenuHtml">
							<a class="b-login" id="b-login">欢迎用户：${user.realName }</a>|<a href="toLoginOutAct" id="b-regist">退出登录</a>|
			       
			        
			           <c:if test="${user.status == '0' }">
							    <a  type="button" id="rz">实名认证</a>
						     	   </c:if> 
			         </span> 
                </c:if>
			        <c:if test="${user ==null }">
			              <span class="right" id="rightMenuHtml">
							<a href="toLoginOutAct" class="b-login" id="b-login">登录</a>|<a href="#" id="reg">注册</a>|
			        </span> 
			      </c:if>
			      
   
        </div>
  </div>

</div>
<style type="text/css">
#banner .prevs,#banner .nexts{position:absolute;top:220px;z-index: 100;margin-top:-25px;}
#banner .nexts{right:0;}
#banner .banShow a{display:block;width: 100%;height:465px;}
</style>


<div id="banner">
  <div class="banShow clearfix" style="width:100%;"> 
    <a href="#" class="bDiv" style="background: url(<%=path%>/resource/index/images/y77.jpg) no-repeat center top;"></a>  
    <a href="#" class="bDiv" style="background:url(<%=path%>/resource/index/images/1.jpg) no-repeat center top;"></a> 
  </div>
  <div class="b_btn wrap"> 
    <!--<a class="prevs"><img src="<%=path%>/resource/index/images/l1.png"></a> 
    <a class="nexts"><img src="<%=path%>/resource/index/images/r1.png"></a>-->   
  </div>
  
  <div class="searchBox">
   <div class="xbg"></div>
   <div class="xnrj">
<%--    <img src="<%=path%>/resource/index/images/in1.png"/>
 --%>    <form class="clearfix" action="toSearchIndex" method="post" >
      <input type="text"  name="key" placeholder="请输入车的名称" class="left" />
      <input type="submit" value="" class="right" />
    </form></div>
  </div>
  
</div>
<div id="choose-nav" style="height:200px;">
  <div class="wrap clearfix"> 
    <!-- 品牌 -->
    <div class="item-brand c-item">
      <div class="trigger-icon"></div>
      <div class="brand-wrapper">
        <div class="hd cBlue">品牌</div>
        <div class="bd clearfix"> 
        
       <c:forEach items="${brandList}" var="data">
        
        <a href="toSearchIndex?bid=${data.id }" class="brand-item" ><img src="/images/${data.photo }" alt="奥迪"><span>${data.bname }</span></a>
        </c:forEach>
        </div>
      </div>
    
    </div>
    
       <div class="item-brand c-item">
      <div class="trigger-icon"></div>
      <div class="brand-wrapper">
        <div class="hd cBlue">车型</div>
        <div class="bd clearfix"> 
           <c:forEach items="${categoryList}" var="data">
	          <a href="toSearchIndex?cid=${data.id }" class="brand-item" ><img src="/images/${data.photo }" alt="奥迪"><span>${data.name }</span></a>
	        </c:forEach>
        </div>
      </div>
    
    </div>
  </div>
</div>
</div>
<div id="main">
  
  <div class="mDiv main-a">
    <div class="wrap">
      <div class="in-tit clearfix">
        <h1 class="left dInline"> 精品车源 </h1>
      </div>
      <div class="jpBox">
        <div class="jpTit"> 
        <a class="on"> <img src="<%=path%>/resource/index/images/cLogo.png"/> <span>推荐车源</span> <i></i></a>
        </div>
        <div class="jpCont">
          <div class="jpDl" style="display: block;">
            <ul class="clearfix">
               
               
             <c:forEach items="${carList}" var="data">
               
            
              <li class="clearfix" style="position: relative;"> 
               <a href="toCarDetail?cid=${data.id }" >
                <div class="carImg left dInline"> 
                  <img src="/images/${data.photo }" width="266" /> 
                </div>
                
                <div class="right carTxt dInline pve">
                  <div class="c-txt">
                    <h3>
                     <a href="#" target="_blank">${data.name }</a>
                    </h3>
                    
                    <p>${data.sp_date } |  ${data.distance }公里 | ${data.pl } | ${data.pf_stand }</p>
                    <div class="price">
                      <p>售价：</p>
                      <i>￥</i> <span class="num nBlue">${data.price1 } </span> <font> 租/天：￥ ${data.price2}</font> 
                    </div>
                    
                  </div>
                </div>
                
                </a>
                </li>
            
            </c:forEach>
            
            </ul>
            <div class="proMore"> <a href="toSearchIndex" target="_blank">查看更多>></a> </div>
          </div>
          

        </div>
      </div>
    </div>
  </div>

</div>

<jsp:include page="/WEB-INF/view/index/footer.jsp" />

<!--底部的结束-->

<!--右侧内容的开始-->


<script type="text/javascript" src="<%=path%>/resource/index/js/jquery.SuperSlide.2.1.1.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/index.js"></script> 
<!--右侧滑动-->
<script type="text/javascript" src="<%=path%>/resource/index/js/miniBar.js"></script>
<script type="text/javascript" src="<%=path%>/resource/index/js/lg_reg.js"></script>


<style>
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
</body>


<script src="<%=path%>/resource/layui/layui.js"></script>


<script>

layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 laydate = layui.laydate,
	 upload = layui.upload,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	
		 $('#rz').on("click",function(e){
			 layer.open({
		  	      //调整弹框的大小
		  		  area:['500px','650px'],
		  		  shadeClose:true,//点击旁边地方自动关闭
		  		  //动画
		  		  anim:2,
		  		  //弹出层的基本类型
		  		  type: 2, 
		  		  title: '实名认证',
		  		  //刚才定义的弹窗页面
		  		  content: '${pageContext.request.contextPath}/toAddSmrz', 
		  	  });
		    }); 
		 $('#reg').on("click",function(e){
			 layer.open({
		  	      //调整弹框的大小
		  		  area:['500px','650px'],
		  		  shadeClose:true,//点击旁边地方自动关闭
		  		  //动画
		  		  anim:2,
		  		  //弹出层的基本类型
		  		  type: 2, 
		  		  title: '用户注册',
		  		  //刚才定义的弹窗页面
		  		  content: '${pageContext.request.contextPath}/toRegister', 
		  	  });
		    }); 
})
</script>

</html>