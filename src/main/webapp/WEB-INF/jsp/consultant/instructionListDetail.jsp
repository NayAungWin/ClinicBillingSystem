 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.java.bean.*"%>
<c:import url="../layout/consultantHeader.jsp">
	<c:param name="title" value="Clinic Billing System" />
</c:import>
<%@ page import="util.common"%>
<%
    if(session.getAttribute("consultantSession")== null){
    	response.sendRedirect("signout");
    }
    User user=(User) session.getAttribute("consultantSession");
%>
<!DOCTYPE html>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Instruction Detail</h1>
          <button style="margin-top:10px;" class="bg-info text-white"><i class="fa fa-file" aria-hidden="true"> Export to excel</i></button>
        
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item active"><a href="#">Instruction Detail Lists</a></li>
          </ul>
                                          
      
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog aa">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Instruction Detail</h5>
                
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
          <div class="tile">
            <div class="tile-body"> 
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-striped" id="sampleTable">
                  <thead style="background-color: #009688; color:white; align=center;">
                    <tr align="center">
                      <th>#</th>
                      <th>Service Name</th>
                      <th>Quantity</th>
                      <th>Instruction Id</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% int index=1; %>
						<c:forEach var="instruction" items="${list}">
							<tr align="center">
								<td>#<%=index++%></td>
								<td>Int-${instruction.instructionId}</td>
								<td>${instruction.status}</td>
								<td><a href="editInstruction/${instruction.instructionId}" class="settings"
									title="Edit"> <i class="fa fa-edit"></i>
								</a> <a href="deleteInstruction/${instruction.instructionId}" class="delete" title="Delete"><i
									class="fa fa-remove"> </i></a></td>
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
</html>