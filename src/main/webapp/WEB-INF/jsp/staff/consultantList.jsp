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
        <div>
          <h1><i class="fa fa-th-list"></i> Consultant Lists</h1>
          <button style="margin-top:10px;" id="export" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true"> Export to excel</i></button>
        </div>
        <div class="col-md-4">
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item active"><a href="#">Consultant Lists</a></li>
        </ul>
      </div>
      </div>
      <div class="row">
      <c:if test="${resultFlag==0}">
        	<div class="col-md-12">
			  <div class="alert alert-danger alert-dismissible fade show" role="alert" style="text-align:right;">
                   ${message}
                  <img src="<%=common.url%>/asset/images/false.png">
              </div>
            </div>
         </c:if>
         <c:if test="${resultFlag==1}">
         	<div class="col-md-12">
			  <div class="alert alert-success alert-dismissible fade show" role="alert" style="text-align:right; font-weight:bold;">
                   ${message}
                  <img src="<%=common.url%>/asset/images/true.png">
              </div>
            </div>
         </c:if>
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body"> 
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-striped" id="example">
				
                  <thead style="background-color: #009688; color:white; align=center;">
                    <tr align="center">
                      <th>No</th>
                      <th>Name</th>
                      <th>Date</th>
                      <th>Time</th>
                      <th>Specialist</th>
                      <th>Email</th>
                      <th>PhoneNumber</th>
                      <th>Degree</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% int index=1; %>
						<c:forEach var="consultant" items="${list}">
							<tr align="justify">
								<td>#<%=index++%></td>
								<td width="13%">${consultant.consultantName }</td>
								<td width="12%">${consultant.dutyDateFrom} - ${consultant.dutyDateTo }</td>
								<td width="10%">${consultant.dutyTimeFrom} - ${consultant.dutyTimeTo }</td>
								<td width="12%">${consultant.specialist }</td>
								<td>${consultant.email }</td>
								<td>${consultant.phone }</td>
								<td>${consultant.degree }</td>
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
        $(document).ready(function() {
            var dataTable = $('#example').DataTable({
                // Additional options and configuration for DataTable
            });

            $('#export').click(function() {
                var table2excel = new Table2Excel();
                var tableElement = document.querySelector('#example');

                // Store the original page and length settings
                var originalPage = dataTable.page();
                var originalLength = dataTable.page.len();

                // Show all data in a single page
                dataTable.page.len(-1).draw('page');

                // Export data
                table2excel.export(tableElement);

                // Restore original page and length settings
                dataTable.page.len(originalLength).page(originalPage).draw('page');
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