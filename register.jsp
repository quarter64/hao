<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="user.Register" %>
<%@ page import="java.security.MessageDigest;" %>
<%! //处理字符串的方法：
public String codeString(String s)
{ 
	String str=s;
	try
	{
		byte b[]=str.getBytes("ISO-8859-1");
		str=new String(b);
		return str;
	}
	catch(Exception e)
	{ 
		return str;
	}
}
%>

<HTML>
<head>
<script src="WEB/js/jquery-1.9.1.js"></script>
<SCRIPT src="WEB/js/register.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="WEB/css/register.css"/>
<script type="text/javascript"> //ajax提交 
$(function(){   //验证码
       $("#securitycode").blur(function(){ 	
       $.ajax({ 
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
                            } 
       	 	 	 	 }); 	    
 	   }); 
});
</script> 
<script type="text/javascript">
$(function(){   //邮箱唯一性
       $("#registerName").blur(function(){ 
       	var str=document.getElementById("registerName").value; 
    	var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
		if(!sReg.test(str))     
		{     
			x=document.getElementById("RegisterEmailError");
			x.innerHTML="<font color='#f09085'>&nbsp;Email地址不符合规范</font>";         
		}   
		else
		{	
       		$.ajax({ 
	   		type:"POST", 
			url:"ajax/checkemail.jsp", 
			data:"email="+$("#registerName").val(),//"securitycode="+$("#securitycode").val(),
			dataType:'text',
			error: function(e)
							{  
			  					alert(e); 
							}, 
			success:function(data)
							{
							 	$("#RegisterEmailError").html(data);
                            } 
       	 	 	 	 }); 	    
       	 }	    
 	   }); 
}); 
</script>


</head>
<%@ include file="buildweb/login_head.txt"%>
<%
	String str=response.encodeURL("login.jsp");
	String str1=response.encodeURL("register.jsp");
%>



<div id="body">

<div id="formwrapper">


<jsp:useBean id="memberlogin" class="user.Register" scope="request" >
</jsp:useBean>
<%
String logname="",sex="",age="", password="",
email="",phone="",address="";
int n=0; // 用来验证年龄的变量。
// 提交信息后，进行注册操作：
if(!(session.isNew()))
{ 
	logname=request.getParameter("logname");
	if(logname==null)
	{
		logname="";
	}
	logname=codeString(logname);
	// 判断名字是否含有空格：
	int space=logname.indexOf(" ");
	if(space!=-1)
	{
		response.sendRedirect("register.jsp");
	}
	password=request.getParameter("password");
	if(password==null)
	{
		password="";
	}
	password=codeString(password);
	sex=request.getParameter("sex");
	if(sex==null)
	{
		sex="";
	}
	sex=codeString(sex);
	age=request.getParameter("age");
	if(age==null)
	{
		age="0";
	}
	age=codeString(age);
	try
	{
		n=Integer.parseInt(age);
	}
	catch(NumberFormatException e)
	{
		n=0;
	}
	email=request.getParameter("email");
	if(email==null)
	{
		email="";
	}
	email=codeString(email);
	phone=request.getParameter("phone");
	if(phone==null)
	{
		phone="";
	}	
	phone=codeString(phone);
	address=request.getParameter("qq");
	if(address==null)
	{
		address="";
	}
	address=codeString(address);

	//MD5 加密
	/*String s = password;
    char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       

    byte[] btInput = s.getBytes();
    // 获得MD5摘要算法的 MessageDigest 对象
    MessageDigest mdInst = MessageDigest.getInstance("MD5");
    // 使用指定的字节更新摘要
    mdInst.update(btInput);
    // 获得密文
    byte[] md = mdInst.digest();
    // 把密文转换成十六进制的字符串形式
    int j = md.length;
    char str2[] = new char[j * 2];
    int k = 0;
    for (int i = 0; i < j; i++) 
    {
        byte byte0 = md[i];
        str2[k++] = hexDigits[byte0 >>> 4 & 0xf];
        str2[k++] = hexDigits[byte0 & 0xf];
    }
    password = new String(str2);*/
		
}
%>
<% // 检查用户是否按要求填写了必要的信息:用户名、年龄、密码，
// 为了以后处理汉字方便，我们采用了第1 种方式初始化beans
boolean
b=!(logname.equals(""))&&!(password.equals(""));
if(b)
{ 
	out.print(logname);%>
	<jsp:setProperty name="memberlogin" property="logname"
	value="<%=logname%>" />
	<jsp:setProperty name="memberlogin" property="password"
	value="<%=password%>" />
	<jsp:setProperty name="memberlogin" property="sex"
	value="<%=sex%>" />
	<jsp:setProperty name="memberlogin" property="age"
	value="<%=age%>" />
	<jsp:setProperty name="memberlogin" property="email"
	value="<%=email%>" />
	<jsp:setProperty name="memberlogin" property="phone"
	value="<%=phone%>" />
	<jsp:setProperty name="memberlogin" property="address"
	value="<%=address%>" />
	<%
	memberlogin.addItem();
	String strok=response.encodeURL("login.jsp");
	response.sendRedirect(strok);
}
else
{
	out.print("你还没有提交任何信息!");
}
%>
<% // 返回注册是否成功的信息
if(!(session.isNew()))
{
%>
<!--<jsp:getProperty name= "memberlogin" property="backNews" />-->
<%
}
%>


