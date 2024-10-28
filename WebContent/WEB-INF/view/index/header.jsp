<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
<div id="header">
  <div class="top">
    <div class="wrap clearfix"> <a href="#" class="logo left" style="color:white;font-size:30px;">汽车租赁系统</a>
      <div class="nav left dInline" id="headerMenu">
      <a  href="toIndex">首页</a>
      <a  <c:if test="${url == 'toSearchIndex'  }">class="on"</c:if> href="toSearchIndex">租车大厅</a>
      <a <c:if test="${url == 'toSrdz'  }">class="on"</c:if> href="toSrdz">私人定制</a>
        <c:if test="${user !=null }">
                 <a <c:if test="${url == 'toMyinfo'  }">class="on"</c:if> href="toMyinfo">个人信息</a>
                 <a <c:if test="${url == 'toMyOrders'  }">class="on"</c:if> href="toMyOrders">我的订单</a>
                 
           
        </c:if>
      <!--<a href="shfw.html">售后服务</a>-->
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
							<a href="toLoginOutAct" class="b-login" id="b-login">登录</a>|<a type="button"  id="reg">注册</a>|
			        </span> 
			      </c:if>
                
                </div>
  </div>
  <div class="head-search">
    <div class="wrap clearfix">
      <div class="yjxj clearfix left"  >
	      <form action="toSearchIndex" method="post">
	         <input type="text" name="key" placeholder="请输入汽车名称" class="left" />
	          <input type="submit" value="搜 索" class="right" />
	      </form>
      </div>
    </div>
  </div>
</div>
<script src="<%=path%>/resource/layui/layui.js"></script>


<script>

layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 laydate = layui.laydate,
	 upload = layui.upload,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	 
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
})
	
		
</script>
