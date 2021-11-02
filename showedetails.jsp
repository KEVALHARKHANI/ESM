<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script>
function show(i)
{
	var ty=document.getElementById(i);
	
	if(ty.type=="password")
	{
	ty.type="";
	}
else{
	ty.type="password"
}
	
	
	}
	function back()
	{
		 window.history.back();
	}




</script>
 <link rel="stylesheet" type="text/css" href="css/styles.css">
<style>
.div {
    
    width: 500px;
	height:300px;
    padding: 25px;
    margin: 100px;
	
}



.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button:hover 
{
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
	}
	
	
input[type=text] {
    width: 80%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid gray;
    border-radius: 4px;
}
</style>
</head>



<%

String dname=request.getParameter("details");
String name=(String)application.getAttribute("name");
String typ=(String)session.getAttribute("typ");
if( session.isNew() || typ!="manager")
	{
	PrintWriter ps=response.getWriter();
	
	ps.println("<head><meta http-equiv='refresh' content='3;URL=login.jsp'></head>");
	ps.println("<h2><p style='color:red;'>please login...</p></h2>");
	ps.println("redirecting......");
	
	}
else{
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/esm","root","");
	PreparedStatement pr=(PreparedStatement) conn.prepareStatement("select * from login where userid=? and type=? or name=? and type=? ");
	pr.setString(1, dname);
	pr.setString(2, "employee");
	pr.setString(3, dname);
	pr.setString(4, "employee");
	ResultSet rs=pr.executeQuery();
	if(rs.next())
	{%>
<body background="image/Background.jpg">
<fieldset class="field_set">
  <br>
<div class="div_header"><br>
<h1>Employee Salary Management</h1>
<div align="left" style="margin-left: 1%"><h4>Manager Name:<span style="color: red"> <%=name%>!</span><span style="float: right">Logout? <a href="logout">Click Here!</a></span></h4></div></div>
</fieldset></body>
<center>
	<br>
<button class="button">Employee Details</button>
<a href="Addemployee.jsp"><button class="button">Add Employee</button></a>
<a href="approve.jsp"><button class="button">Pending Request</button></a>
<h3>Search Employee</h3>
<form action="showedetails.jsp" method="get">
          <input type="text" name="details" placeholder="Enter Employee name or ID"><br>
<button class="button" type="submit" class="" value="search">SEARCH</button>
</form>
</div>
<br>
	<center>
	<span style="font-size: 24px"><strong>Employee Details</strong></span></center>
	<%
	int i=1;
	rs.beforeFirst();
	while(rs.next())
	{
	%><hr size="4px" color="black"><center>
	<h4>EMPLOYEE :<%=i %><h4>
	<table>
	<tr>
	<th>ID:</th><th><%=rs.getString(1) %></th>
	</tr>
	<tr>
	<th>NAME:</th><th><%=rs.getString(2) %></th>
	</tr>
	<tr>
	<th>GENDER:</th><th><%=rs.getString(3) %></th>
	</tr>
	<tr>
	<th>DOB:</th><th><%=rs.getString(4) %></th>
	</tr>
	<tr>
	<th>ADDRESS:</th><th><%=rs.getString(5) %></th>
	</tr>
	<tr>
	<th>E-MAIL:</th><th><%=rs.getString(6) %></th>
	</tr>
	<tr>
	<th>JOINING DATE:</th><th><%=rs.getString(7) %></th>
	</tr>
	<tr>
	<th>PASSWORD:</th><th><input type="password" id="<%=i%>" value="<%=rs.getString(8) %>" disabled></th><th><input type="checkbox" onclick="show(<%=i%>)">Show password</th>
	</tr>
	
	
	
	</table>
		</center>
	<%i++; }
	}else
	{%>
		<center><h3>No details are available.</h3></center>
<%  }
	
%>
<center><button onclick="back()">Back</button></center>
<%


} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
%>


</body>
</html>