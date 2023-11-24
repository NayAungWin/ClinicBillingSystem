<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<%@ page import="util.common"%>
<c:import url="../layout/consultantHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%
    if(session.getAttribute("adminSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Care Cure Clinic</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=common.url%>/asset/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--   	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script> -->
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
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> View Instruction Detail</h1>
        
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="instructionLists">Instruction List</a></li>
            <li class="breadcrumb-item active">View Detail</li>
          </ul>
        
        </div>
                  </div>
                </div>
              </div>
      <div class="row">

      <div class="col-md-12">
        <div class="card" style="padding:20px;">
          <div class="col-md-12">
          	<div style="float:left;">
          		<span style="color:black; font-size: 20px; font-weight: bold;">Patient Information</span>
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
          <span style="color:black; font-size: 20px; font-weight: bold;">Add Instruction</span>
          <hr>
          <div class="col-md-12" style="background-color:whitesmoke; padding: 20px;">
          	<form:form action="editInstructionDetail" modelAttribute="instruction" class="contactForm">
          <div class="col-md-5" style="font-weight: bold; float:left; text-align: center;" >
          	<form:input path="instructionDetailId" class="form-control" id="name" placeholder="Name" hidden="true"></form:input>
              <div style="float: left; padding: 8px;">
              <label for="empno" style="text-align:center;">Service Name : </label>
            </div>
              <div style="float:left; width: 60%;">
              	<div class="dropdown">
                <form:select class="form-control" path="serviceId" required="true">
                  <option value="">Select Service Name</option>
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
                    <form:input class="form-control" type="text" path="instructionId" value="Int-${instruction.instructionId}" id="instructionId"></form:input>
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
          <span style="color:black; font-size: 20px; font-weight: bold; margin-top:5px;">Instruction Detail</span>
          <hr>
          <div class="table-responsive">
              <table class="table table-hover table-bordered table-striped" id="sampleTable" style="text-align:center;">
                <thead style="background-color: #009688; color:white;">
                    <tr>
                      <th>No</th>
                      <th>Service Name</th>
                    </tr>
                </thead>
                <tbody>
                <% int index=1; %>
                    <c:forEach var="instruction" items="${instructionList}">
                    <tr>                     
                    <td>#<%=index++%></td>
                    <td>${instruction.serviceName}</td>
                      
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
    <!-- Essential javascripts for application to work-->
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=common.url%>/asset/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="<%=common.url%>/asset/cmd
    js/plugins/chart.js"></script>
    <!--Modal js-->
    <script src="https://cdn.jsdelivr.net/npm/jqu ery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%=common.url%>/asset/js/plugin/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=common.url%>/asset/js/plugin/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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
  </body>
</html>