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
        <div class="div">
          <h1><i class="fa fa-laptop"></i> Add Voucher</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="voucherLists">Voucher Lists</a></li>
          <li class="breadcrumb-item">Add Voucher</li>
        </ul>
      </div>
      <div class="row">
      <div class="col-md-8" style="margin-left:200px;">
 		<div class="card1">
        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
            <h5 class="card-title" align="center" style="color:white; padding:12px;">Add Voucher Form</h5>
        </div>
        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >

              <!-- Horizontal Form -->
              <form:form action="/viewDoctorInstruction/addVoucher" modelAttribute="voucher" id="contactForm" name="contactForm" class="contactForm">
             
                <div class="row mb-5">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Voucher Date</label>
                  <div class="col-sm-8">
                    <form:input path="voucherDate" class="form-control" id='voucherDate' type="date" style="background-color:whitesmoke;"></form:input> 
                  </div>
                 </div>
                 <div class="row mb-5">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Voucher Number</label>
                  <div class="col-sm-8">
                    <input class="form-control" type="text" id='latestVoucherNumber' style="background-color:whitesmoke;" readonly="true"/>
                  </div>
                 </div>
                 <div class="row mb-5">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Voucher Number</label>
                  <div class="col-sm-8">
                    <form:input path="voucherNumber" class="form-control" type="text" style="background-color:whitesmoke;"></form:input> 
                  </div>
                 </div>
                               
                <div class="text-center">
                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Submit</button>
                  <button type="reset" value="cancel" class="btn btn-secondary"><a href="voucherLists" style="text-decoration:none; color:white;">Cancel</a></button>
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