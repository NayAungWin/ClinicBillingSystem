<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<c:import url="../layout/adminHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%@ page import="util.common"%>
<%
    if(session.getAttribute("adminSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="div">
          <h1><i class="fa fa-edit"></i> Edit User</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="serviceLists">User Lists</a></li>
          <li class="breadcrumb-item"><a href="addServices">Edit User</a></li>
        </ul>
      </div>
      <div class="row">
      <div class="col-md-8" style="margin-left:200px;">
 		<div class="card1">
        <div class="card-body1" style="background-color:#009688; height:50px; margin-bottom:5px; border-radius:5px;">
            <h5 class="card-title" align="center" style="color:white; padding:12px;">Edit User Form</h5>
        </div>
        </div>
        </div>
        <div class="col-md-8" style="margin-left:200px;">
            <div class="card">
            <div class="card-body" >

              <!-- Horizontal Form -->
              <form:form action="/Clinic_Billing_System/editsaveUser" modelAttribute="user">
                <div class="row mb-5">
                <form:input path="userId" value="${user.userId}" class="form-control" id="name" placeholder="Name" hidden="true"></form:input>
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Name</label>
                  <div class="col-sm-8">
                    <form:input path="userName" value="${user.userName}" class="form-control" id="userName" style="background-color:whitesmoke;"></form:input> 
                  </div>
                 </div>
                <div class="row mb-5">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Email</label>  
                  <div class="col-sm-8">
                    <form:input path="userEmail" value="${user.userEmail}" class="form-control" id="userEmail" style="background-color:whitesmoke;"></form:input>  
                  </div>
                </div>
                <div class="row mb-5">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">Service Price</label>
                  <div class="col-sm-8">
                    <form:input path="userPassword" class="form-control" id="userPassword" style="background-color:whitesmoke;"></form:input> 
                  </div>
                </div>
                <div class="row mb-5">
                  <label for="inputEmail3" class="col-sm-4 col-form-label" style="font-weight: bold; text-align: center;">User Role</label>
                  <div class="col-sm-8">
                    <form:select path="userRole" class="form-control" style="background-color:whitesmoke;"> 
                         <form:option check="true" value="${user.userRole}"></form:option>
                              <option value="staff">Staff</option>
	                          <option value="Admin">Admin</option>
	                          <option value="subAdmin">Consultant</option>
                    </form:select>
                  </div>
                </div>              
                <div class="text-center">
                  <button type="submit" value="submit" class="btn btn-primary" style="margin-right:10px;">Submit</button>
                  <button type="reset" value="cancel" class="btn btn-secondary"><a href="userLists" style="text-decoration:none; color:white;">Cancel</a></button>
                </div>
              </form:form><!-- End Horizontal Form -->

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
