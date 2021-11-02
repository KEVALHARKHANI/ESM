function login(){
	var id=document.getElementById("id").value;
	var password=document.getElementById("password").value;
	var id1=document.getElementById("id1");
	var password1=document.getElementById("password1");
	var ex=/^[0-9]{1,}$/;
	if(id=="" || id==null)
		{
		id1.innerHTML="Please enter a ID";
		return false;
		}
	if(password=="" || password==null)
	{
	password1.innerHTML="Please enter a password";
	return false;
	}
	if(ex.test(id)==false)
		{
			id1.innerHTML="Please enter a valid ID";
			return false;
		}else
			{
			return true;
			}
	
	
	}
