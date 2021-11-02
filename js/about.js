function match() 
{
		var ps = document.getElementById("pd").value;
		var cp = document.getElementById("cp").value;
		var submit = document.getElementById("submit");
		if (cp != "" || cp != null) 
		{	
			if (ps.match(cp) && cp.match(ps)) 
			{
				submit.disabled = false;
				var al = document.getElementById("alrt");
				al.innerHTML = " ";
			} else
			{
				var al = document.getElementById("alrt");
				al.innerHTML = "password does not match";
				submit.disabled = true;
			}
		}

}

function changeEmail() 
{
		var change_control = document.getElementById("mail");
		change_control.disabled = false;
		var change_control_submit = document.getElementById("submitButton");
		change_control_submit.disabled = false;

}

function changeEmailControl() 
{
		var change_control = document.getElementById("mail");
		change_control.disabled = true;
		var change_control_submit = document.getElementById("submitButton");
		change_control_submit.disabled = true;

}

function editEmailId() 
{
		var xhttp;
		var new_emailid = document.getElementById("mail").value;

		if (new_emailid == "") {
			
			return false;
		} else {
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					alert(this.responseText);
				}
			};
			xhttp.open("GET", "changeEmailId?newemailid=" + new_emailid, true);
			xhttp.send();
			changeEmailControl();
		}

}


function showCustomer() {
		var xhttp;
		var str = document.getElementById("pd").value;

		if (str == "") {
			document.getElementById("txtHint").innerHTML = "";
			return;
		}
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				alert(this.responseText);
			}
		};
		xhttp.open("GET", "changepw?pw=" + str, true);
		xhttp.send();
	}

function check() {
	var id=document.getElementById("id").value;
	var submit=document.getElementById("submit");
	var xhttp;
	 var alr=document.getElementById("alt");
	if(id=="")
		{
		return;
		}else
			{
			xhttp=new XMLHttpRequest();
			  xhttp.onreadystatechange = function() 
			  {
				  if(this.readyState == 4 && this.status == 200)
					  {
					  var val=this.responseText+"";
					 
					  if(val=="" || val==null)
						  {
						  submit.disabled=false;
						  alr.innerHTML=" ";
						  
						  }else
							  {
							  submit.disabled=true;
							
							  alr.innerHTML="id is already taken."
							  }
					  }
			  }
			  xhttp.open("GET", "checkid?id="+id, true);
			  xhttp.send();
			}
}function check()
{
	var id=document.getElementById("id").value;
	var submit=document.getElementById("submit");
	var xhttp;
	 var alr=document.getElementById("alt");
	if(id=="")
		{
		return;
		}else
			{
			xhttp=new XMLHttpRequest();
			  xhttp.onreadystatechange = function() 
			  {
				  if(this.readyState == 4 && this.status == 200)
					  {
					  var val=this.responseText+"";
					 
					  if(val=="" || val==null)
						  {
						  submit.disabled=false;
						  alr.innerHTML=" ";
						  
						  }else
							  {
							  submit.disabled=true;
							
							  alr.innerHTML="id is already taken."
							  }
					  }
			  }
			  xhttp.open("GET", "checkid?id="+id, true);
			  xhttp.send();
			}	
}

function edit(a){
	var e=document.getElementById(a);
	var r=document.getElementById("reason"+a);
	e.disabled=false;
	if(r.type=="hidden")
		{
		r.type="text"
		}
	
	
	
	}

function pop(){
	
	
	var r=confirm("it is permanently delete a data from database:");
	if (r == true) {
	   return true;
	  } else {
	    return false;
	  }
	
}

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

function lshow(){
	var r=document.getElementById("password");
	if(r.type=="password"){
		r.type="text";
	}else
		{
		r.type="password";
		}
	
	
	}