<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="esm.Dbconnection" %>
<!DOCTYPE html>
<html>
<head>

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
  <li><a href="leavenote.jsp">Leave note</a></li>
  <li><a class="active" href="checksalary.jsp">Check salary</a></li>
  <li><a href="about.jsp">About</a></li>
  </ul><br><br>
<center>     
<a href="#"><button class="button">Search</button></a>
<a href="filegenerator?typ=allsalary"><button class="button">All</button></a>
<a href="pendding.jsp"><button class="button">Pendding</button></a>
</center>
	<center><div class="div">
<h2>Search</h2>
<form action="filegenerator" method="post">
<span style="font-size: 20px">From:<input style="font-size:15px " type="date" name="from"></span>
<span style="font-size: 20px">To:<input style="font-size:15px " type="date" name="to"></span>
<input type="hidden" id="custId" name="typ" value="3487"/><br><br>
<button class="button" type="submit" value="search">Search</button>
</form>
</div>
            
            </center>                                                     

</body>
<%} %>
</html>