function reloadcode()//点击安全码更新
{
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','securitycode.jsp?'+Math.random());
	//这里必须加入随机数不然地址相同我发重新加载
}
function myfunctionLoginEmail()//
{   
	////////////////////////判断email//////////////////////////////
	var str=document.getElementById("Name").value;  
    var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
	if(!sReg.test(str))     
	{     
		x=document.getElementById("EmailError");
		x.innerHTML="<font color='#f09085'>&nbsp;Email地址不符合规范</font>";        
		return false;//false:阻止提
	}   
	else
	{
		x=document.getElementById("EmailError");
		x.innerHTML="";
	}   
}
function loginver()//检测是否符合登录条件
{   
	////////////////////////判断email//////////////////////////////
	var password=document.getElementById("password").value; 
	var name=document.getElementById("Name").value; 
	if(name=="")
	{
		x=document.getElementById("loginver");
		x.innerHTML="<font color='#f09085'>请输入邮箱</font>";         
		return false;
	}
	if(password=="")
	{
		x=document.getElementById("loginver");
		x.innerHTML="<font color='#f09085'>你没填写密码</font>";         
		return false;
	}
	else
	{
		return true;
	} 
}
 function agree()//是否同意用户条款
{
	if(document.getElementById('AgreeToTerms').checked)
	{
		document.getElementById('regsubmit').disabled=false;
	}
    else
    {
        document.getElementById('regsubmit').disabled='disabled';  
  	} 
 }  
function passwordver()//
{   
	////////////////////////判断密码是否一致//////////////////////////////
 
	var password1=document.getElementById("password1").value; 
	var password2=document.getElementById("confirm_password").value; 
	if(password1==password2)  
	{
		x=document.getElementById("passwordverdify");
		x.innerHTML="*";
	}
	else
	{
		x=document.getElementById("passwordverdify");
		x.innerHTML="<font color='#f09085'>两次密码不一致</font>";
	} 
}
function registerver()
{
	var username=document.getElementById("RegisterUserName").value;
	var email=document.getElementById("registerName").value;
	var password1=document.getElementById("password1").value;
	var password2=document.getElementById("confirm_password").value;
	var safecode=document.getElementById("securitycode").value;
	var phone=document.getElementById("registerPhone").value;
	var qq=document.getElementById("registerqq").value;
	if(username=="")
	{
		x=document.getElementById("RegisterUserNameError");
		x.innerHTML="<font color='#f09085'>你还没填写昵称</font>";         
		return false;
	}
	if(!(username==""))
	{
		x=document.getElementById("RegisterUserNameError");
		x.innerHTML="";         
		if(email=="")
		{
			x=document.getElementById("RegisterEmailError");
			x.innerHTML="<font color='#f09085'>你还没填写邮箱</font>";         
			return false;
		}
		if(!(email==""))
		{
			x=document.getElementById("RegisterEmailError");
			x.innerHTML="*";
			if(phone=="")
			{
				x=document.getElementById("RegisterPhoneError");
				x.innerHTML="<font color='#f09085'>你还没填写联系电话</font>";   
				return false;
			}
			if(!(phone==""))
			{
				x=document.getElementById("RegisterPhoneError");
				x.innerHTML=" *和你交易时的联系方式";
				if(qq=="")
				{
					x=document.getElementById("RegisterqqError");
					x.innerHTML="<font color='#f09085'>便于交流,你需要填写QQ</font>";         
					return false;
				}
				if(!(qq==""))
				{
					x=document.getElementById("RegisterqqError");
					x.innerHTML="";
					if(password1=="")
					{
						x=document.getElementById("RegisterPassError");
						x.innerHTML="<font color='#f09085'>你还没填写密码</font>";         
						return false;
					}
					if(!(password1==""))
					{
						x=document.getElementById("RegisterPassError");
						x.innerHTML="*(最多15个字符)";
						if(password2=="")
						{
							x=document.getElementById("passwordverdify");
							x.innerHTML="<font color='#f09085'>请再次填写密码</font>";         
							return false;
						}
						if(!(password2==""))
						{
							x=document.getElementById("passwordverdify");
							x.innerHTML=""; 
							if(safecode=="")
							{
								x=document.getElementById("safecodever");
								x.innerHTML="<font color='#f09085'>为保障安全,你需要填写验证码</font>";         
								return false;
							}
							if(!(safecode==""))
							{
								var last1=document.getElementById("RegisterEmailError").innerHTML;
								var last2=document.getElementById("passwordverdify").innerHTML;
								var last3=document.getElementById("safecodever").innerHTML;
								if(last1.indexOf("6fc670")>=0)
								{
									return false;
								}
								if(!(last1.indexOf("6fc670")>=0))
								{
									if(last2.indexOf("6fc670")>=0)
									{
										return false;
									}
									if(!(last2.indexOf("6fc670")>=0))
									{
										if(!(last3.indexOf("6fc670")>=0))
										{
											return true;
										}
										else
										{
											return true;	
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}