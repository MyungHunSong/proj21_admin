<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content ="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${contextPath}/resources/admin/dist/css/style.min.css" rel="stylesheet">
</head>
<body>
	<!-- ============================================================== -->
 	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader" >
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	
	<!-- ============================================================== -->
 	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" style="background-color: #1f262d;">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5">
		<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header" data-logobg="skin5" >
			<!-- This is for the sidebar toggle which is visible on mobile only -->
			<a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
			<i class="ti-menu ti-close"></i>
			</a>
			<!-- Logo -->
			<a class="navbar-brand" href="${contextPath}/main">
			<!-- Logo icon -->
			<b class="logo-icon p-l-10">
			<!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
				<!-- Dark Logo icon -->
				<img src="https://img.icons8.com/color/48/000000/shopaholic.png" alt="homepage"
				style="display: inline-block; width: 100%; height: 60px; object-fit: revert; border-radius: 5px;"
				class="light-logo" >
			</b>
			</a>
			<a class="topbartoggler d-block d-md-none waves-effect waves-light"
				href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			</a>
		</div>

		<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5" >
			<ul class="navbar-nav float-left mr-auto">
				<li class="nav-item d-none d-md-block">
				<a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar">
				<i class="mdi mdi-menu font-24"></i>
				</a>
				</li>
			</ul>
			<ul class="navbar-nav float-right"></ul>
		</div>
		</nav>
		</header>
  
		<aside class="left-sidebar" data-sidebarbg="skin5">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav" class="p-t-30">
					<li class="sidebar-item"><a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"  aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">?????? </span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> ?????? ?????? </span></a></li>
							<li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> ?????? ?????? ?????? </span></a></li>
							<li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> ?????? ?????? </span></a></li>
						</ul>
					</li>
					<li class="sidebar-item"><a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">?????? </span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> ?????? ?????? </span></a></li>
							<li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> ?????? ?????? </span></a></li>
							<li class="sidebar-item"><a href="#" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> ??????/?????? ?????? </span></a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
		</aside>
	</div>	
</body>
</html>