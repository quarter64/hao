<!--Date 2013/10/30-->
<!--author zwx-->
<!--brief �û���¼-->
<!--note ����Login-->
<!--data ��ѯuser-->
<!--copyright Copyright(c) 2013 ת��-->


<%@ page contentType="text/html;charset=GB2312" %>

<HTML>
<head>
<script src="WEB/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){   //����Ψһ��
       $("#Email").blur(function(){ 
       	var str=document.getElementById("Email").value; 
    	var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
		if(!sReg.test(str))     
		{     
			x=document.getElementById("EmailError");
			x.innerHTML="<font color='#f09085'>&nbsp;Email��ַ�����Ϲ淶</font>";         
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
										$("#EmailError").html("<font color='#f09085'>������δע��&nbsp;&nbsp;&nbsp;</font><font color='#6fc670'><a href='register.jsp'>���ע��</a></font>");
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
							 if(data.indexOf("����")>=0)
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
A.lin:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*��ɫ4A5C6C*/}
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
	<font size="+3">ת��alpha</font>
	</div>
	<div style="position:relative;left:39%;top:15%;height:200px;width:350px;">

	��¼����<BR><Input type=text name="logname" id="Email" size="20"><span id="EmailError"></span><BR>
	��¼����<BR><Input type=password id="PassWord" name="password"><span id="PassWorldError"></span>	
	<BR><a class="lin" href='retrieve.jsp'>���������룿</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lin" href='register.jsp'>ע��</a><BR><input type="submit" value="���ϵ�¼" name="g" style="font-family:΢���ź�;font-size:1.0em;border:none;width:63px;height:30px;color:#2F580A;background:#8FB262">

	</div>
</div>

<%@ include file="buildweb/login_footer.txt"%>
</Body>
</HTML>