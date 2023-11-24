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
          <h1><i class="fa fa-th-list"></i> Voucher</h1>
          <button type="button"  data-toggle="modal" data-target="#exampleModal" style="margin-top:10px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true"> Voucher Detail</i></button>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Consultant</li>
            <li class="breadcrumb-item active"><a href="#">Consultant Lists</a></li>
          </ul>                             
		
		 <!-- Button trigger modal -->
          <button style="margin-top:5px; float: right; margin-left: 70px; margin-bottom:-15px;" class="bg-info text-white"><i class="fa fa-plus-circle" aria-hidden="true"><a href="addVoucher" style="text-decoration:none; color:white;"> Add Voucher</a></i></button>                              
      
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog aa">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Voucher Detail</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
              <form:form action="addVoucherDetail" modelAttribute="voucher"  method="post">
                <div class="row">

               <div class="col-md-4">
                <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Voucher ID : </label>
                </div>                
              </div>
              <div class="col-md-8">
                <div class="form-group">
                  <div class="dropdown">
		              <form:select class="form-control" path="voucherId" id="voucherId" required="true">
		                  		<option value=""></option>
									<c:forEach var="voucher" items="${voucherlist}">
									
								<form:option value="${voucher.voucherId}"
										label="V-00${voucher.voucherId}">
								</form:option>
								</c:forEach>
						</form:select>
                  </div>
                </div>                
              </div>  
              <div class="col-md-4">
                <div class="form-group" style="margin-top:10px;">
                  <label for="empno">Patient ID : </label>
                </div>                
              </div>
              <div class="col-md-8">
                <div class="form-group">
                  <div class="dropdown">
		              <form:select class="form-control" path="patientId" id="patientId" required="true">
		                  		<option value=""></option>
									<c:forEach var="appointment" items="${list}">
									
								<form:option value="${appointment.patientId}"
										label="PRN-00${appointment.patientId}">
								</form:option>
								</c:forEach>
						</form:select>
                  </div>
                </div>                
              </div>
                                   
              </div>
              <div class="modal-footer">
		             <button type="button" class="btn btn-secondary" style="background-color:indianred;">Clear</button>
		             <button type="submit" value="submit" class="btn btn-primary">Submit</button>
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
                </div>
              </div>
      </div>
      <div class="row">
        <c:if test="${resultFlag==0}">
        	<div class="col-md-12">
			  <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:right; font-size:bold;">
                   ${message}
                  <img src="<%=common.url%>/asset/images/false.png">
              </div>
            </div>
         </c:if>
         <c:if test="${resultFlag==1}">
         	<div class="col-md-12">
			  <div class="alert alert-success alert-dismissible fade show" role="alert" style="text-align:right; font-size:bold;">
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
                      <th>Patient Id</th>
                      <th>Patient name</th>
                      <th>Voucher Number</th>
                      <th>Voucher Date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% int index=1; %>
						<c:forEach var="voucher" items="${vlist}">
							<tr align="center">
								<td>#<%=index++%></td>
								<td>PRN-00${voucher.patientId}</td>
								<td>${voucher.patientName}</td>
								<td>Inv-00${voucher.voucherId}</td>
								<td>${voucher.voucherDate}</td>
								<td>
								<a href="d/${voucher.voucherId}" class="settings"
										title="Add Detail" > <i class="fa fa-plus"></i></a>&nbsp;
								<a href="viewInvoiceDetail/${voucher.voucherId}" class="settings"
										title="View"> <i class="fa fa-eye"></i></a>&nbsp;
								<a href="editConsultants/${consultant.consultantId}" class="settings"
									title="Edit"> <i class="fa fa-edit"></i>&nbsp;
								</a> <a href="deletConsultant/${consultant.consultantId}" class="delete" title="Delete"><i
									class="fa fa-remove"> </i></a>&nbsp;
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
        			 		 url: "voucherByPatientId", 
        			 		 data:{"patientId":patientId},
        			 			type: "POST",
        			 			
        			 	 	success: function(result){
        			 	 		result=result.split("=")
        			 	 		
        			 	 		$("#patientName").val(result[0]);
        			 	 		$("#gender").val(result[1]);
        			 	 		$("#age").val(result[2]);
        			 	 		$("#appointmentId").val(result[3]);
        			 	 		$("#instructionId").val(result[4]);
        			 	 		$("#serviceId").val(result[5]);
        			 		 }});        			 	 
        	         	 
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