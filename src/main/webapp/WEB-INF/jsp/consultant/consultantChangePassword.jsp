<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.java.bean.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="util.common"%>
<c:import url="../layout/consultantHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%
    if(session.getAttribute("consultantSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("consultantSession");
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
  	<link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
  </head>
  <body class="app sidebar-mini rtl">
    
    <main class="app-content">
      <div class="row user">
        <div class="col-md-5">
          <div class="profile"  style="margin-left: 30px; margin-top:20px;">
            <div class="info" style="width:400px;  border-radius:5px;">
              <img src="<%=common.url%>/asset/images/admin.jpg" alt="admin"/>
              <h3>Nay Aung Win</h3>
              <p style="font-weight:bold; font-size:25px;">Admin</p>
              <div class="iconLink" style="font-size:30px;">
              <a href="#" class="twitter" style="color:lightblue; margin-right:20px;"><i class="fa fa-twitter"></i></a>
                <a href="#" class="facebook" style="color:lightblue; margin-right:20px;"><i class="fa fa-facebook"></i></a>
                <a href="#" class="instagram" style="color:lightblue; margin-right:20px;"><i class="fa fa-instagram"></i></a>
               </div>
            </div>

                
            <div class="cover-image"></div>
          </div>
        </div>
          <div class="col-md-6">
          <div class="tab-content">
            <div class="tab-pane active" id="user-timeline">
            <div class="timeline-post" style="height:600px; border-radius:5px;">         
                       
              <div class="tab-content pt-2" style="padding:20px; font-size:15px;">

                <div class="tab-pane fade show active profile-overview" id="profile-overview" style="padding:30px;">
               
                  <h3 class="profileCard-title" align="center">Change Password</h3>
                  <form:form action="updateConsultantPassword" modelAttribute="user" method="post" id="contactForm" name="contactForm" class="contactForm">
				  <form:input path="userId" value="${user.userId}" class="form-control" id="name" hidden="true"></form:input>
                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-4 col-md-4 label" style="font-weight:bold;">Name</div>
                    <div class="col-lg-8 col-md-8">
						<form:input path="userName" class="form-control" id="name" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
					</div>
                  </div>

                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-4 col-md-4 label" style="font-weight:bold;">Email</div>
                    <div class="col-lg-8 col-md-8">
						<form:input path="userEmail" class="form-control" id="name" placeholder="Enter Name" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
					</div>
                  </div>

                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-4 col-md-4 label" style="font-weight:bold;">Current Password</div>
                    <div class="col-lg-8 col-md-8">
						<form:input path="userPassword" type="password" class="form-control" id="name" placeholder="Enter Password" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
					</div>
                  </div>

                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-4 col-md-4 label" style="font-weight:bold;">New Password</div>
                    <div class="col-lg-8 col-md-8">
						<form:input path="newPassword" type="password" class="form-control" id="name" placeholder="Enter Password" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
					</div>
                  </div>
				  
				  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-4 col-md-4 label" style="font-weight:bold;">Confirm Password</div>
                    <div class="col-lg-8 col-md-8">
						<form:input path="confirmPassword" type="password" class="form-control" id="name" placeholder="Enter Password" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
					</div>
                  </div>
                  <form:input path="userPhoneNo" class="form-control" id="name" placeholder="Enter Name" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" hidden="true"/>
				  <form:input path="userAddress" class="form-control" id="name" placeholder="Enter Name" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" hidden="true"/>
				  <div class="text-center" style="margin-top:40px;">
	                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Change Password</button>
                  </div>
                  </form:form>
                </div>

              </div><!-- End Bordered Tabs -->

            </div>
            </div>
            
          </div>
        </div>
        </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
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