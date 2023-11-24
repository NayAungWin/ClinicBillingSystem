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
          <h1><i class="fa fa-th-list"></i> View Doctor's Instruction</h1>
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="javascript:history.back()">Invoice List</a></li>
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
          <div class="col-md-12">
          	<div style="float:left;">
          		<span style="color:black; font-size: 20px; font-weight: bold;">Patient Information</span>
          	</div>
          </div>
          
          <div class="col-md-12">
          <form:form action="addInvoices" modelAttribute="voucher" method="post">
          <form:input path="instructionId" class="form-control" value="${instruction.instructionId}" id="instructionId" hidden="true"></form:input>
          <form:input path="voucherDate" type="date" class="form-control" name="voucherDate" id="voucherDate" hidden="true"></form:input>
<!--          <form:input path="patientId" type="date" class="form-control" value="${instruction.patientId}" hidden="true"></form:input> --> 
          	<div style="float:right;">               
          		       
          	</div>
          </form:form>	   
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
          <span style="color:black; font-size: 20px; font-weight: bold; margin-top:5px;">Instruction Detail</span>
          <hr>
          <div class="table-responsive">
              <table class="table table-hover table-bordered table-striped" id="sampleTable" style="text-align:center;">
                <thead style="background-color: #009688; color:white;">
                    <tr>
                      <th>No</th>
                      <th>Service Name</th>
                      <th>Service Price</th>
                      <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                <% int index=1; %>
<!--                     <c:forEach var="instruction" items="${instructionList}">
                    <tr>                     
                    <td>#<%=index++%></td>
                    <td>${instruction.serviceName}</td>
                      
                    </c:forEach>
                    
                    </tr> -->
                    <c:forEach var="voucher" items="${voucherDetailList}">
                    <tr>           
                      <td width="5%"> <input type="checkbox" name="serviceId" value="${voucher.serviceId}" checked="checked" hidden="true"/>
                      #<%=index++%></td>
                      <td width="40%">${voucher.serviceName}</td>
                      <td width="40%">${voucher.servicePrice}</td>
                      <td width="40%">${voucher.quantity}</td>
                    </tr>              	        
                   </c:forEach>
                  </tbody>
              </table>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
    <jsp:include page="../layout/footer.jsp" />
    <script src="<%=common.url%>/asset/js/select2.min.js"></script>
    
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <script src="<%=common.url%>/asset/js/table2excel.js">
    <script>
      $('.bs-component [data-toggle="popover"]').popover();
      $('.bs-component [data-toggle="tooltip"]').tooltip();
    </script>
    <script type="text/javascript">
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
    // Wait for the document to be fully loaded
    document.addEventListener("DOMContentLoaded", function() {
        // Get the voucherDate input element
        var voucherDateInput = document.getElementById("voucherDate");

        // Get the current date in the format "YYYY-MM-DD"
        var currentDate = new Date().toISOString().split("T")[0];

        // Set the current date as the value of the input element
        voucherDateInput.value = currentDate;
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
           $(document).on("change","#voucherDate",function (e) {
 			  let optionSelected = $("#voucherDate:selected", this);
 			  let voucherDate = this.value;
 			 	 $.ajax({
 			 		 url: "voucherNoByDate", 
 			 		 data:{"voucherDate":voucherDate},
 			 		type: "POST",
 			 		success: function(result) {
 	 			 	      result = (result);
 	 			 	      $("#latestVoucherNumber").val(result);
 	 			 	    },
 	 			 	    error: function(error) {
 	 			 	      console.log(error);
 	 			 	    }
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