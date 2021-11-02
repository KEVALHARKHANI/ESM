<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/css1.css">
<!---<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>-->
<script type="text/javascript">
function show()
{

    var h=document.getElementById("password");
    if(h.type=="password")
    {
        h.type="text";
    }else
    {
        h.type="password";
    }
    }

</script>
</head>
<body background="image/set1.jpg">
<center>
<fieldset class="fadeInDown" style="background: #fff; border:1px solid gray;
    border-radius: 20px 20px 20px 20px;box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
    ">
<h1 class="fadeIn fifth" style="font-family: Raleway sans-serif;margin-left: 4%; color: skyblue; text-shadow: 1px 0 black,  1px black, 1px  black, 1px black;">
    Employee Salary Management
<h1>
</fieldset>
</center>
<div class="wrapper fadeInDown">
  <div id="formContent">
  
    <form action="validation" method="post">
        <br>
    <select style="border: 1px solid grey;color: grey;" class="fadeIn second" name="typ">
    <option selected>LOGIN TYPE</option>
<option value="employee">EMPLOYEE
</option>
<option value="manager" >
MANAGER
</option>
</select><br></br>
      <input type="text" id="login" class="fadeIn third" name="id" placeholder="ID" required>
      <input type="password" id="password" class="fadeIn fourth"  name="password" placeholder="Password" required="">
    <br><br>
      <span><input type="checkbox" class="fadeIn fifth" onclick="show()"><span class="fadeIn fifth" style="color: grey; font-size: 15px;"> Show Password</span></span><br><br>
      <input type="submit" class="fadeIn fifth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="forgotpw.jsp">Forgot Password?</a>
    </div>

  </div>
</div>
</body>
</html>
