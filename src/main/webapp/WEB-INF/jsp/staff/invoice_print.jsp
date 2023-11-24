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
    User user=(User) session.getAttribute("adminSession");
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
            <div class="logo_container" style="width: 12%;">
                <img src="<%=common.url%>/asset/images/clinic.png">
            </div>
            <div style="width: 75%;">
            <h1 style="color: whitesmoke; margin-top: 57px;">Care & Cure Clinic</h1>
            </div>
            <div class="company_address" >
                <h2>Care & Cure Clinic</h2>
                <p>
                    No.(56),Thakhin Phoe Hla Gyi Street,<br>
                    (43)Wards,NorthDagon,Yangon<br>
                    Phone No: +959783537796
                </p>
            </div>
        </div>
        <div class="container">
            <div>
                <h1 class="in_head">INVOICE</h1>
            </div>
        </div>
        <!-- </div> -->
        <div class="customer_container">
            <div>

                 <table>
                    <tr>
                        <td>Invoice ID</td>
                        <td>:</td>
                        <td><b>Inv-000001</b></td>
                    </tr>
                    <tr>
                        <td>Patient ID</td>
                        <td>:</td>
                        <td><b>PRN-00${patientInfo.patientId}</b></td>
                    </tr>
                    <tr>
                        <td>Patient Name</td>
                        <td>:</td>
                        <td><b>${patientInfo.patientName}</b></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>:</td>
                        <td><b>${patientInfo.gender}</b></td>
                    </tr>
                </table> 
            </div>
            <div class="in_details">
                
                <table style="margin-top:20px;">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Age</td>
                        <td>:</td>
                        <td><b>43</b></td>
                    </tr>
                    <tr>
                        <td>Consultant Name</td>
                        <td>:</td>
                        <td><b>Dr.U Maung Maung</b></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>:</td>
                        <td><b>No.42,Bahan Street,Yangon</b></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="product_container">
            <table class="item_table" border="1" cellspacing="0">
                <tr>
                    <th>Service Name</th>
                    <th>Unit Price</th>
                    <th>Qty</th>
                    <th>Amount</th>
                </tr>
				<c:forEach var="voucherDetail" items="${voucherDetailList}">
					<tr>
						<td>${voucherDetail.serviceName}</td>
						<td>${voucherDetail.servicePrice }</td>
						<td>${voucherDetail.quantity}</td>
						<td>${voucherDetail.servicePrice * voucherDetail.quantity}</td>
					</tr>
					<c:set var="total" value="${total + (voucherDetail.servicePrice * voucherDetail.quantity)}" />
				</c:forEach>
				<tr>
                    <th colspan="3" align="center">Total Amount</th>
                    <th>${total}</th>
                </tr>
            </table>

        </div>
        <div class="invoice_footer_amount" align="center">
                <table class="amount_table"   cellspacing="0">
                    <tr>
                        <td>Amount</td>
                        <td>: <b>${total}</b></td>
                    </tr>
                    <tr>
                        <td>Discount</td>
                        <td>: <b>0.00</b></td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>: <b>${total}</b></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td>: <b>${total}</b></td>
                    </tr>
                </table>
            </div>
        <div class="invoice_footer">
            <div class="note">
                <h3>Transforming & Healing Presence</h3>
                
                <br><br>
               
                <button type="button" id="btnPrint" style="margin-top:5px; float: left; margin-left:10px; font-size:18px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true">&nbsp;&nbsp;Print</i></button>
                <button type="button" style="margin-top:5px; float: left; margin-left:10px; font-size:18px;" class="bg-info text-white"><i class="fa fa-home" aria-hidden="true"><a href="javascript:history.back()" style="color:white; text-decoration:none;">&nbsp;&nbsp;Back</a></i></button>
        **********************************************************************************************************************************************************************************************************************************************************************************
            </div>
            
        </div>
    </div>
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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