<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<c:import url="../layout/consultantHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%@ page import="util.common"%>
<%
    if(session.getAttribute("consultantSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("consultantSession");
%>
<!DOCTYPE html>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-home" aria-hidden="true"></i>Home</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Admin</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-4">
          <div class="widget-small primary coloured-icon"><a href="consultantPatientList" style="text-decoration:none;"><i class="icon fa fa-users fa-3x"></i></a>
            <div class="info">
              <h4>Patient</h4>
              <% int patientCount=(int)session.getAttribute("patientCount"); %>
				<p><b>${patientCount}</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4" style="float:right;">
          <div class="widget-small warning coloured-icon"><a href="consultantAppointmentList" style="text-decoration:none;"><i class="icon fa fa-calendar fa-3x"></i></a>
            <div class="info">
              <h4>Appointment</h4>
              <% int appointmentCount=(int)session.getAttribute("appointmentCount"); %>
				<p><b>${appointmentCount}</b></p>
            </div>
          </div>
        </div>
      </div>
      
    </main>
    <jsp:include page="../layout/footer.jsp" />
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-72504830-1', 'auto');
        ga('send', 'pageview');
      }
    </script>
    <script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
  var navbarItems = document.querySelectorAll('.app-menu .app-menu__item');
  
  navbarItems.forEach(function(item) {
    item.addEventListener("click", function(event) {
      event.preventDefault();
      var selectedItem = event.target;
      var nextPageUrl = selectedItem.href + "?selectedItem=" + selectedItem.innerText;
      window.location.href = nextPageUrl;
    });
  });
  
  var currentUrlParams = new URLSearchParams(window.location.search);
  var selectedItemName = currentUrlParams.get("selectedItem");
  
  if (selectedItemName) {
    navbarItems.forEach(function(item) {
      if (item.innerText === selectedItemName) {
        item.classList.add("active");
      } else {
        item.classList.remove("active");
      }
    });
  }
});

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