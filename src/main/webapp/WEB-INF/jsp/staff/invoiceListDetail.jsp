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
<!DOCTYPE html>
<html lang="en">
  <body class="app sidebar-mini">
    
    <main class="app-content">
      <div class="app-title">
        <div class="col-md-8">
          <h1><i class="fa fa-th-list"></i> Voucehr Detail</h1>
          <button style="margin-top:10px;" class="bg-info text-white" type="button" data-toggle="modal" data-target="#Modal"><i class="fa fa-file" aria-hidden="true">&nbsp;&nbsp;Export to excel</i></button>                    
          <!-- Modal -->
        
        </div>
        <div class="col-md-4">
          <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Consultant</li>
            <li class="breadcrumb-item active"><a href="#">Consultant Lists</a></li>
          </ul>
                                          
                  </div>
                </div>
              </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body"> 
              <div class="table-responsive">
                <table class="table table-hover table-bordered table-striped" id="sampleTable">
                  <thead>
                    <tr>
                      <th>Voucher ID</th>
                      <th>Instuction Detail ID</th>
                      <th>Service Name</th>
                      <th>Unit Price</th>
                      <th>Qty</th>
                      <th>Amount</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>

                      <td>V-001</td>
                      <td>Int-001</td>
                      <td>Consultant Fee</td>
                      <td>7000</td>
                      <td>1</td>
                      <td>7000</td>
                      
                    </tr>
                    <tr>

                      <td>V-001</td>
                      <td>Int-001</td>
                      <td>Ultrasound Fee</td>
                      <td>20000</td>
                      <td>1</td>
                      <td>20000</td>
                      
                    </tr>
                    <tr>

                      <td>V-001</td>
                      <td>Int-001</td>
                      <td>Para</td>
                      <td>700</td>
                      <td>1</td>
                      <td>700</td>
                      
                    </tr>
                    <tr>

                      <td>V-001</td>
                      <td>Int-001</td>
                      <td>Amoxicillin</td>
                      <td>1000</td>
                      <td>1</td>
                      <td>1000</td>
                      
                    </tr>
                    <tr>

                      <td>V-002</td>
                      <td>Int-002</td>
                      <td>Consultant Fee</td>
                      <td>7000</td>
                      <td>1</td>
                      <td>7000</td>
                      
                    </tr>
                    <tr>

                      <td>V-002</td>
                      <td>Int-002</td>
                      <td>OPD Service Fee</td>
                      <td>3000</td>
                      <td>1</td>
                      <td>3000</td>
                      
                    </tr>
                    <tr>

                      <td>V-002</td>
                      <td>Int-002</td>
                      <td>Para</td>
                      <td>700</td>
                      <td>1</td>
                      <td>700</td>
                      
                    </tr>
                    <tr>

                      <td>V-002</td>
                      <td>Int-002</td>
                      <td>Amoxicillin</td>
                      <td>1000</td>
                      <td>1</td>
                      <td>1000</td>
                      
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<%=common.url%>/asset/js/jquery-3.3.1.min.js"></script>
    <script src="<%=common.url%>/asset/js/popper.min.js"></script>
    <script src="<%=common.url%>/asset/js/bootstrap.min.js"></script>
    <script src="<%=common.url%>/asset/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=common.url%>/asset/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="<%=common.url%>/asset/cmd
    js/plugins/chart.js"></script>
    <!--Modal js-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%=common.url%>/asset/js/plugin/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=common.url%>/asset/js/plugin/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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
  </body>
</html>