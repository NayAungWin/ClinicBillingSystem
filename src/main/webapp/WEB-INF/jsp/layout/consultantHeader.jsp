<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="util.common"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Care Cure Clinic</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=common.url%>/asset/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	<link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
  </head>
<body>
	<!-- Navbar-->
    <header class="app-header"><span class="app-header__logo">Care Cure Clinic</span>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
          	<li><a class="dropdown-item" href="consultant_profile"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="editConsultantProfile"><i class="fa fa-pencil-square" aria-hidden="true"></i> Edit Profile</a></li>
            <li><a class="dropdown-item" href="consultantChangePassword"><i class="fa fa-unlock-alt" aria-hidden="true" style="font-size:18px;"></i>Change Password</a></li>           
          	<li><a class="dropdown-item" href="signout"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>   
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<%=common.url%>/asset/images/user.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Consultant</p>
        </div>
      </div>
      <nav>
      <ul class="app-menu">
        <li><a class="app-menu__item" href="consultant_home" ><i class="app-menu__icon fa fa-home" style="margin-right:10px;"></i>Home</a></li>
        
        <li><a class="app-menu__item" href="consultantPatientList" ><i class="fa fa-users" aria-hidden="true" style="margin-right:20px;"></i>Patient</a></li>
    
       <li><a class="app-menu__item" href="consultantAppointmentList"><i class="fa fa fa-calendar-check-o" aria-hidden="true" style="margin-right:20px;"></i>Appointment</a></li>


       <li><a class="app-menu__item" href="instructionLists"><i class="fa fa-plus-circle fa" aria-hidden="true" style="margin-right:20px;"></i>Instruction</a></li>

        <li><a class="app-menu__item" href="#" onclick="confirmLogout(event)"><i class="fa fa-sign-out" aria-hidden="true" style="margin-right:20px;"></i>Logout</a></li>
      </ul>
      </nav>
    </aside>
</body>
</html>