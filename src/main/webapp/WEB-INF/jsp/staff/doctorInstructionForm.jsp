<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<%@ page import="util.common"%>

<%
    if(session.getAttribute("staffSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("staffSession");
%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" type="text/css" href="<%=common.url%>/asset/css/print.css">
</head>
<body>
    <div class="invoice_container">
        <div class="invoice_header">
            <div class="logo_container" style="width: 5%;">
                <img src="<%=common.url%>/asset/images/clinic.png">
            </div>
            <div style="width: 20%;">
            <h1 style="color: white; margin-top: 57px; margin-left: -350px;">Care & Cure Clinic</h1>
            </div>
            <div class="company_address">
                <h2>Care & Cure Clinic</h2>
                <p>
                    No.(56),Thakhin Phoe Hla Gyi Street,<br>
                    (43)Wards,NorthDagon,Yangon<br>
                    Phone No: +959783537796
                </p>
            </div>
        </div>
        <div class="customer_container" style="width:"70%;">
            <div>
            	
                <table>
                <c:forEach var="appointment" items="${list}">
                    <tr>
                        <td>Patient ID</td>
                        <td>:</td>
                        <td><b>PRN-${appointment.patientId}</b></td>
                    </tr>
                    <tr>
                        <td>Patient Name</td>
                        <td>:</td>
                        <td><b>${appointment.patientName}</b></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>:</td>
                        <td><b>${appointment.gender}</b></td>
                    </tr>
                    
                	</c:forEach>
                </table>
            	
            </div>
            <div class="in_details" style="width:"30%;">
            
                <table>
                <c:forEach var="appointment" items="${list}">
                    <tr>
                        <td>Age</td>
                        <td>:</td>
                        <td><b>${appointment.age}</b></td>
                    </tr>
                    
                    <tr>
                        <td>Consultant Name</td>
                        <td>:</td>
                        <td><b>${appointment.consultantName}</b></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>:</td>
                        <td><b>${appointment.address}</b></td>
                    </tr>
                   </c:forEach> 
                </table>
                
            </div>
        </div>
        <div class="instruction_container">
            <div style="width: 5%; border-right: 1.5px solid; height:400px; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">No</span>
                <hr style="border: 0.5px solid;">
            </div>
            <div style="width: 45%; border-right: 1.5px solid; height:400px; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">Instruction</span>
                <hr style="border: 0.5px solid;">
            </div>
            <div style="width: 10%; border-right: 1.5px solid; height:400px; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">Qty</span>
                <hr style="border: 0.5px solid;">
            </div>
            <div style="width: 8%; border-right: 1.5px solid; height:400px; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">M</span>
                <hr style="border: 0.5px solid;">
            </div>
            <div style="width: 8%; border-right: 1.5px solid; height:400px; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">A</span>
                <hr style="border: 0.5px solid;">
            </div>
            <div style="width: 8%; border-right: 1.5px solid; height:400px; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">N</span>
                <hr style="border: 0.5px solid;">
            </div>
            <div style="width: 15%; text-align:center;">
                <span style="font-size: 15px; font-weight: bold; ">Remark</span>
                <hr style="border: 0.5px solid;">
            </div>
        </div>
        <div class="invoice_footer">
        <button type="button" id="btnPrint" style="margin-top:5px; float: left; margin-left:10px; font-size:18px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true">&nbsp;&nbsp;Print</i></button>
                <button type="button" style="margin-top:5px; float: left; margin-left:10px; font-size:18px;" class="bg-info text-white"><i class="fa fa-home" aria-hidden="true"><a href="javascript:history.back()" style="color:white; text-decoration:none;">&nbsp;&nbsp;Back</a></i></button> 
            <div class="note">
                <h3>Transforming & Healing Presence</h3>
               
        ********************************************************************************************************************************************************************************************************************************************
            </div>
            
        </div>
    </div>
    <!-- Essential javascripts for application to work-->
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
    <!--Modal js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function () {
        $('#btnPrint').click(function () {
            $('#btnPrint').hide();
            var css = '@page { size: a4; }',
                head = document.head || document.getElementsByTagName('head')[0],
                style = document.createElement('style');
            style.type = 'text/css';
            style.media = 'print';
            if (style.styleSheet) {
                style.styleSheet.cssText = css;
            } else {
                style.appendChild(document.createTextNode(css));
            }
            head.appendChild(style);
            window.print();  
        });
    })
</script>
</body>

</html>