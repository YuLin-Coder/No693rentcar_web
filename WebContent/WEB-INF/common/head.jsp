<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="icon" href="<%=path%>/resource/static/favicon.ico">
    <link rel="stylesheet" href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css" >
    <link rel="stylesheet" href="<%=path%>/resource/static/admin/css/index.css" >
    <link rel="stylesheet" href="<%=path%>/resource/static/admin/css/main.css" >
    <link rel="stylesheet" href="<%=path%>/resource/static/admin/css/html.css" >
    <script src="<%=path%>/resource/static/js/vue.min.js"></script>
    <script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js" ></script>
    <script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js" ></script>
    <script src="<%=path%>/resource/static/admin/js/config.js" ></script>
    <script src="<%=path%>/resource/static/admin/js/script.js" ></script>
    <script  type="text/javascript" src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
    
    <script>
        $(function() {
            const hrefArr = window.location.href.split('/');
            const name = hrefArr[hrefArr.length-1];
            $('.menu a[href=\''+name+'\']').addClass('active');
        });
    </script>
</head>
<header>
	<a href="toMain" target="_blank">汽车租赁系统首页</a>

	<div class="dropdown float-right">
		<button class="btn  btn-sm  dropdown-toggle" type="button"
			id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false">
			<svg width="20" height="1em" viewBox="0 0 16 16"
				class="bi bi-emoji-smile-fill rounded-circle" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
					d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zM4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM10 8c.552 0 1-.672 1-1.5S10.552 5 10 5s-1 .672-1 1.5S9.448 8 10 8z" />
                    </svg>
			<!--可以使用图片,大小20,class='rounded-circle'-->
			<c:if test="${admin != null }">
						 欢迎管理员：${admin.username }
						</c:if>

			<c:if test="${employee != null  }">
						 欢迎工作人员：${employee.name }
						</c:if>
	
			<c:if test="${user != null  }">
						 欢迎审批人员：${user.realName }
						</c:if>
		</button>
		<div class="dropdown-menu dropdown-menu-right"
			aria-labelledby="dropdownMenu2">
			<!-- <a class="dropdown-item" href="">修改密码</a> --> <a class="dropdown-item"
				href="toLoginOutAct">退出登录</a>
		</div>
	</div>



		<!-- <a class="float-right mr-2" href="http://www.qadmin.net"
					target="_blank">Qadmin官网</a> <a class="float-right mr-2"
					href="http://docs.qadmin.net/" target="_blank">开发文档</a>  -->

</header>
