<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<c:import url="../layout/header.jsp">
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
	<link href="<%=common.url%>/asset/css/select2.min.css" rel="stylesheet" />
  	<style>
  		.customer_container{
  			float: left;
		}
		.in_details{
		  float: left;
		}
		
		.instruction_table tr td{
		  padding: 10px;
		}
		
		.card{
		  margin: 0;
		}	
  	</style>
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header"><span class="app-header__logo">Care Cure Clinic</span>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<%=common.url%>/asset/images/user.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Instruction</p>
          <!-- <p class="app-sidebar__user-designation">Frontend Developer</p> -->
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="consultant_home"><i class="app-menu__icon fa fa-home"></i><span class="app-menu__label">Home</span></a></li>
        
        <li><a class="app-menu__item" href="consultantPatientList"><i class="fa fa-calendar fa" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Patient</span></a></li>
    
       <li><a class="app-menu__item" href="consultantAppointmentList"><i class="fa fa-calendar fa" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Appointment</span></a></li>


       <li><a class="app-menu__item" href="instructionLists"><i class="fa fa-calendar fa" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Instruction</span></a></li>

        <li><a class="app-menu__item" href="#" onclick="confirmDelete(event)"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span class="app-menu__label">Logout</span></a></li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Add Instruction Detail</h1>
        
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Consultant</li>
            <li class="breadcrumb-item active"><a href="#">Consultant Lists</a></li>
          </ul>
            
            <!-- Button trigger modal -->
          <button type="button" style="margin-top:5px; float: right; margin-left: 120px; margin-bottom:-15px;" class="bg-info text-white"><a href="instruction_detail.html" style="color:white;"> View Detail</a></button>                              
      
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog aa">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Voucher Detail Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row">
              
               <div class="col-md-4">
                <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Status : </label>
                </div>                
              </div>
              <div class="col-md-8">
                <div class="form-group">
                  <input type="text" class="form-control" name="empno" id="empno"  style="background-color:whitesmoke;"> 
                  <span id="available"></span>
                </div>                
              </div>
                                
                </div>  
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" style="background-color:indianred;">Clear</button>
                <button type="button" class="btn btn-primary" >Submit</button>
              </div>              
              </div>
              </div>  
              
            </div>
          </div>
        </div>
                  </div>
                </div>
              </div>
      <div class="row">

      <div class="col-md-12">
        <div class="card" style="padding:20px;">
        <div class="col-md-12">
          <div class="col-md-12">
          	<div style="float:left;">
          		<span style="color:red; font-size: 20px; font-weight: bold;">Patient Information</span>
          	</div>
          </div>
          
          <div class="col-md-12">
          	<div style="float:right;">
                <button type="submit" value="submit" class="btn btn-primary" >Submit</button>
          	</div>    
          </div>
        </div>
          <hr>
          <div class="customer_container">
          <c:forEach var="list" items="${list}">
            <div class="in_details" style="width: 50%; font-weight: bold;">
              <table class="instruction_table">
                <tr>
                  <td>Patient Id</td>
                  <td>:</td>
                  <td>${list.patientId}</td>
                </tr>
                <tr>
                  <td>Patient Name</td>
                  <td>:</td>
                  <td>${list.patientName}</td>
                </tr>
              </table>
            </div>
          <div class="in_details" style="width:50%; font-weight: bold;">
            <table style="float: right;" class="instruction_table">
              <tr>
                <td>Gender</td>
                <td>:</td>
                <td>${list.gender}</td>
              </tr>
              <tr>
              
                  <td>Age</td>
                  <td>:</td>
                  <td>${list.age}</td>
                </tr>
            </table>
          </div>
          </c:forEach>
        </div>
          <span style="color:red; font-size: 20px; font-weight: bold;">Add Instruction</span>
          <hr>
          <div class="col-md-12" style="background-color:whitesmoke; padding: 20px;">
          	<form:form action="addInstructionDetailByServiceName" modelAttribute="instruction" class="contactForm">
          <div class="col-md-5" style="font-weight: bold; float:left; text-align: center;" >
          	<form:input path="instructionDetailId" class="form-control" id="name" placeholder="Name" hidden="true"></form:input>
              <div style="float: left; padding: 8px;">
              <label for="empno" style="text-align:center;">Service Name : </label>
            </div>
              <div style="float:left; width: 60%;">
              	<div class="dropdown">
                <form:select id='serviceId' class="form-control select2" path="serviceId" required="true" placeholder="Select Service Name...">
                  <option value="">Select Service Name....</option>
						<c:forEach var="service" items="${serviceList}">
							
							<form:option value="${service.serviceId}"
								label="${service.serviceName}" />
						</c:forEach>
				</form:select>
                </div>
			</div>
			
              </div>
          
          <div class="col-md-5" style="font-weight: bold; float:left; text-align: center;" >
              <div style="float: left; padding: 8px;">
              <label for="empno" style="text-align:center;">Instruction Id : </label>
            </div>
              <div style="float:left; width:60%;">
                <div class="dropdown">
                    <form:input class="form-control" type="text" path="instructionId" value="${instruction.instructionId}" id="instructionId"></form:input>
                  </div>
              </div>
          </div>
          <div class="col-md-2" style="font-weight: bold; float:left; text-align: center;" >
              <div style="float: left;">
                <button type="submit" value="submit" class="btn btn-primary" ><i class="fa fa-plus"></i>Add Instruction</button>
              </div>
          </div>
          </form:form>
        </div>
          <span style="color:red; font-size: 20px; font-weight: bold;">Instruction Detail</span>
          <hr>
          <div class="table-responsive">
              <table class="table table-hover table-bordered table-striped" id="sampleTable" style="text-align:center;">
                <thead style="background-color: #009688; color:white;">
                    <tr>
                      <th>No</th>
                      <th>Service Name</th>
                      <th>Instruction ID</th>
                      <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <% int index=1; %>
                    <c:forEach var="instruction" items="${insrtuctionDetaillist}">
                    <tr>                     
                    <td>#<%=index++%></td>
                      <td>${instruction.serviceName}</td>
                      <td>${instruction.instructionId}</td>                      
                      <td><a href="editInstruction/${instruction.instructionId}" class="settings"
									title="Edit"> <i class="fa fa-edit"></i>
								</a> <a href="deleteInstruction/${instruction.instructionId}" class="delete" title="Delete"><i
									class="fa fa-remove"> </i></a></td>
                    </c:forEach>
                    </tr>
                  </tbody>
              </table>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
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
    </script><script>
	$(document).ready(function(){
		 
	    // Initialize select2
	    $("#serviceId").select2();

	 // Read selected option
	    $('#but_read').click(function(){
	        var username = $('#serviceId option:selected').text();
	        var userid = $('#selUser').val();

	        $('#result').html("id : " + userid + ", name : " + username);

	    });
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