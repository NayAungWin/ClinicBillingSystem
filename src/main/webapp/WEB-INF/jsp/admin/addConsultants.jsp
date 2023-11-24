<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.java.bean.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="../layout/adminHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%@ page import="util.common"%>
<%
    if(session.getAttribute("adminSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="div">
          <h1><i class="fa fa-laptop"></i> Add Consultant</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="adminConsultantList">Consultant Lists</a></li>
          <li class="breadcrumb-item">Add Consultant</li>
        </ul>
      </div>
      <div class="row">
      <div class="col-md-8" style="margin-left:200px;">
 		<div class="card1">
        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
            <h5 class="card-title" align="center" style="color:white; padding:12px;">Add Consultant Form</h5>
        </div>
        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >

              <!-- Horizontal Form -->
              <form:form action="addConsultants" modelAttribute="consultant" id="contactForm" name="contactForm" class="contactForm">
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Consultant Name</label>
                  <div class="col-sm-8">
                    <form:input path="consultantName" pattern="^[A-Za-z\s]+$" placeholder="Enter Consultant Name" class="form-control" id="consultantName" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Specialist</label>
                  <div class="col-sm-8">
                    <form:input path="specialist" class="form-control" placeholder="Enter Specialist" id="specialist" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input> 
                  </div>
                </div>
                
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Date From</label>
                  <div class="col-sm-8">
                    <form:select path="dutyDateFrom" class="form-control" placeholder="Select Date" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
                              <option value="" disabled selected>Select Date</option>
                              <option value="Sunday">Sunday</option>
                              <option value="Monday">Monday</option>
                              <option value="Tuesday">Tuesday</option>
                              <option value="Wednesday">Wednesday</option>
                              <option value="Thursday">Thursday</option>
                              <option value="Friday">Friday</option>
                              <option value="Saturday">Saturday</option>
                            </form:select>
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Date To</label>
                  <div class="col-sm-8">
                    <form:select path="dutyDateTo" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
                              <option value="" disabled selected>Select Date</option>
                              <option value="Sunday">Sunday</option>
                              <option value="Monday">Monday</option>
                              <option value="Tuesday">Tuesday</option>
                              <option value="Wednesday">Wednesday</option>
                              <option value="Thursday">Thursday</option>
                              <option value="Friday">Friday</option>
                              <option value="Saturday">Saturday</option>
                            </form:select>
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Time From</label>
                       <div class="col-sm-8">
	                       <form:input path="dutyTimeFrom" type="time" class="form-control"  id="" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input>
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Time To</label>
                       <div class="col-sm-8">
	                       <form:input path="dutyTimeTo" type="time" class="form-control" id="" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input>
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Degree</label>
                  <div class="col-sm-8">
                    <form:input path="degree" class="form-control" placeholder="Enter Degree" id="degree" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;" id="email-label">Email</label>
                  <div class="col-sm-8">
                    <form:input path="email" class="form-control" type="email" placeholder="Enter Email" id="email-field" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" onkeyup="validateEmail()" required="true"></form:input> 
                  	<span id="email-error" style="color:red; font-family: 'Font Awesome 5 Free'; font-weight: 500;"></span>
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;" id="phone-label">Phone Number</label>
                  <div class="col-sm-8">
                    <form:input path="phone" id="phone-field" class="form-control" placeholder="+959123456789" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" onkeyup="validatePhone()" required="true"></form:input> 
                  	<span id="phone-error" style="color:red; font-family: 'Font Awesome 5 Free'; font-weight: 500;"></span>
                  </div>
                </div>               
                <div class="text-center">
                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Submit</button>
                  <button type="reset" value="cancel" class="btn btn-secondary">Cancel</button>
                </div>
              </form:form><!-- End Horizontal Form -->

            </div>
          </div>
        </div>
        </div>
      
    </main>
    <jsp:include page="../layout/footer.jsp" />
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

    <script type="text/javascript">
      var emailLabel = document.getElementById("email-label");
      var emailField = document.getElementById("email-field");
      var emailError = document.getElementById("email-error");
      
      function validateEmail(){
    	  
    	  if(!emailField.value.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){
    		  emailError.innerHTML = "Please enter a valid email";
    		  emailField.style.borderBottomColor ="red";
    		  return false;
    	  }
    	  emailError.innerHTML="";
    	  emailField.style.borderBottomColor ="green";
    	  return true;
      }
    </script>
    <script type="text/javascript">
      var phoneLabel = document.getElementById("phone-label");
      var phoneField = document.getElementById("phone-field");
      var phoneError = document.getElementById("phone-error");
      
      function validatePhone(){
    	  
    	  if(!phoneField.value.match(/^\+?95[1-9]\d{9}$/)){
    		  phoneError.innerHTML = "Please enter a valid phone number";
    		  phoneField.style.borderBottomColor ="red";
    		  return false;
    	  }
    	  phoneError.innerHTML="";
    	  phoneField.style.borderBottomColor ="green";
    	  return true;
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