<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/css2.css">
</head>

<body background="image/Background.jpg">

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
<center>
<fieldset class="fadeInDown" style="background: transparent; border:1px solid gray;
    border-radius: 20px 20px 20px 20px;box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
    ">
    <br>
<h1 class="fadeIn first" style="font-family: Raleway sans-serif; color: black;">
    Employee Salary Management
</h1>
  <div class="fadeIn first" align="left" style="margin-right: 1%"><p><strong>Welcome <%=name%>!<span style="float: right;"> Log-out? <a href="logout"><span style="color: black;">Click Here!</strong></p></a></span></div>
</div>
</fieldset>
</center>
</body><br>
<div class="div">
<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="leavenote.jsp">Leave note</a></li>
  <li><a href="checksalary.jsp">Check salary</a></li>
  <li><a href="about.jsp">About</a></li>
</ul>
<div style="margin-top:40px">
<center><h2>Working Hours</h2>
 </div>
 <table align="center">
 <form method="post" action="work">
 <tr>
	<th>Add salary</th>
	<th><div class="input-icon"><input type="text" name="money" class="input" ><i>Rs.</i></div></th>
 </tr>
 <tr>
	<th>Details</th>
	<th><textarea rows="4" cols="21" name="details" class="input"></textarea></th>
 </tr>
 
 <tr>
 <th></th><th><button class="button" type="submit">SUBMIT</button></th>
 <th></th>
 <th></th>
 </tr>
 <tr>
  <th></th>
 </tr>
</form>
 </form>
 </table>
 
</div>
<%} %>
</body>





</html>