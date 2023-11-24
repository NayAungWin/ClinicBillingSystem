<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="util.common"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Care Cure Clinic</title>
<link rel="stylesheet" type="text/css"
	href="<%=common.url%>/asset/css/login_style.css">

</head>
<body>
	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row mo-gutters">
				<div class="col-lg-5">
					<img src="<%=common.url%>/asset/images/loginDoctor.jpg"
						class="img-fluid" alt="" style="margin-top: 70px;">
				</div>
				<div class="col-lg-7">
					<img style="margin-left: 100px; margin-top: 30px"
						src="<%=common.url%>/asset/images/clinic.png" class="logo">
					<h2 style="margin-left: 50px; margin-top: 20px; color: #009688;">Care
						& Cure Clinic</h2>
					<form:form method="post" action="validateUser"
						modelAttribute="user">
						<div class="form-row">
							<c:if test="${resultFlag==0}">
								<div class="col-lg-7">
									<div class="alert alert-danger alert-dismissible fade show"
										role="alert">
										${message} <img src="<%=common.url%>/asset/images/false.png">
									</div>
								</div>
							</c:if>
							<c:if test="${resultFlag==1}">
								<div class="col-lg-7">
									<div class="alert alert-success alert-dismissible fade show"
										role="alert">
										${message} <img src="<%=common.url%>/asset/images/true.png">
									</div>
								</div>
							</c:if>						
							<div class="col-lg-7">
 									<form:input path="userEmail" type="email"
									style="font-family: 'Font Awesome 5 Free'; font-weight: 700;"
									placeholder="Enter your Email" id="email-field" name="useremail"
									class="form-control my-3 p-4" onkeyup="validateEmail()" required="true"/>
									<span id="email-error" style="color:red;"></span> 	
							</div>
							
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<form:input path="userPassword" type="password" style="font-family: 'Font Awesome 5 Free'; font-weight: 700;"
									placeholder="Enter your password" name="password"
									class="form-control my-3 p-4" id="myInput" required="true"/>
								<span class="eye" onclick="myFunction()"> <i id="hide1"
									class="fa fa-eye"></i> <i id="hide2" class="fa fa-eye-slash"></i>
								</span>
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<form:select path="userRole" class="form-control"
									style="background-color:whitesmoke; font-family: 'Font Awesome 5 Free'; font-weight: 700;" required="true">
									<option value="null">Select Role</option>
									<option value="staff">Staff</option>
									<option value="consultant">Consultant</option>
									<option value="Admin">Admin</option>
								</form:select>
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<button type="submit" value="Submit" class="login mt-3 mb-5" style="font-size:18px;">Login</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../layout/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>

	<script>
		function myFunction() {
			var x = document.getElementById("myInput");
			var y = document.getElementById("hide1");
			var z = document.getElementById("hide2");

			if (x.type === 'password') {
				x.type = "text";
				y.style.block = "block";
				z.style.display = "none";
			} else {
				x.type = "password";
				y.style.display = "none";
				z.style.display = "block";
			}
		}
	</script>
	<script type="text/javascript">
      var emailLabel = document.getElementById("email-label");
      var emailField = document.getElementById("email-field");
      var emailError = document.getElementById("email-error");
      
      function validateEmail(){
    	  
    	  if(!emailField.value.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){
    		  emailError.innerHTML = "Please enter a valid email";
    		  emailField.style.borderBottomColor ="red";
    		  return false;
    	  }
    	  emailError.innerHTML="";
    	  emailField.style.borderBottomColor ="green";
    	  return true;
      }
    </script>
</body>
</html>