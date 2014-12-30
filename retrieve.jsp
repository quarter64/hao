<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=GB2312" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>找回密码</title>

<script type="text/javascript" src="WEB/jBox/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="WEB/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="WEB/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link type="text/css" rel="stylesheet" href="WEB/jBox/Skins/Default/jbox.css"/>

<style type="text/css">

body 
{
	background-color:#033748;  
}

#need {margin: 20px auto 0;width: 450px;}
#need li {height: 26px;width: 450px;font: 12px/26px Arial, Helvetica, sans-serif;background: #964f57;border-bottom: 1px dashed #E0E0E0;display: block;cursor: text;padding: 7px 0px 7px 10px!important;padding: 5px 0px 5px 10px;}
#need li:hover,#need li.hover {background: #254762;}
#need input {line-height: 14px;background: #d96830;height: 14px;width: 200px;border: 1px solid #E0E0E0;vertical-align: middle;padding: 6px;color:#162b3c}
#need label {padding-left: 30px;}
#need label.password{background-position: 0 -277px;}
#need label.new_password_zzjs {background-position: 0 -1576px;}
#need label.rePassword_zzjs {background-position: 0 -1638px;}
#need label.email{background-position: 0 -429px;}
#need dfn {display: none;}
#need li:hover dfn, #need li.hover dfn {display:inline;margin-left: 7px;color: #676767;}

.input_on{
padding:2px 8px 0pt 3px;
height:18px;
border:1px solid #999;
background-color:#FFFFCC;
}
.input_off{
padding:2px 8px 0pt 3px;
height:18px;
border:1px solid #CCC;
background-color:#FFF;
}
.input_move{
padding:2px 8px 0pt 3px;
height:18px;
border:1px solid #999;
background-color:#FFFFCC;
}
.input_out{

padding:2px 8px 0pt 3px;
height:18px;
border:1px solid #CCC;
background-color:#FFF;
}
</style>

<script type="text/javascript">
$(function(){  
       $("#Email").blur(function(){ 
       	var str=document.getElementById("Email").value; 
    	var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
		if(!sReg.test(str))     
		{     
			x=document.getElementById("EmailError");
			x.innerHTML="<font color='#f09085'>&nbsp;Email格式错误</font>";         
		}   
		else
		{
			$.ajax({ 
	   		type:"POST", 
			url:"ajax/checkemail.jsp", 
			data:"email="+$("#Email").val(),
			async: false,  
			global: false, 
			dataType:'text',
			error: function()
								{ 
			  						alert('Error web!!!!!'); 
								} , 
			success:function(data)
								{
								if(data.indexOf("6fc670")>=0)
									{
										$("#EmailError").html("<font color='#f09085'>该邮箱不存在&nbsp;&nbsp;&nbsp;</font><font color='#6fc670'><a href='register.jsp'>点此注册</a></font>");
									}
								else
									{
										$("#EmailError").html("");
									}
                                } 
   
       	 	 	 	 });
		}
 	   });
	$("#PassWord").blur(function(){
	       $.ajax({ 
	   		type:"POST", 
			url:"ajax/checklogin.jsp", 
			data:{logname:$("#Email").val(),password:$("#PassWord").val()},
			async: false,  
			global: false, 
			dataType:'text',
			error: function()
									{  
			  							alert('Error web!!!!!'); 
									 }, 
			success:function(data)
							 {
							 if(data.indexOf("密码")>=0)
							 	{
							 		$("#PassWorldError").html("<font color='#f09085'>"+data+"</font>");
                             	}
                             else
                             	{
                             		//window.location.href="index.jsp";
                             		$("#PassWorldError").html("");
                             	}
                             } 
       	 	 	 	 }); 	    
	});
}); 


function safecodecheck()
{
	var email=document.getElementById("input_email").value;
	if(email != '')
	{
		$.ajax
		({ 
			type:"POST", 
			url:"ajax/checkemail.jsp", 
			data:"email="+$("#input_email").val(),
			async: false,  
			global: false, 
			dataType:'text',
			error: function()
				{ 
					alert('Error web!!!!!'); 
				}, 
			success:function(data)
				{
					if(data.indexOf("6fc670")>=0)
					{
						$("#safecodever").html("<font color='#f09085'>邮箱未注册&nbsp;&nbsp;&nbsp;</font><font color='#6fc670'><a href='register.jsp'>点此注册</a></font>");
					}
					else
					{
						$("#safecodever").html("");
						$.ajax
						({ 
	   						type:"POST", 
							url:"ajax/securityverify.jsp", 
							data:"securitycode="+$("#securitycode").val(),
							async:false,  
							global:false, 
							dataType:'text',
							error: function(e)
							{  
			  					alert(e); 
							}, 
							success:function(data)
							{
							 	$("#safecodever").html(data);
							 	if(data.indexOf("正确")>=0)
							 	{
							 		$.ajax({ 
	   								type:"POST", 
									url:"ajax/email_password.jsp", 
									data:"email="+$("#input_email").val(),
									async:false,  
									global:false, 
									dataType:'text',
									error: function(e)
										{  
									  		alert(e); 
										}, 
									success:function(data)
										{
											if(data.indexOf("ok")>=0)
											{
												window.location.href="sendpassword_jump.jsp";
											}
										}
									});
							 	}
                            } 
       	 	 	 	 });
       	 	 	 }
			} 
		});
	}
}	    


