function loginsession()
{
	if (typeof(Storage) !== "undefined") {
		  // Store
		  var name = sessionStorage.getItem("name");
		  alert(name)
		   if(name)
			   {
			   
			   }else
				   {
				   window.location.replace("login.jsp");
				   }
		  
		} else {
		  document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Storage...";
		}
}