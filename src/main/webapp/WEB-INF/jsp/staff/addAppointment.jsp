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
<!DOCTYPE html>
<html lang="en">
  <head>
  	<link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
  </head>
  <body class="app sidebar-mini">
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Add Appointment</h1>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="patientLists">Appointment Lists</a></li>
            <li class="breadcrumb-item active">Add Appointment</li>
          </ul>
        
       </div>
       </div>
      
      <div class="row">
 		<div class="col-md-8" style="margin-left:200px;">
 		<div class="card1">
        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
            <h5 class="card-title" align="center" style="color:white; padding:12px;">Add Appointment Form</h5>
        </div>
        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >
       
              <!-- Horizontal Form -->
              <form:form action="addAppointment" modelAttribute="appointment" >
              	<div class="row mb-4">
              		<label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Patient ID</label>
              		<div class="col-sm-8">
                    	<div class="dropdown" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;">
		                    <form:select class="form-control select2" path="patientId" id='patientId' style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true">
		                  		<option value=""></option>
									<c:forEach var="patient" items="${patientList}">
									
								<form:option value="${patient.patientId}"
										label="PRN-00${patient.patientId}" />
								</c:forEach>
							</form:select>
                  		</div> 
                  </div>
              	</div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Patient Name</label>
                  <div class="col-sm-8">
                    <form:input path="patientName" class="form-control" id="patientName" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true" readonly="true"></form:input> 
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Gender</label>
                  <div class="col-sm-8">
                    <form:input path="gender" class="form-control" name="empno" id="gender"  style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true" readonly="true"/> 
                  </div>
                </div>
                
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Age</label>
                  <div class="col-sm-8">
                    <form:input path="age" class="form-control" id="age" name="empno" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true" readonly="true"/>
                  	<span id="available"></span>
                  </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Consultant ID</label>
                       <div class="col-sm-8">
	                       <div class="dropdown" style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;">
		                        <form:select class="form-control select2" path="consultantId" id='consultantId' style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true">
		                  		<option value=""></option>
									<c:forEach var="consultant" items="${consultantList}">
									
								<form:option value="${consultant.consultantId}"
										label="C-00${consultant.consultantId}" />
								</c:forEach>
								</form:select>
                  </div>
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Consultant Name</label>
                       <div class="col-sm-8">
	                       <form:input path="consultantName" class="form-control" name="empno" id="consultantName"  style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true"/> 
                      	   <span id="available"></span>
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Date</label>
                       <div class="col-sm-8">
	                       <form:input path="appointmentDate" type="date" class="form-control" name="empno" id="appointmentDate"  style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 600;" required="true"/> 
                       </div>
                </div>
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Latest Token Number</label>
                       <div class="col-sm-8">
	                       <input type="text" class="form-control" name="empno" id="lastestTokenNumber" style="background-color:whitesmoke;" readonly="true"/> 
                       </div>
                </div>       
                <div class="row mb-4">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Token Number</label>
                       <div class="col-sm-8">
	                       <form:input path="tokenNumber" type="text" class="form-control" name="empno" id="tokenNumber" style="background-color:whitesmoke;" required="true"/> 
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
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <script src="<%=common.url%>/asset/js/table2excel.js">
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=common.url%>/asset/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="<%=common.url%>/asset/cmd
    js/plugins/chart.js"></script>
    <script src="<%=common.url%>/asset/js/select2.min.js"></script>
    <!-- Page specific javascripts-->
    <script>
      $('.bs-component [data-toggle="popover"]').popover();
      $('.bs-component [data-toggle="tooltip"]').tooltip();
    </script>
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
      $("#submit").click(function(){
          swal({
            title: "Successful!",
            icon: "success",
            button: "Close",
});
        });
    </script>
    <script> 
          
          $(document).on("change","#patientId",function (e) {
        			  let optionSelected = $("#patientId:selected", this);
        			  let patientId = this.value;
        			 	 $.ajax({
        			 		 url: "addAppointments", 
        			 		 data:{"patientId":patientId},
        			 			type: "POST",
        			 			
        			 	 	success: function(result){
        			 	 		result=result.split("=")
        			 	 		
        			 	 		$("#patientName").val(result[0])
        			 	 		$("#gender").val(result[1])
        			 	 		$("#age").val(result[2])
        			 	 		
        			 		 }});
        	         	 
          });  
      	
          $(document).on("change","#consultantId",function (e) {
			  let optionSelected = $("#consultantId:selected", this);
			  let consultantId = this.value;
			 	 $.ajax({
			 		 url: "addAppointments_1", 
			 		 data:{"consultantId":consultantId},
			 			type: "POST",
                     
			 	 	success: function(result){
			 	 		result=(result)
			 	 		
			 	 		$("#consultantName").val(result)
			 	 		
			 		 }});
	         	 
  });
          $(document).on("change","#appointmentId",function (e) {
			  let optionSelected = $("#appointmentId:selected", this);
			  let appointmentId = this.value;
			 	 $.ajax({
			 		 url: "appointmentId", 
			 		 data:{"appointmentId":appointmentId},
			 			type: "POST",
                     
			 	 	success: function(result){
			 	 		result=(result)
			 	 		
			 	 		$("#appointmentId").val(result)
			 	 		
			 		 }});
	         	 
  		});
          
           </script>
            <script>
			    $(document).on("change", "#appointmentDate, #consultantId", function (e) {
			        let appointmentDate = $("#appointmentDate").val();
			        let consultantId = $("#consultantId").val();
			
			        $.ajax({
			            url: "tokenByAppointDate",
			            data: { "appointmentDate": appointmentDate, "consultantId": consultantId },
			            type: "POST",
			            success: function (result) {
			                result = (result);
			                $("#lastestTokenNumber").val(result);
			            },
			            error: function (error) {
			                console.log(error);
			            }
			        });
			    });
			</script>
      <script>
			$(document).ready(function(){
				 
			    // Initialize select2
			    $("#patientId").select2();
			    // Read selected option
			    $('#but_read').click(function(){
			        var username = $('#selUser option:selected').text();
			        var userid = $('#selUser').val();
		
			        $('#result').html("id : " + userid + ", name : " + username);
		
			    });
			});
			
			$(document).ready(function(){
				 
			    // Initialize select2
			    $("#consultantId").select2();
			    // Read selected option
			    $('#but_read').click(function(){
			        var username = $('#selUser option:selected').text();
			        var userid = $('#selUser').val();
		
			        $('#result').html("id : " + userid + ", name : " + username);
		
			    });
			});
	</script>
	<script>
	  var currentDate = new Date();
	  var minDate = currentDate.toISOString().split("T")[0];
	  
	  // Calculate the max date after two weeks
	  var maxDate = new Date();
	  maxDate.setDate(currentDate.getDate() + 7);
	  maxDate = maxDate.toISOString().split("T")[0];
	
	  document.getElementById("appointmentDate").min = minDate;
	  document.getElementById("appointmentDate").max = maxDate;
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