function reloadcode()
{
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','securitycode.jsp?'+Math.random());
}


function registerver()
{   
	var password1=document.getElementById("new_password").value; 
	var password2=document.getElementById("re_password").value; 
	if(password1==password2)  
	{
		x=document.getElementById("passwordverdify");
		x.innerHTML="";
	}
	else
	{
		x=document.getElementById("passwordverdify");
		x.innerHTML="<font color='#f09085'>两次密码不一致</font>";
	} 
}



function retrieve()
{
	var email=document.getElementById("Email").value;
	var password=document.getElementById("PassWord").value;
	var re_password=document.getElementById("re_password").value;
	var password_Error=document.getElementById("PassWorldError").innerHTML;
	
	
	var password1=document.getElementById("new_password").value; 
	var password2=document.getElementById("re_password").value; 
	
	if(email=="" || password=="" || re_password=="" || password1 != password2)
	{
		x=document.getElementById("passwordverdify");
		x.innerHTML="<font color='#f09085'>信息不完整!</font>"; 
	}
	else
	{
		if(password_Error.indexOf("错误")>=0)
		{
			x=document.getElementById("passwordverdify");
			x.innerHTML="<font color='#f09085'>密码错误!</font>";
		}
		else
		{
			x=document.getElementById("passwordverdify");
			x.innerHTML=""; 
			$.ajax({ 
	   		type:"POST", 
			url:"ajax/check_retrieve.jsp", 
			data:{logname:$("#Email").val(),password:$("#re_password").val()},
			async: false,  
			global: false, 
			dataType:'text',
			error: function()
									{  
			  							alert(''); 
									} , 
			success:function(data)
							 {
							 if(data.indexOf("ok")>=0)
								{
									window.location.href="retrieve_jump.jsp";
								}
                             } 
       	 	 });

		}
	}
}

function demo()
{
	var str="<font color=#036664 size=+1>我们会将您的密码发送至您的邮箱，为了安全起见请尽快修改密码！<BR></font><BR><table width=100% border=0><tr><td align='center'><label for='inp_email'>Email：</label><input id=\"input_email\" class=\"input_out\" name=\"\" type=\"text\" onfocus=\"this.className='input_on';this.onmouseout=''\" onblur=\"this.className='input_off';this.onmouseout=function(){this.className='input_out'};\" onmousemove=\"this.className='input_move'\" onmouseout=\"this.className='input_out'\" /><BR>";
	var str1="<BR>验证码<img onclick='reloadcode()' title='点击换一张' id='safecode' src='securitycode.jsp'><Input type='text' name='securitycode' onmouseout='safecodecheck()' id='securitycode' size='12' maxlength='15' /><div id='safecodever'></div>";
	var str2="<input type='submit' value='发送' onclick='safecodecheck()' style='font-family:雅黑;font-size:1.0em;border:none;width:120px;height:30px;color:#f9cdad;background:#fe4466'></td></tr></table>";
	$.jBox(str+str1+str2,'jBox');
}


function suckerfish_zzjs(type, tag, parentId) 
{
	if(window.attachEvent) 
	{
		window.attachEvent("onload", function() 
		{
			var sfEls = (parentId==null)?document.getElementsByTagName(tag):document.getElementById(parentId).getElementsByTagName(tag);
			type(sfEls);
		});
	}
}
hover = function(sfEls) 
{
	for (var i=0; i<sfEls.length; i++) 
	{
		sfEls[i].onmouseover=function() 
		{
			this.className+="hover";
		}
		sfEls[i].onmouseout=function() 
		{
			this.className=this.className.replace(new RegExp(" hover\\b"), "");
		}
	}
}
suckerfish_zzjs(hover, "li");
</SCRIPT>


</head>
<body>
<%@ include file="buildweb/buygoods_head.txt"%>
<input type='button' value='忘记密码' onclick=demo() style='font-family:雅黑;font-size:1.0em;border:none;width:80px;height:23px;color:#ffffff;background:#6bc334'>

<table border='0' width="100%" height=450px><tr><td align="center">
<ol id="need">
	<li><label class="email_zzjs">请输入邮箱</label><input type="text" id='Email' name="email"><dfn id="EmailError">您的邮箱</dfn></li>
	<li><label class="old_password_zzjs">请输入密码</label><input type="password" id="PassWord" name="password"><dfn id="PassWorldError">您的旧密码</dfn></li>
	<li><label class="new_password_zzjs">输入新密码</label><input type="password" id="new_password" name="new_password"><dfn>您的新密码</dfn></li>
	<li><label class="rePassword_zzjs">请重复密码</label><input onmouseout="registerver()" type="password" id="re_password" name="re_password"><dfn>您的新密码</dfn></li>
</ol>

<div id="passwordverdify"></div>
<input type='submit' value='修改' id="submit" onclick='retrieve()' style='font-family:雅黑;font-size:1.0em;border:none;width:100px;height:25px;color:#ffffff;background:#057f42'>
</td></tr></table>

<%@ include file="buildweb/login_footer.txt"%>
</body>
</html>