<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.java.bean.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="util.common"%>
<c:import url="../layout/staffHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%
    if(session.getAttribute("staffSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("staffSession");
%>
<!DOCTYPE html>
<html lang="en">
	
  <body class="app sidebar-mini rtl">
    
    <main class="app-content">
      <div class="row user">
        <div class="col-md-5">
          <div class="profile"  style="margin-left: 30px; margin-top:20px;">
            <div class="info" style="width:400px;  border-radius:5px;">
              <img src="<%=common.url%>/asset/images/admin.jpg" alt="admin"/>
              <h4>${user.userName}</h4>
              <p style="font-weight:bold; font-size:20px;">${user.userRole}</p>
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
               
                  <h3 class="profileCard-title" align="center">Edit Profile</h3>
				  <form:form action="updatePassword" modelAttribute="user" method="post" id="contactForm" name="contactForm" class="contactForm">
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
            </div>
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
  <script>
  function confirmLogout(event) {
    event.preventDefault();

    swal({
      title: "Are you sure?",
      icon: "warning",
      buttons: {
        cancel: {
          text: "No",
          value: null,
          visible: true,
          className: "",
          closeModal: true,
        },
        delete: {
          text: "Yes",
          value: true,
          visible: true,
          className: "Yes-button",
          closeModal: true,
        },
      },
      dangerMode: true,
    }).then((willYes) => {
      if (willYes) {
        // Perform the delete action
        window.location.href = "/Clinic_Billing_System/signout";
      }
    });
  }
</script>
<style>

  .swal-button--delete {
    background-color: #009688 !important;
  }
</style>
</html>