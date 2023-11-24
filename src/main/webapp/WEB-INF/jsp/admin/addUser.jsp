<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<c:import url="../layout/adminHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%@ page import="util.common"%>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-laptop"></i> Add User</h1>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">User Lists</a></li>
            <li class="breadcrumb-item active">Add user</li>
          </ul>
          
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
	 		<div class="card1">
	        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
	            <h5 class="card-title" align="center" style="color:white; padding:12px;">Add User Form</h5>
	        </div>
	        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >

              <!-- Horizontal Form -->
              <form:form action="addUser" modelAttribute="user">
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Name</label>
                  <div class="col-sm-8">
                    <form:input path="userName" type="text" pattern="^[A-Za-z\s]+$" placeholder="Enter User Name" class="form-control" id="inputText" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
                  </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;" id="email-label">User Email</label>
                  <div class="col-sm-8">
                    <form:input path="userEmail" type="email" placeholder="Enter User Email"  id="email-field" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" onkeyup="validateEmail()" required="true"/>
                  	<span id="email-error" style="color:red; font-family: 'Font Awesome 5 Free'; font-weight: 500;"></span>
                  </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Password</label>
                  <div class="col-sm-8">
                    <form:input path="userPassword" type="password" pattern=".{5,}" title="Password must be at least 8 characters long" placeholder="Enter User Password" class="form-control" onkeyup="validatePassword()" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
                  	<span  style="color:red; font-family: 'Font Awesome 5 Free'; font-weight: 700;"></span>
                  </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Role</label>
                       <div class="col-sm-8">
	                       <form:select path="userRole" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
	                          <option value="" disabled selected>Enter Select Role</option>
	                          <option value="staff">Staff</option>
	                          <option value="Admin">Admin</option>
	                          <option value="consultant">Consultant</option>
	                       </form:select>
                       </div>
                </div>
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;" id="phone-label">User Phone Number</label>
                  <div class="col-sm-8">
                    <form:input path="userPhoneNo" id="phone-field" class="form-control" placeholder="+959123456789" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" onkeyup="validatePhone()" required="true"></form:input>
                  	<span id="phone-error" style="color:red; font-family: 'Font Awesome 5 Free'; font-weight: 500;"></span>
                  </div>
                </div> 
                <div class="row mb-3" style="padding:20px;">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Address</label>
                  <div class="col-sm-8">
                    <form:textarea path="userAddress" type="text" placeholder="Enter Address" class="form-control" id="inputText" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
                  </div>
                </div>               
                <div class="text-center">
                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Submit</button>
                  <button type="reset" value="reset" class="btn btn-secondary">Cancel</button>
                </div>
              </form:form><!-- End Horizontal Form -->

            </div>
          </div>
        </div>
        </div>
    </main>
    <jsp:include page="../layout/footer.jsp" />
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
    <script>
		function validatePassword() {
		  var passwordInput = document.getElementById("passwordInput");
		  var password = passwordInput.value;
		  
		  if (password.length < 8) {
		    passwordInput.setCustomValidity("Password must be at least 8 characters long");
		  } else {
		    passwordInput.setCustomValidity("");
		  }
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