<h3>已注册用户登录</h3>
<form action="<%=str%>"  method="post" name="apLogin" id="apLogin">
<fieldset>
   <legend>用户登录</legend>
   <div>
     <label for="Name">邮箱</label>
     <input type="text" name="logname" onBlur="myfunctionLoginEmail()" id="Name" size="18" maxlength="30" /><span id="EmailError"></span><br/>
   </div>
   <div>
     <label for="password">密码</label>
     <input type="password" name="password" id="password" size="18" maxlength="15" /><br  />
   </div>
   <div class="cookiechk">
     <label><input type="checkbox" name="CookieYN" id="CookieYN"  value="1" /> <a  href="#" title="选择是否记录您的信息">记住我</a></label>
     <input name="login791" type="submit" onClick="return loginver()" class="buttom" value="登录" /><span id="loginver"></span>
   </div>  
   <div class="forgotpass"><a href="#">您忘记密码?</a></div>  
</fieldset>
</form><br />
<h3>未注册创建帐户</h3>
<form action="<%=str1%>"  method="post" name="apForm"  id="apForm">
<fieldset>
   <legend>用户注册</legend>
   <p><strong>您的电子邮箱不会被公布出去,但是必须填写.</strong> 在您注册之前请先认真阅读服务条款.</p>
   <div>
   <label for="Name">昵称</label>
   <input type="text" name="logname" id="RegisterUserName" size="20"  maxlength="7" /> 
   <span id="RegisterUserNameError">*(最多7个字)</span><br/>  
</div>
   <div>
   <label for="Email">电子邮箱</label>
   <input type="text" name="email" id="registerName" size="20" maxlength="150" />  
	<span id="RegisterEmailError">*</span><br />
</div>  
   <div>
   <label for="phone">电话</label>
   <input type="text" name="phone" id="registerPhone" size="20" maxlength="150" />  
	<span id="RegisterPhoneError">*和你交易时的联系方式</span><br />
</div>
   <div>
   <label for="qq">QQ</label>
   <input type="text" name="qq" id="registerqq" size="20" maxlength="150" />  
	<span id="RegisterqqError"></span><br />
</div>
   <div>
   <label for="age">出生年</label>
   <select name="age" id="age">
  		<option value ="1980">1980</option><option value ="1981">1981</option><option value="1982">1982</option>
  		<option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option>
  		<option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option>
  		<option value="1989">1989</option>
  		<option value ="1990">1990</option><option value ="1991">1991</option><option value="1992">1992</option>
  		<option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option>
  		<option value="1996">1986</option><option value="1997">1997</option><option value="1998">1998</option>
  		<option value="1999">1999</option><option value="2000">2000</option>
   </select>年
 <br />  
</div> 
   <div>
   <label for="sex">性别</label>
   <Input type=radio name="sex" id="sex" checked="o" value="男"/>男
   <Input type=radio name="sex" value="女">女<br />  
</div> 
   <div>
   <label for="password">密码</label>
   <Input type="password" name="password1" id="password1" size="18" maxlength="15" /> 
   <span id="RegisterPassError">*(最多15个字符)</span><br />
</div>
   <div>
   <label for="confirm_password">重复密码</label>
   <Input type="password" name="password" onBlur="passwordver()" id="confirm_password" size="18" maxlength="15" /> 
   <span id="passwordverdify">*</span><br />
</div>
<div>
   <label for="safe">验证码:</label><img onClick="reloadcode()" title="点击换一张" id="safecode" src="securitycode.jsp">
   <Input type="text" name="securitycode" id="securitycode" size="18" maxlength="15" /><span id="safecodever"></span> 
	<br/>
</div>
   <div>
   <label for="AgreeToTerms">同意服务条款</label>
   <input type="checkbox" name="AgreeToTerms" onClick="agree();" id="AgreeToTerms" value="0"/> 
   <a href="#"  title="您是否同意服务条款">先看看条款？</a> *  </div>    
   <div class="enter">
   <input name="create791"  type="submit" class="buttom" disabled="disabled" id="regsubmit" onClick="return registerver()" value="提交" />
   <input name="Submit" type="reset" class="buttom" value="重置" />
</div>
   <p><strong>*在提交您的注册信息时, 我们认为您已经同意了我们的服务条款.</strong></p>  
</fieldset>
</form>

</div>
</div>
<%@ include file="buildweb/footer.txt"%>
</HTML>