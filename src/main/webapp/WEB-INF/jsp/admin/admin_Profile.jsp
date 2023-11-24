<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.java.bean.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="util.common"%>
<c:import url="../layout/adminHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%
    if(session.getAttribute("adminSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html lang="en">
	<header class="app-header"><span class="app-header__logo">Care Cure Clinic</span>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
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
        <li><a class="app-menu__item" href="admin_home"><i class="app-menu__icon fa fa-home" style="margin-right:10px;"></i>Home</a></li>
        <li><a class="app-menu__item" href="adminPatientList"><i class="app-menu__icon fa fa-user" aria-hidden="true" style="margin-right:10px;"></i>Patient</a></li>
        
        <li><a class="app-menu__item" href="adminConsultantList"><i class="app-menu__icon fa fa-user-md" aria-hidden="true" style="margin-right:10px;"></i>Consultant</a></li>

        <li><a class="app-menu__item" href="adminAppointmentList"><i class="app-menu__icon fa fa-calendar-check-o" aria-hidden="true" style="margin-right:10px;"></i>Appointment</a></li>
        
        <li><a class="app-menu__item" href="adminServiceList"><i class="app-menu__icon fa fa-plus-circle" aria-hidden="true" style="margin-right:10px;"></i>Services</a></li>
        
        <li><a class="app-menu__item" href="adminServiceTypeList"><i class="app-menu__icon fa fa-plus-square" aria-hidden="true" style="margin-right:10px;"></i>Service Type</a></li>
        
        <li><a class="app-menu__item" href="adminVoucherLists"><i class="app-menu__icon fa fa-list-alt" aria-hidden="true" style="margin-right:10px;"></i>Invoice</a></li>
        
        <li><a class="app-menu__item" href="userLists"><i class="app-menu__icon fa fa-users fa" aria-hidden="true" style="margin-right:10px;"></i>User</a></li>
        
        <li><a class="app-menu__item" href="#" onclick="confirmLogout(event)"><i class="app-menu__icon fa fa-sign-out" aria-hidden="true" style="margin-right:10px;"></i>Logout</a></li>
      </ul>
    </aside>
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
                       
              <div class="tab-content pt-2" style="padding:20px; font-size:17px;">

                <div class="tab-pane fade show active profile-overview" id="profile-overview" style="padding:20px;">
				<c:if test="${resultFlag==0}">
		        	<div class="col-md-12">
					  <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:right; font-weight:bold;">
		                   ${message}
		                  <img src="<%=common.url%>/asset/images/false.png">
		              </div>
		            </div>
		         </c:if>
		         <c:if test="${resultFlag==1}">
		         	<div class="col-md-12">
					  <div class="alert alert-success alert-dismissible fade show" role="alert" style="text-align:right; font-weight:bold; font-weight:bold;">
		                   ${message}
		                  <img src="<%=common.url%>/asset/images/true.png">
		              </div>
		            </div>
		         </c:if>	               
                  <h4 class="profileCard-title" align="center">Profile Details</h4>

                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-5 col-md-5 label" style="font-weight:bold;">Name</div>
                    <div class="col-lg-7 col-md-7">${user.userName}</div>
                  </div>

                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-5 col-md-5 label" style="font-weight:bold;">Email</div>
                    <div class="col-lg-7 col-md-7">${user.userEmail}</div>
                  </div>                  

                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-5 col-md-5 label" style="font-weight:bold;">Role</div>
                    <div class="col-lg-7 col-md-7">${user.userRole}</div>
                  </div>
				  
				  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-5 col-md-5 label" style="font-weight:bold;">Phone No</div>
                    <div class="col-lg-7 col-md-7">${user.userPhoneNo}</div>
                  </div>
                  
                  <div class="row" style="margin-top:40px;">
                    <div class="col-lg-5 col-md-5 label" style="font-weight:bold;">Address</div>
                    <div class="col-lg-7 col-md-7">${user.userAddress}</div>
                  </div>
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