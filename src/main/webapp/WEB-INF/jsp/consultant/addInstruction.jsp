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
<html lang="en">
  <head>
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    <link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
  </head>
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="div">
          <h1><i class="fa fa-laptop"></i> Add Instruction</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="javascript:history.back()">Instruction Lists</a></li>
          <li class="breadcrumb-item">Add Instruction</li>
        </ul>
      </div>
      <div class="row">
      <div class="col-md-8" style="margin-left:200px;">
 		<div class="card1">
        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
            <h5 class="card-title" align="center" style="color:white; padding:12px;">Add Instruction Form</h5>
        </div>
        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >

              <!-- Horizontal Form -->
              <form:form action="addInstruction" modelAttribute="instruction" id="contactForm" name="contactForm" class="contactForm">
              <form:input path="instructionId" value="${instruction.instructionId}" class="form-control" id="name" placeholder="Name" hidden="true"></form:input>
                
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Patient ID</label>  
                  <div class="col-sm-8">
                    <form:select class="form-control select2" path="appointmentId" id='appointmentId' required="true" placeholder="Select Appointment Id...">
						<option value=""></option>
						<c:forEach var="appointment" items="${appointmentList}">
							
							<form:option value="${appointment.appointmentId}"
								label="PRN-00${appointment.patientId}" />
						</c:forEach>
				</form:select> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Age</label>  
                  <div class="col-sm-8">
                    <form:input path="patientName" class="form-control" id="patientName" style="background-color:whitesmoke;" readonly="true"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Patient Name</label>  
                  <div class="col-sm-8">
                    <form:input path="gender" class="form-control" id="gender" style="background-color:whitesmoke;" readonly="true"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Gender</label>  
                  <div class="col-sm-8">
                    <form:input path="age" class="form-control" id="age" style="background-color:whitesmoke;" readonly="true"></form:input> 
                  </div>
                </div>     
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Status</label>
                  <div class="col-sm-8">
                    <form:input path="status" class="form-control" placeholder="Enter Status" style="background-color:whitesmoke;"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Instruction Date</label>
                  <div class="col-sm-8">
                    <form:input path="instructionDate" type="date" id="instructionDate" class="form-control" style="background-color:whitesmoke;" readonly="true"></form:input> 
                  </div>
                </div>
                             
                <div class="text-center">
                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Submit</button>
                  <button type="reset" value="cancel" class="btn btn-secondary"><a href="javascript:history.back()" style="text-decoration:none; color:white;">Cancel</a></button>
                </div>
              </form:form><!-- End Horizontal Form -->

            </div>
          </div>
        </div>
        </div>
      
    </main>
    <!-- Essential javascripts for application to work-->
   	<script src="<%=common.url%>/asset/js/select2.min.js"></script>
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
	<script>
    // Wait for the document to be fully loaded
    document.addEventListener("DOMContentLoaded", function() {
        // Get the voucherDate input element
        var voucherDateInput = document.getElementById("instructionDate");

        // Get the current date in the format "YYYY-MM-DD"
        var currentDate = new Date().toISOString().split("T")[0];

        // Set the current date as the value of the input element
        voucherDateInput.value = currentDate;
    });
</script>
	
     <script type="text/javascript">
      $("#submit").click(function(){
          swal({
            title: "Successful!",
            icon: "success",
            button: "Close",
});
        });
    </script>
    <script> 
          
          $(document).on("change","#appointmentId",function (e) {
        			  let optionSelected = $("#appointmentId:selected", this);
        			  let appointmentId = this.value;
        			 	 $.ajax({
        			 		 url: "AppointmentByPaitentId", 
        			 		 data:{"appointmentId":appointmentId},
        			 			type: "POST",
        			 			
        			 	 	success: function(result){
        			 	 		result=result.split("=")
        			 	 		
        			 	 		$("#patientName").val(result[0])
        			 	 		$("#gender").val(result[1])
        			 	 		$("#age").val(result[2])
        			 	 		
        			 		 }});
        	         	 
          });  
           </script>
    <script>
	$(document).ready(function(){
		 
	    // Initialize select2
	    $("#appointmentId").select2();
	    // Read selected option
	    $('#but_read').click(function(){
	        var username = $('#appointmentId option:selected').text();
	        var userid = $('#appointmentId').val();

	        $('#result').html("id : " + userid + ", name : " + username);

	    });
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