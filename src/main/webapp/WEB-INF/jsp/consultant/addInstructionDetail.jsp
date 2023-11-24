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
<link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
<style>
.customer_container {
	float: left;
}

.in_details {
	float: left;
}

.instruction_table tr td {
	padding: 10px;
}

.card {
	margin: 0;
}
</style>
</head>
<body class="app sidebar-mini">
	
	<main class="app-content">
		<div class="app-title">
			<div class="col-md-8">
				<h1>
					<i class="fa fa-th-list"></i> Add Instruction Detail
				</h1>

			</div>
			<div class="col-md-4">
				<ul class="app-breadcrumb breadcrumb side">
					<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
					<li class="breadcrumb-item">Consultant</li>
					<li class="breadcrumb-item active"><a href="#">Consultant
							Lists</a></li>
				</ul>


			</div>
		</div>
		<div class="row">

      <div class="col-md-12">
        <div class="card" style="padding:20px;">
        <div class="col-md-12">
          <div class="col-md-12">
          	<div style="float:left;">
          		<span style="color:black; font-size: 20px; font-weight: bold;">Patient Information</span>
          	</div>
          </div>
          
          <div class="col-md-12">
          	<div style="float:right;">
                <button type="submit" value="submit" class="btn btn-primary" ><a href="instructionLists" style="text-decoration:none; color:white;">Submit</a></button>
          	</div>    
          </div>
        </div>
          <hr>
          <div class="customer_container">
            <div class="in_details" style="width: 50%; font-weight: bold;">
              <table class="instruction_table">
                <tr>
                  <td>Patient Id</td>
                  <td>:</td>
                  <td>PRN-00${patientInfo.patientId}</td>
                </tr>
                <tr>
                  <td>Patient Name</td>
                  <td>:</td>
                  <td>${patientInfo.patientName}</td>
                </tr>
              </table>
            </div>
          <div class="in_details" style="width:50%; font-weight: bold;">
            <table style="float: right;" class="instruction_table">
              <tr>
                <td>Gender</td>
                <td>:</td>
                <td>${patientInfo.gender}</td>
              </tr>
              <tr>
              
                  <td>Age</td>
                  <td>:</td>
                  <td>${patientInfo.age}</td>

                </tr>
            </table>
          </div>
        </div>
        <span style="color:black; font-size: 20px; font-weight: bold;">Add Instruction</span>
          <hr>
          <div class="col-md-12" style="font-size:bold;">
	          <c:if test="${resultFlag==0}">
					  <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:right; font-size:bold;">
		                   ${message}
		                  <img src="<%=common.url%>/asset/images/false.png">
		              </div>
		         </c:if> 
	      </div>
          <div class="col-md-12" style="background-color:whitesmoke; padding: 20px;">
          <form:form action="addInstructionDetailByServiceName" modelAttribute="instruction">
          <form:input path="instructionDetailId" class="form-control" id="instructionDetailId" placeholder="Name" hidden="true"></form:input>      
          <div class="col-md-5" style="font-weight: bold; float:left; text-align: center;" >
              <div style="float: left; padding: 8px;">
              <label for="empno" style="text-align:center;">Service Name : </label>
            </div>
              <div style="float:left; width: 60%;">
              	<div class="dropdown">
                <form:select id='serviceId' class="form-control select2" path="serviceId"  style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 550;" required="true">
                		 <form:option value=""></form:option>
						<c:forEach var="service" items="${serviceList}">
							<form:option value="${service.serviceId}">
									${service.serviceName}
							</form:option>
						</c:forEach>
				</form:select>

                </div>
			</div>
				    
         </div>
          
          <div class="col-md-5" style="font-weight: bold; float:left; text-align: center;" >
              <div style="float: left; padding: 5px;">
                             	
              </div>
              <div style="float: left;">
                	<form:input path="instructionId" class="form-control" id="instructionId" value="${patientInfo.instructionId}" placeholder="Name" hidden="true"></form:input>
                	<form:input path="appointmentDate" class="form-control" id="appointmentDate" value="${patientInfo.appointmentDate}" placeholder="Name" hidden="true"></form:input>
                	
              </div>
          </div>
           
          <div class="col-md-2" style="font-weight: bold; float:left; text-align: center;" >
              <div style="float: left;">
                <button type="submit" value="submit" class="btn btn-primary" ><i class="fa fa-plus"></i>Add Instruction</button>
              </div>
          </div>
          </form:form> 
		  </div>
		  <div class="col-md-12">
		  	<span style="color:black; font-size: 20px; font-weight: bold;">Instruction Detail</span>		  
         </div>
          <hr>
		<div class="table-responsive">
			<table class="table table-hover table-bordered table-striped"
				id="sampleTable" style="text-align: center;">
				<thead style="background-color: #009688; color: white;">
					<tr>
						<th>No</th>
						<th>Service Name</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<% int index=1; %>
					<c:forEach var="instruction" items="${insrtuctionDetaillist}">
						<tr>
							<td>#<%=index++%></td>
							<td>${instruction.serviceName}</td>
							<td> <a
								href="deleteInstructionDetail/${instruction.instructionDetailId}"
								class="delete" title="Delete" onclick="confirmDelete(event)"><i class="fa fa-remove"> </i></a>
							</td>
					</c:forEach>

				</tbody>
			</table>
		</div>


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
		<script>
	$(document).ready(function(){
		 
	    // Initialize select2
	    $("#serviceId").select2();
	    // Read selected option
	    $('#but_read').click(function(){
	        var username = $('#selUser option:selected').text();
	        var userid = $('#selUser').val();

	        $('#result').html("id : " + userid + ", name : " + username);

	    });
	});
	</script>
		<script>
		  document.getElementById('serviceId').addEventListener('change', function() {
		    var selectedServiceId = this.value;
		    document.getElementById('selectedServiceId').value = selectedServiceId;
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
	<script>
  function confirmDelete(event) {
    event.preventDefault();

    swal({
      title: "Are you sure?",
      icon: "warning",
      buttons: {
        cancel: {
          text: "Cancel",
          value: null,
          visible: true,
          className: "",
          closeModal: true,
        },
        delete: {
          text: "Delete",
          value: true,
          visible: true,
          className: "Delete-button",
          closeModal: true,
        },
      },
      dangerMode: true,
    }).then((willDelete) => {
      if (willDelete) {
        // Perform the delete action
        window.location.href = event.target.parentElement.href;
      }
    });
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