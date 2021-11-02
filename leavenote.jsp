<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function ext()
{
	
    var fileInput = document.getElementById('file');
    var filePath = fileInput.value;
    var allowedExtensions = /(\.pdf)$/i;
    if(!allowedExtensions.exec(filePath)){
        alert('Please upload file having extensions .pdf only.');
        fileInput.value = '';
        return false;
    }else{
    	return true;
    }

	}

</script>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<%

String typ=(String)session.getAttribute("typ");
if( session.isNew() || typ!="employee")
	{
	PrintWriter ps=response.getWriter();
	
	ps.println("<head><meta http-equiv='refresh' content='3;URL=login.jsp'></head>");
	ps.println("<h2><p style='color:red;'>please login...</p></h2>");
	ps.println("redirecting......");
	}else{
		 ServletContext cn=getServletContext();
		 String name=(String)cn.getAttribute("name");
		
%>
<body background="image/Background.jpg">
<fieldset class="field_set">
  <br>
<div class="div_header"><br>
<h1>Employee Salary Management</h1>
<div align="left" style="margin-right: 1%"><p><strong>Welcome <%=name%>!<span style="float: right;"> Log-out? <a href="logout">Click Here!</strong></p></a></span></div>

</fieldset></body><br>
<div class="div">
<ul>
  <li><a href="ehome.jsp">Home</a></li>
  <li><a class="active" href="#leave_note">Leave note</a></li>
  <li><a href="checksalary.jsp">Check salary</a></li>
  <li><a href="#about">About</a></li>
</ul>
<div style="margin-top:40px">
<center><h2>Leave Note</h2></center>
 </div>
 
 
 <form method="post" action="note" enctype="multipart/form-data">
 <table align="center">
 <tr>
	<th>Reason</th>
	<th><input type="text" name="reason" class="input"></th>
 </tr>
 <tr>
	<th>Details</th>
	<th><textarea rows="4" cols="21" name="details" class="input"></textarea></th>
 </tr>
 <tr>
<th></th>
 <th>File:<input type="file" id="file" name="file" style="margin-left:50px" onchange="return ext()"></th>
 <th></th>
 </tr>
 
 <tr>
<th></th>
 <th><button  class="button" type="submit">SUBMIT</button></th>
 <th></th>
 </tr>

 </table>
  </form>
 



</div>
</body>

<%} %>



</html>