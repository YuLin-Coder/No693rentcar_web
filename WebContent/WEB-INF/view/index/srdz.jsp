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
<link rel="stylesheet" type="text/css" href="<%=path%>/resource/index/css/ding.css">
<script type="text/javascript" src="<%=path%>/resource/index/js/jquery-1.8.2.min.js"></script>
<script src="<%=path%>/resource/index/js/jquery.cookie.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="/WEB-INF/view/index/header.jsp" />


<style>
input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #656565;}
input:-moz-placeholder, textarea:-moz-placeholder {color:#656565;}
input::-moz-placeholder, textarea::-moz-placeholder {color:#656565;}
input:-ms-input-placeholder, textarea:-ms-input-placeholder {color:#656565;}
</style>
<div id="about">
  <div class="mTags">
    <div class="wrap"> <a href="#">汽车租赁系统</a>><a href="">私人定制</a> </div>
  </div>
  <div class="dBox">
    <div class="dzDetail">
      <div class="wrap clearfix">
        <div class="dzLeft left dInline"> <strong>私人定制</strong>
          <p> 私人定制是根据您对车辆品牌、车型、颜色、内饰、配置、年限、公里数等的需求进行定制化服务，公司将全国范围内搜寻相匹配的优质车源，供您挑选，让爱车真正成为您的专属座驾。 </p>
        </div>
        <input type="hidden" id="ckmobile" value="1" />
        <div class="diForm" style="height: 486px;">
          <form id="saveForm" name="saveForm" method="post" >
            <h3>提交信息，帮您量身定制！</h3>
            <table>
              <tr>
                <td><select  name="bid"   placeholder="所属品牌">
                    <option value=""> 选择品牌</option>
                          <c:forEach items="${brandList}" var="data">
	                    <option value="${data.id }" >${data.bname }</option>
	                    </c:forEach>
                  </select></td>
              </tr>
              <tr>
                <td><div id="xlselect">
                    <select  name="cid"  id="cid" placeholder="汽车类型">
                      <option value=""> 选择汽车类型</option>
                      <c:forEach items="${categoryList}" var="data">
	                    <option value="${data.id }" >${data.name }</option>
	                    </c:forEach>
                    </select>
                  </div></td>
              </tr>
              <tr>
                <td><select name="ycnx">
                    <option value="不限">选择使用年限</option>
                    <option value="1年以内">1年以内</option>
                    <option value="2年以内">2年以内</option>
                    <option value="3年以内">3年以内</option>
                    <option value="3-5年">3-5年</option>
                  </select></td>
              </tr>
              <tr>
                <td><input type="text"  placeholder="期望租车时间"  class="form_datetime dateTxt" name="zcsj"></td>
              </tr>
               <tr>
                <td><input type="text"  placeholder="期望租金" class="form_datetime dateTxt"  name="price"></td>
              </tr>
               <tr>
                <td><input type="text"  placeholder="联系电话" class="form_datetime dateTxt"  name="phone"></td>
              </tr>
               <tr>
                <td><input type="text"  placeholder="姓名" class="form_datetime dateTxt"   name="realname"></td>
              </tr>
              <tr>
                <td colspan="2"><textarea name="note" class="f14" placeholder="其他要求"></textarea></td>
              </tr>
              <tr>
                <td colspan="2" style="text-align:right;">
                  <a type="button" class="btn" id="save">提交</a></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
    </div>
    <div style="text-align:center;padding:150px 0;"> <img src="<%=path%>/resource/index/images/dz1.jpg"/> </div>
  </div>
</div>


<script type="text/javascript" src="<%=path%>/resource/index/js/miniBar.js"></script> 
<script type="text/javascript" src="<%=path%>/resource/index/js/lg_reg.js"></script> 
<script language="javascript" type="text/javascript" src="datepicker/WdatePicker.js"></script> 
<script type="text/javascript" src="bootstrap/<%=path%>/resource/index/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="bootstrap/<%=path%>/resource/index/js/bootstrap-datetimepicker.js" charset="UTF-8"></script> 
<script type="text/javascript" src="bootstrap/<%=path%>/resource/index/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/<%=path%>/resource/index/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="bootstrap/<%=path%>/resource/index/css/bootstrap.min.css">
<script type="text/javascript">

$("#save").click(function() {
	$.ajax({
		cache : true,
		type : "post",
		url : "addYcxq",
		data : $("#saveForm").serialize(),
		async : false,
		success : function(e) {
			if (e) {
				alert("提交成功！");
				window.parent.location.reload();
			} else {
				alert("提交失败！");
			}
		}
	})
});

    $('.form_datetime').datetimepicker({
       format: 'yyyy-mm',
		language:"zh-CN",        
		startView: 3,
		minView: 3,
		autoclose:true
    });
</script> 
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
<style>
.dzDetail{height:492px;width:100%;background: url(<%=path%>/resource/index/images/dzBg.jpg) no-repeat center top;}
.diForm{float:right;width:402px;height:432px;}
.dzLeft{font-size:14px;color:#166cbe;width:415px;line-height:20px;margin-top:150px;}
.dzLeft strong{font-size:40px;display:block;padding-bottom:15px;}
.diForm table textarea{width:300px;padding:5px;height:60px;}
.diForm table{width:100%;}
.diForm form{padding:0px 44px 0 44px;}
.diForm form h3{font-weight: normal;font-size:18px;color:#166cbe;text-align:left;padding-bottom:13px;}
.diForm table td{padding-bottom:0;color: #656565;height:auto;padding:7px 0;}
.diForm table .dateTxt{padding-left:4px;width:303px;}
.diForm table .btn{font-size:16px;width:165px;margin:0;}
</style>
</body>
</html>