function reloadcode()//�����ȫ�����
{
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','securitycode.jsp?'+Math.random());
	//�����������������Ȼ��ַ��ͬ�ҷ����¼���
}
function myfunctionLoginEmail()//
{   
	////////////////////////�ж�email//////////////////////////////
	var str=document.getElementById("Name").value;  
    var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
	if(!sReg.test(str))     
	{     
		x=document.getElementById("EmailError");
		x.innerHTML="<font color='#f09085'>&nbsp;Email��ַ�����Ϲ淶</font>";        
		return false;//false:��ֹ��
	}   
	else
	{
		x=document.getElementById("EmailError");
		x.innerHTML="";
	}   
}
function loginver()//����Ƿ���ϵ�¼����
{   
	////////////////////////�ж�email//////////////////////////////
	var password=document.getElementById("password").value; 
	var name=document.getElementById("Name").value; 
	if(name=="")
	{
		x=document.getElementById("loginver");
		x.innerHTML="<font color='#f09085'>����������</font>";         
		return false;
	}
	if(password=="")
	{
		x=document.getElementById("loginver");
		x.innerHTML="<font color='#f09085'>��û��д����</font>";         
		return false;
	}
	else
	{
		return true;
	} 
}
 function agree()//�Ƿ�ͬ���û�����
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
	////////////////////////�ж������Ƿ�һ��//////////////////////////////
 
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
		x.innerHTML="<font color='#f09085'>�������벻һ��</font>";
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
		x.innerHTML="<font color='#f09085'>�㻹û��д�ǳ�</font>";         
		return false;
	}
	if(!(username==""))
	{
		x=document.getElementById("RegisterUserNameError");
		x.innerHTML="";         
		if(email=="")
		{
			x=document.getElementById("RegisterEmailError");
			x.innerHTML="<font color='#f09085'>�㻹û��д����</font>";         
			return false;
		}
		if(!(email==""))
		{
			x=document.getElementById("RegisterEmailError");
			x.innerHTML="*";
			if(phone=="")
			{
				x=document.getElementById("RegisterPhoneError");
				x.innerHTML="<font color='#f09085'>�㻹û��д��ϵ�绰</font>";   
				return false;
			}
			if(!(phone==""))
			{
				x=document.getElementById("RegisterPhoneError");
				x.innerHTML=" *���㽻��ʱ����ϵ��ʽ";
				if(qq=="")
				{
					x=document.getElementById("RegisterqqError");
					x.innerHTML="<font color='#f09085'>���ڽ���,����Ҫ��дQQ</font>";         
					return false;
				}
				if(!(qq==""))
				{
					x=document.getElementById("RegisterqqError");
					x.innerHTML="";
					if(password1=="")
					{
						x=document.getElementById("RegisterPassError");
						x.innerHTML="<font color='#f09085'>�㻹û��д����</font>";         
						return false;
					}
					if(!(password1==""))
					{
						x=document.getElementById("RegisterPassError");
						x.innerHTML="*(���15���ַ�)";
						if(password2=="")
						{
							x=document.getElementById("passwordverdify");
							x.innerHTML="<font color='#f09085'>���ٴ���д����</font>";         
							return false;
						}
						if(!(password2==""))
						{
							x=document.getElementById("passwordverdify");
							x.innerHTML=""; 
							if(safecode=="")
							{
								x=document.getElementById("safecodever");
								x.innerHTML="<font color='#f09085'>Ϊ���ϰ�ȫ,����Ҫ��д��֤��</font>";         
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