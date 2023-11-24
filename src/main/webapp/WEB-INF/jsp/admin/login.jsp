<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="util.common"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Care Cure Clinic</title>
    <link rel="stylesheet" type="text/css" href="<%=common.url%>/asset/css/login_style.css">
</head>
<body>
	<section class="Form my-4 mx-5">
      <div class="container">
        <div class="row mo-gutters">
          <div class="col-lg-5">
            <img src="https://th.bing.com/th/id/OIP.ZL9oHBBtFf9Hq1THOjTp2AAAAA?pid=ImgDet&w=460&h=590&rs=1" class="img-fluid" alt="">
          </div>
          <div class="col-lg-7">
            <img style="margin-left: 100px; margin-top: 30px" src="<%=common.url%>/asset/images/clinic.png" class="logo">
            <h2 style="margin-left: 50px;  margin-top: 20px; color: #009688;">Care & Cure Clinic</h2>
            <form action="login" method="post">
              <div class="form-row">
                <div class="col-lg-7">
                  <input type="text" placeholder="Enter username" name="username" class="form-control my-3 p-4">
                </div>
              </div>
              <div class="form-row">
                <div class="col-lg-7">
                  <input type="password" placeholder="Enter your password" name="password" class="form-control my-3 p-4">
                </div>
              </div>
              <div class="form-row">
                <div class="col-lg-7">
                  <button type="submit" class="login mt-3 mb-5"><a href="home.html" style="color:white; text-decoration: none;">Login</a></button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </script>
</body>
</html>