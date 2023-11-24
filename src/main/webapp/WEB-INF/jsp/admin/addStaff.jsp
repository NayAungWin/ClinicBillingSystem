<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<%@ page import="util.common"%>
<%
    if(session.getAttribute("adminSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html lang="en">
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
  </head>
  <body class="app sidebar-mini">
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
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<%=common.url%>/asset/images/user.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Admin</p>
          <!-- <p class="app-sidebar__user-designation">Frontend Developer</p> -->
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="admin_home"><i class="app-menu__icon fa fa-home"></i><span class="app-menu__label">Home</span></a></li>
        <li><a class="app-menu__item" href="patient-lists.html"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Patient</span></a></li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="fa fa-user-md" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Consultant</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="add-consultant.html"><i class="icon fa fa-circle-o"></i> Add Consultant</a></li>
            <li><a class="treeview-item" href="consultant-lists.html" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Consultant Lists</a></li>
          </ul>
        </li>

        <li><a class="app-menu__item" href="appointment.html"><i class="fa fa-calendar fa" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Appointment</span></a></li>

        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Services</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            
            <li><a class="treeview-item" href="addService"><i class="icon fa fa-circle-o"></i> Service</a></li>
          </ul>
          <ul class="treeview-menu">
            
            <li><a class="treeview-item" href="addServiceType"><i class="icon fa fa-circle-o"></i> Service Type</a></li>
          </ul>
        </li>
        
        <li><a class="app-menu__item" href="docs.html"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Logout</span></a></li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Services</h1>
          <button style="margin-top:10px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true"> Export to excel</i></button>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Consultant</li>
            <li class="breadcrumb-item active"><a href="#">Consultant Lists</a></li>
          </ul>
            
            <!-- Button trigger modal -->
          <button type="button" data-toggle="modal" data-target="#exampleModal" style="margin-top:5px; float: right; margin-left: 60px; margin-bottom:-15px;" class="bg-info text-white"><i class="fa fa-plus-circle" aria-hidden="true"> Add Service Type</i></button>                              
      
        <!-- Modal -->
        
                </div>
              </div>
      
      <div class="row">
        <c:if test="${resultFlag==0}">
			  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                   ${message}
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="background-size: 50%;" style="margin-left:250px;"></button>
              </div>
         </c:if>
         <c:if test="${resultFlag==1}">
			  <div class="alert alert-success alert-dismissible fade show" role="alert" align="center">
                   ${message}
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="background-size: 50%;"></button>
              </div>
         </c:if>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >
              <h5 class="card-title" align="center">Add User Form</h5>

              <!-- Horizontal Form -->
              <form:form action="addUser" modelAttribute="user">
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Staff Name</label>
                  <div class="col-sm-8">
                    <form:input path="userName" type="text" class="form-control" id="inputText" style="background-color:whitesmoke;" required="true"/>
                  </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Staff Email</label>
                  <div class="col-sm-8">
                    <form:input path="userEmail" type="email" class="form-control" id="inputText" style="background-color:whitesmoke;" required="true"/>
                  </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Staff Password</label>
                  <div class="col-sm-8">
                    <form:input path="userPassword" type="password" class="form-control" id="inputText" style="background-color:whitesmoke;" required="true"/>
                  </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Role</label>
                       <div class="col-sm-8">
	                       <form:select path="userRole" class="form-control" style="background-color:whitesmoke;" required="true">
	                          <option value="" disabled selected></option>
	                          <option value="staff">Staff</option>
	                          <option value="consultant">Consultant</option>
	                          <option value="mainAdmin">Main Admin</option>
	                          <option value="subAdmin">Sub Admin</option>
	                       </form:select>
                       </div>
                </div>                
                <div class="text-center">
                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Submit</button>
                  <button type="reset" value="reset" class="btn btn-secondary">Reset</button>
                </div>
              </form:form><!-- End Horizontal Form -->

            </div>
          </div>
        </div>
        </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=common.url%>/asset/js/plugin/pace.min.js"></script>
    <!--Modal js-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- The javascript plugin to display page loading on top-->
    <script src="../js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%=common.url%>/asset/js/plugin/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=common.url%>/asset/js/plugin/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-72504830-1', 'auto');
        ga('send', 'pageview');
      }
    </script>
  </body>
</html>