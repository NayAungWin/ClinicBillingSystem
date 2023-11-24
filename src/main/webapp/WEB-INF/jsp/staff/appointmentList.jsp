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
	<style type="text/css">
    .toggle .button {
        background-color: #d2d2d2;
        width: 70px;
        height: 30px;
        border-radius: 30px;
        cursor: pointer;
        position: relative;
        transition: 0.2s;
    }

    .toggle .button::before {
        position: absolute;
        content: '';
        background-color: #fff;
        width: 30px;
        height: 30px;
        border-radius: 50px;
        transition: 0.2s;
    }

    .toggle input:checked + .button {
        background-color: green;
    }

    .toggle input:checked + .button::before {
        transform: translateX(40px);
    }

    .toggle input {
        display: none;
    }
</style>
</head>
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Appointment</h1>
          <button style="margin-top:10px;" id="export" class="bg-info text-white" type="button" data-toggle="modal" data-target="#Modal"><i class="fa fa-file" aria-hidden="true"> Export to excel</i></button>
          <!-- Modal -->
        <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Token Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
              	<form:form action="addAppointment" modelAttribute="appointment" method="post">
                <div class="row">
              <div class="col-md-4">
                <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Appointment Date : </label>
                </div>                
              </div>
              <div class="col-md-8">
                <div class="form-group">
                  
                    <div class="dropdown">
                    	<form:input path="appointmentDate" type="date" class="form-control" name="empno" id="appointmentDate"  style="background-color:whitesmoke;" required="true"/> 
                  	</div>
                </div>             
              </div>
              
             
              </form:form>
             	
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary"><a href="	" style="color: white;">Submit</a></button>
              </div>
            </div>
          </div>
        </div>
            </div>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="staff_home">Home</a></li>
            <li class="breadcrumb-item active">Appointment Lists</li>
          </ul>
            
            <!-- Button trigger modal -->
          <button type="button" style="margin-top:5px; float: right; margin-left: 60px; margin-bottom:-15px;" class="bg-info text-white"><i class="fa fa-plus-circle" aria-hidden="true"><a href="addAppointment" style="text-decoration:none; color:white;"> Add Appointment</a></i></button>                              
      
        </div>
	</div>
      <div class="row">
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
                <table class="table table-hover table-bordered table-striped" id="example" >
                  <thead style="background-color: #009688; color:white; align=center;">
                    <tr align="center">
                      <th>No</th>
                      <th>Patient ID</th>
                      <th>Patient Name</th>
                      <th>Gender</th>
                      <th>Age</th>
                      <th>Consultant Name</th>
                      <th>Date</th>
                      <th>Token Number</th>
                    <!--   <th>Status</th> -->
                      <th>Action</th>                    
                    </tr>
                  </thead>
                  <tbody >
                   		<% int index=1; %>
						<c:forEach var="appointment" items="${list}">
							<tr align="justify">
								<td>#<%=index++%></td>
								<td>PRN-00${appointment.patientId}</td>
								<td>${appointment.patientName}</td>
								<td>${appointment.gender}</td>
								<td>${appointment.age}</td>
								<td>${appointment.consultantName}</td>
								<td>${appointment.appointmentDate}</td>
								<td>${appointment.tokenNumber}</td>
				<!-- 				<td><div class="toggle">
                    				<input type="checkbox" id="check${appointment.appointmentId}" onchange="toggleButton('${appointment.appointmentId}')">
                    				<label for="check${appointment.appointmentId}" class="button"></label>
                				</div></td> -->
								<td> <a href="deleteAppointment/${appointment.appointmentId}" class="delete" title="Delete"><i
									class="fa fa-remove" onclick="confirmDelete(event)"> </i></a>
								<a href="printAppointment/${appointment.appointmentId}" class="print" title="Print"><i
									class="fa fa-print" > </i></a></td>
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
        $(document).ready(function() {
            var dataTable = $('#example').DataTable({
                // Additional options and configuration for DataTable
            });

            $('#export').click(function() {
                var table2excel = new Table2Excel();
                var tableElement = document.querySelector('#example');

                // Store the original page and length settings
                var originalPage = dataTable.page();
                var originalLength = dataTable.page.len();

                // Show all data in a single page
                dataTable.page.len(-1).draw('page');

                // Export data
                table2excel.export(tableElement);

                // Restore original page and length settings
                dataTable.page.len(originalLength).page(originalPage).draw('page');
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
	<script>
	    function toggleButton(appointmentId) {
	        var checkbox = document.getElementById('check' + appointmentId);
	        var button = document.querySelector('.button[for="check' + appointmentId + '"]');
	
	        if (checkbox.checked) {
	            button.style.backgroundColor = 'green';
	            //button.style.transform = 'translateX(10px)';
	        } else {
	            button.style.backgroundColor = '#d2d2d2';
	            button.style.transform = 'none';
	        }
	    }
	</script>
	<script>
	  var currentDate = new Date();
	  var minDate = currentDate.toISOString().split("T")[0];
	  
	  // Calculate the max date after two weeks
	  var maxDate = new Date();
	  maxDate.setDate(currentDate.getDate() + 7);
	  maxDate = maxDate.toISOString().split("T")[0];
	
	  document.getElementById("date").min = minDate;
	  document.getElementById("date").max = maxDate;
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
<style>

  .swal-button--delete {
    background-color: #009688 !important;
  }
</style>
</html>