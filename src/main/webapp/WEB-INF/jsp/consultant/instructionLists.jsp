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
  <head>
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    <link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
  </head>
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Instruction Lists</h1>
          <button type="button" data-toggle="modal" data-target="#exampleModal" style="margin-top:10px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true"> Instruction Detail</i></button>
        
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="consultant_home">Home</a></li>
            <li class="breadcrumb-item active">Instruction Lists</li>
          </ul>
            
            <!-- Button trigger modal -->
          <button id="modal" style="margin-top:5px; float: right; margin-left: 150px; margin-bottom:-15px;" class="bg-info text-white"><i class="fa fa-plus-circle" aria-hidden="true"><a href="addInstruction" style="text-decoration:none; color:white;"> Add Instruction</a></i></button>                              
      
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog aa">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Instruction Detail Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
              <form:form action="addInstructionDetail" modelAttribute="instruction"  method="post">
                <div class="row">
              
               <div class="col-md-4">
                <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Patient ID : </label>
                </div>                
              </div>
              <div class="col-md-8">
                <div class="form-group">
                  <div class="dropdown">
		               <form:select class="form-control select2" path="appointmentId" id='patientId' required="true" style="width:100%;">
		                  <option value=""></option>
							<c:forEach var="instruction" items="${instructionList}">
								<form:option value="${instruction.appointmentId}"
									label="PRN-00${instruction.patientId}" />
							</c:forEach>
						</form:select>
                  </div>
                </div>
                </div>
                <form:input path="appointmentId" class="form-control" id="appointmentId" style="background-color:whitesmoke;" hidden="true"></form:input>
              <div class="col-md-4">
              <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Patient Name : </label>
                </div>
              </div>
              <div class="col-md-8">
                <div class="form-group">
                     <form:input path="patientName" class="form-control" id="patientName" style="background-color:whitesmoke;"></form:input>
                </div>                
              </div>
              <div class="col-md-4">
              <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Gender : </label>
                </div>
              </div>
              <div class="col-md-8">
                <div class="form-group">
                     <form:input path="gender" class="form-control" id="gender" style="background-color:whitesmoke;"></form:input>
                </div>                
              </div>
              <div class="col-md-4">
              <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Age : </label>
                </div>
              </div>
              <div class="col-md-8">
                <div class="form-group">
                     <form:input path="age" class="form-control" id="age" style="background-color:whitesmoke;"></form:input>
                </div>                
              </div> 
              <form:input path="instructionId" class="form-control" id="instructionId" style="background-color:whitesmoke;" hidden="true"></form:input>
              <form:input path="appointmentDate" class="form-control" id="appointmentDate" style="background-color:whitesmoke;" hidden="true"></form:input>    
              </div>                
              <div class="modal-footer">
		             <button type="button" class="btn btn-secondary" style="background-color:indianred;">Clear</button>
		             <button type="submit" value="submit"  class="btn btn-primary" style="text-decoration:none; color:white;">Submit</button>
              </div>  
                </form:form>             
                </div>
             
              </div>  
              
            </div>
          </div>
        </div>
                  </div>
                </div>
              </div>
      <div class="row">
      <c:if test="${resultFlag==0}">
        	<div class="col-md-12">
			  <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:right;">
                   ${message}
                  <img src="<%=common.url%>/asset/images/false.png">
              </div>
            </div>
         </c:if>
         <c:if test="${resultFlag==1}">
         	<div class="col-md-12">
			  <div class="alert alert-success alert-dismissible fade show" role="alert" style="text-align:right; font-weight:bold;">
                   ${message}
                  <img src="<%=common.url%>/asset/images/true.png">
              </div>
            </div>
         </c:if>
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body"> 
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-striped" id="sampleTable">
                  <thead style="background-color: #009688; color:white; align=center;">
                    <tr align="center">
                      <th>#</th>
                      <th>Patient ID</th>
                      <th>Patient Name</th>
                      <th>Status</th>
                      <th>Date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% int index=1; %>
						<c:forEach var="instruction" items="${list}">
							<tr align="center">
								<td>#<%=index++%></td>
								<td>PRN-00${instruction.patientId}</td>
								<td>${instruction.patientName}</td>
								<td>${instruction.status}</td>
								<td>${instruction.instructionDate}</td>
								<td>
									<a href="viewInstructionDetail/${instruction.instructionId}" class="settings"
										title="View"> <i class="fa fa-eye"></i></a>&nbsp;
									<a href="editInstruction/${instruction.instructionId}" class="settings"
										title="Edit"> <i class="fa fa-edit"></i></a>&nbsp;
									<a href="deleteInstruction/${instruction.instructionId}" class="delete" title="Delete"><i
										class="fa fa-remove"> </i></a>
								</td>
							</tr>
						</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />
    <script src="<%=common.url%>/asset/js/select2.min.js"></script>
    
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <script src="<%=common.url%>/asset/js/table2excel.js">
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=common.url%>/asset/js/plugins/pace.min.js"></script>
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
        			  let appointmentId = this.value;
        			  
        			 	 $.ajax({
        			 		 url: "instructionByAppointmentId", 
        			 		 data:{"appointmentId":appointmentId },
        			 			type: "POST",
        			 			
        			 	 	success: function(result){
        			 	 		result=result.split("=")
        			 	 		
        			 	 		$("#appointmentId").val(result[0]);
        			 	 		$("#patientName").val(result[1]);
        			 	 		$("#gender").val(result[2]);
        			 	 		$("#age").val(result[3]);
          			 	 		$("#appointmentDate").val(result[4]);
        			 	 		$("#instructionId").val(result[5]);
        			 		 }});
        	         	 
          }); 
           </script>
    <script>
	$(document).ready(function(){
		$("#modal").click(function() {
            $("#exampleModal").css("display", "block");
        });

        // Close the modal when the close button is clicked
        $(".close").click(function() {
            $("#exampleModal").css("display", "none");
        });
        
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