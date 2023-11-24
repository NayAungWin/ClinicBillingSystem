<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<c:import url="../layout/staffHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%@ page import="util.common"%>
<%
    if(session.getAttribute("staffSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("staffSession");
%>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-laptop"></i> Add Patient</h1>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="javascript:history.back()">Patient Lists</a></li>
            <li class="breadcrumb-item active">Add Patient</li>
          </ul>
        
       </div>
       </div>
      
      <div class="row">
 		<div class="col-md-8" style="margin-left:200px;">
 		<div class="card1">
        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
            <h5 class="card-title" align="center" style="color:white; padding:12px;">Add Patient Form</h5>
        <div class="row">
	        <c:if test="${resultFlag==0}">
	        	<div class="col-md-12">
				  <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:right; font-size:bold;">
	                   ${message}
	
	                  <img src="<%=common.url%>/asset/images/false.png">
	              </div>
	            </div>
	         </c:if>
         </div>
        </div>
        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >
       
              <!-- Horizontal Form -->
              <form:form action="addPatients" modelAttribute="patient" >
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Patient Name</label>
                  <div class="col-sm-8">
                    <form:input path="patientName" pattern="^[A-Za-z\s]+$" class="form-control" id="name" placeholder="Enter Name" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Gender</label>
                  <div class="col-sm-8">
                    <form:select path="gender" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
                                <option value="" disabled selected>Select Gender</option>
                                <form:option value="Male">Male</form:option>
                                <form:option value="Female">Female</form:option>
                            </form:select> 
                  </div>
                </div>
                
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Age</label>
                  <div class="col-sm-8">
                    <form:input path="age" placeholder="Enter age" pattern="[1-9][0-9]?|1[0-2][0-9]|130" title="Please enter a valid age (1-130)" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"/>
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;" id="phone-label">Phone Number</label>
                  <div class="col-sm-8">
                    <form:input path="phoneNumber" type="phone" class="form-control" id="phone-field" placeholder="+959123456789" onkeyup="validatePhone()" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:input>
                  	<span id="phone-error" style="color:red;"></span>
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Blood</label>
                       <div class="col-sm-8">
	                       <form:select path="blood" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
                                <option value="" disabled selected>Select Blood</option>
                                <option>A</option>
                                <option>AB</option>	
                                <option>B</option>
                                <option>O</option>
                            </form:select>
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Diabete</label>
                       <div class="col-sm-8">
	                       <form:select path="diabete" class="form-control" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
                                <option value="" disabled selected>Select Diabete</option>
                                <option>Yes</option>
                                <option>No</option>
                            </form:select>
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Address</label>
                  <div class="col-sm-8">
                    <form:textarea path="address" placeholder="Enter address" class="form-control" name="empno" cols="30" rows="3" id="consultantName"  style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true"></form:textarea>
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
    <script type="text/javascript"> {	
      $("#submit").click(function(){
          swal({
            title: "Successful!",
            icon: "success",
            button: "Close",
});
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