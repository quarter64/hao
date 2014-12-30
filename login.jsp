<!--Date 2013/10/30-->
<!--author zwx-->
<!--brief 用户登录-->
<!--note 调用Login-->
<!--data 查询user-->
<!--copyright Copyright(c) 2013 转易-->


<%@ page contentType="text/html;charset=GB2312" %>

<HTML>
<head>
<script src="WEB/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){   //邮箱唯一性
       $("#Email").blur(function(){ 
       	var str=document.getElementById("Email").value; 
    	var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
		if(!sReg.test(str))     
		{     
			x=document.getElementById("EmailError");
			x.innerHTML="<font color='#f09085'>&nbsp;Email地址不符合规范</font>";         
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
										$("#EmailError").html("<font color='#f09085'>邮箱尚未注册&nbsp;&nbsp;&nbsp;</font><font color='#6fc670'><a href='register.jsp'>点此注册</a></font>");
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
									} , 
			success:function(data)
							 {
							 if(data.indexOf("密码")>=0)
							 	{
							 		$("#PassWorldError").html("<font color='#f09085'>"+data+"</font>");
                             	}
                             else
                             	{
                             		window.location.href="index.jsp";
                             	}
                             } 
       	 	 	 	 }); 	    
	});
}); 
</script>
<style type="text/css">

a.lin:visited {color:#6fc670}
A.lin:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*灰色4A5C6C*/}
a.lin:hover {color:#286426; text-decoration:none;}

</style>
</head>
<BODY >
<%String string=response.encodeURL("login.jsp");
%>

<%@ include file="buildweb/login_head.txt"%>

<div style="position:relative;left:-8px;top:60px;height:100%;width:101.5%;background-color:#434343;color:#8eb161;font-size:0.8em;">
<div style="position:relative;left:30%;top:20%;height:50px;width:50px;">
<img src="WEB/images/login_login.png">
</div>
	<div style="position:relative;left:35%;top:1%;height:20px;width:350px;">
	<font size="+3">转易alpha</font>
	</div>
	<div style="position:relative;left:39%;top:15%;height:200px;width:350px;">

	登录邮箱<BR><Input type=text name="logname" id="Email" size="20"><span id="EmailError"></span><BR>
	登录密码<BR><Input type=password id="PassWord" name="password"><span id="PassWorldError"></span>	
	<BR><a class="lin" href='retrieve.jsp'>您忘记密码？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lin" href='register.jsp'>注册</a><BR><input type="submit" value="马上登录" name="g" style="font-family:微软雅黑;font-size:1.0em;border:none;width:63px;height:30px;color:#2F580A;background:#8FB262">

	</div>
</div>

<%@ include file="buildweb/login_footer.txt"%>
</Body>
</HTML>