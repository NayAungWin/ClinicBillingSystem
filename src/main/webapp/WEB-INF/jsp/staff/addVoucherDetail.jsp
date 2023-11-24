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
          <h1><i class="fa fa-th-list"></i> Add Voucher Detail</h1>
       	  <button type="button" data-toggle="modal" data-target="#exampleModal" style="margin-top:10px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true"> Submit</i></button>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="voucherLists">Voucher Lists</a></li>
            <li class="breadcrumb-item active">Add Voucher Detail</li>
          </ul>
            
            <!-- Button trigger modal -->
          <button type="button" style="margin-top:5px; float: right; margin-left: 120px; margin-bottom:-15px;" class="bg-info text-white"><a href="instruction_detail.html" style="color:white;"> View Detail</a></button>                              
      
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog aa">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Print Voucher</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row">
              
               <div class="col-md-4">
                <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Voucher ID : </label>
                </div>                
              </div>
              <div class="col-md-8">
                <div class="form-group">
                   
                </div>                
              </div>
                                
                </div>  
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" style="background-color:indianred;">Clear</button>
                <button type="button" class="btn btn-primary" ><a href="invoice_print" style="text-decoration:none; color:white;">Submit</a></button>
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
          		<span style="color:black; font-size: 20px; font-weight: bold;">Patient Information</span>
          	</div>
          </div>
          
          <div class="col-md-12">
          	<div style="float:right;">
                <button type="submit" value="submit" class="btn btn-primary" ><a href="javascript:history.back()" style="text-decoration:none; color:white;">Submit</a></button>
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
                  <td>PRN-00${list.patientId}</td>
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
          <hr>     
<!--           <div class="col-md-12" style="background-color:whitesmoke; padding:20px;">
          <form:form action="addVoucherDetailByClinicFee" modelAttribute="voucher">
          <form:input class="form-control" path="instructionId" value="patientInfo.instructionId" id="instructionId" placeholder="Name" hidden="true"></form:input>
          <form:input class="form-control" path="voucherDetailId" id="voucherDetailId" placeholder="Name" hidden="true"></form:input> 
          <div class="col-md-8">
          	<div style="font-weight: bold; float:left; text-align: center; margin-top:10px;">
          		<label for="empno" style="text-align:center;">Clinic Fee Name: </label>
          	</div>
          	<div style="float:left; width: 60%; margin-left:15px; margin-top:8px;">
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
          <div class="col-md-12">
          	<div style="float:right; margin-left:50px;">
                <button type="submit" value="submit" class="btn btn-primary" ><i class="fa fa-plus-circle"><span style="font-weight:bold; fonr-size:25px; margin-left:5px;">Add</span></i></button>
          	</div>    
          </div>
          </form:form>
        </div>  -->
        <form:form action="invoice_print" modelAttribute="serviceList" method="post">
          <button type="submit" value="submit" class="btn btn-primary" style="float:right; margin-bottom:10px;">Create Invoice</button>
          <div class="table-responsive">
              <table class="table table-hover table-bordered table-striped" id="sampleTable">
                <thead style="background-color: #009688; color:white;">
                    <tr>
                      <th>No</th>
                      <th>Service Name</th>
                      <th>Unit Price</th>
                      <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                
                <% int index=1; %>
					<input type="text" name="voucherId" value="${voucherId}" hidden="true"/> 
					<input type="text" name="pIdForPrint" value="${pIdForPrint}" hidden="true"/>   
                	<c:forEach var="appointment" items="${appointmentList}">
                    <tr>           
                      <td width="5%"> <input type="checkbox" name="serviceId" value="${appointment.serviceId}" checked="checked" hidden="true"/>
                      #<%=index++%></td>
                      <td width="40%">${appointment.serviceName}</td>
                      <td align="center" width="20%">${appointment.servicePrice}
                      </td>
                      <td width="10%">
                      <input type="number" name="quantity"/>
                      </td>
                    </tr>              	        
                   </c:forEach>
               
                  </tbody>
              </table>
             </div>

             
          </form:form>
          
       
          </div>
        </div>
        </div>
      </div>
    </div>
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