<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script type="text/javascript">
function pop(){
	
	
	var r=confirm("it is permanently delete a data from database:");
	if (r == true) {
	   return true;
	  } else {
	    return false;
	  }
	
}

</script>
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
String id=(String)cn.getAttribute("id");
String name=(String)cn.getAttribute("name");
PrintWriter pw=response.getWriter();
Connection con=null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	 con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/esm","root","");
	PreparedStatement pr=(PreparedStatement) con.prepareStatement("select * from work where userid=? and approve=? order by date asc");
	pr.setString(1, id);
	pr.setString(2, "1");
	ResultSet rs = pr.executeQuery();
	
	%>
<link rel="stylesheet" href="css/button.css">
</head>
<body background="image/Background.jpg">
<fieldset class="field_set">
  <br>
<div class="div_header"><br>
<h1>Employee Salary Management</h1>
<div align="right" style="margin-right: 1%"><h4>Welcome <%=name%>!</h4></div></div>
</fieldset></body><br>
<div class="div">
<ul>
  <li><a href="ehome.jsp">Home</a></li>
  <li><a href="leavenote.jsp">Leave note</a></li>
  <li><a class="active" href="checksalary.jsp">Check salary</a></li>
  <li><a  href="about.jsp">About</a></li>
  </ul><br>
  <center>
<%
if(rs.next())
	{
		Date dt=null;
		rs.beforeFirst();
		while(rs.next())
		{
			
			
			if(rs.getRow()!=1 && dt.equals(rs.getDate("date")))
			{
				
				%><tr>
				<td><%=rs.getInt("money") %></td><td><%=rs.getString("details") %></td><td>PENDING</td><td><a href="delete?id=<%=rs.getInt("id") %>"onclick="return pop()">DELETE</a></td>
				</tr>
				
				<%
			}
			else
			{
				dt=rs.getDate("date");
				System.out.print(dt);
			%></table>
				<h4>Date:<%=rs.getDate("date") %></h4>
				<hr color="black">
				<table>
				<tr>
				<th>AMOUNT</th><th>DETAILS:</th><th>STATUS</th><th>ACTION</th>
				</tr>
				<tr>
				<td align="center"><%=rs.getInt("money") %></td><td align="center"><%=rs.getString("details") %></td><td align="center">PENDING</td><td align="center"><a href="delete?id=<%=rs.getInt("id") %>" onclick="return pop()">DELETE</a></td>
				</tr>


				
				
				
			<%}
			if(rs.isLast())
			{
				%>
				</table>
				<%
			}
			
			
			 
		}
	%>
<% 
	}
	else
	{
		pw.println("<head><meta http-equiv='refresh' content='5;URL=mhome.jsp'></head>");
		pw.println("<h2><p style='color:red;'>no salary Approval is pending </p></h2>");
		pw.println("redirecting......");
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}finally
{
	con.close();
}
}
	
	%>
	</center>
	

</body>
</html>