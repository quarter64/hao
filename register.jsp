<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="user.Register" %>
<%@ page import="java.security.MessageDigest;" %>
<%! //�����ַ����ķ�����
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
<script type="text/javascript"> //ajax�ύ 
$(function(){   //��֤��
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
$(function(){   //����Ψһ��
       $("#registerName").blur(function(){ 
       	var str=document.getElementById("registerName").value; 
    	var sReg = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
		if(!sReg.test(str))     
		{     
			x=document.getElementById("RegisterEmailError");
			x.innerHTML="<font color='#f09085'>&nbsp;Email��ַ�����Ϲ淶</font>";         
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
int n=0; // ������֤����ı�����
// �ύ��Ϣ�󣬽���ע�������
if(!(session.isNew()))
{ 
	logname=request.getParameter("logname");
	if(logname==null)
	{
		logname="";
	}
	logname=codeString(logname);
	// �ж������Ƿ��пո�
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

	//MD5 ����
	/*String s = password;
    char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       

    byte[] btInput = s.getBytes();
    // ���MD5ժҪ�㷨�� MessageDigest ����
    MessageDigest mdInst = MessageDigest.getInstance("MD5");
    // ʹ��ָ�����ֽڸ���ժҪ
    mdInst.update(btInput);
    // �������
    byte[] md = mdInst.digest();
    // ������ת����ʮ�����Ƶ��ַ�����ʽ
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
<% // ����û��Ƿ�Ҫ����д�˱�Ҫ����Ϣ:�û��������䡢���룬
// Ϊ���Ժ����ַ��㣬���ǲ����˵�1 �ַ�ʽ��ʼ��beans
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
	out.print("�㻹û���ύ�κ���Ϣ!");
}
%>
<% // ����ע���Ƿ�ɹ�����Ϣ
if(!(session.isNew()))
{
%>
<!--<jsp:getProperty name= "memberlogin" property="backNews" />-->
<%
}
%>


<h3>��ע���û���¼</h3>
<form action="<%=str%>"  method="post" name="apLogin" id="apLogin">
<fieldset>
   <legend>�û���¼</legend>
   <div>
     <label for="Name">����</label>
     <input type="text" name="logname" onBlur="myfunctionLoginEmail()" id="Name" size="18" maxlength="30" /><span id="EmailError"></span><br/>
   </div>
   <div>
     <label for="password">����</label>
     <input type="password" name="password" id="password" size="18" maxlength="15" /><br  />
   </div>
   <div class="cookiechk">
     <label><input type="checkbox" name="CookieYN" id="CookieYN"  value="1" /> <a  href="#" title="ѡ���Ƿ��¼������Ϣ">��ס��</a></label>
     <input name="login791" type="submit" onClick="return loginver()" class="buttom" value="��¼" /><span id="loginver"></span>
   </div>  
   <div class="forgotpass"><a href="#">����������?</a></div>  
</fieldset>
</form><br />
<h3>δע�ᴴ���ʻ�</h3>
<form action="<%=str1%>"  method="post" name="apForm"  id="apForm">
<fieldset>
   <legend>�û�ע��</legend>
   <p><strong>���ĵ������䲻�ᱻ������ȥ,���Ǳ�����д.</strong> ����ע��֮ǰ���������Ķ���������.</p>
   <div>
   <label for="Name">�ǳ�</label>
   <input type="text" name="logname" id="RegisterUserName" size="20"  maxlength="7" /> 
   <span id="RegisterUserNameError">*(���7����)</span><br/>  
</div>
   <div>
   <label for="Email">��������</label>
   <input type="text" name="email" id="registerName" size="20" maxlength="150" />  
	<span id="RegisterEmailError">*</span><br />
</div>  
   <div>
   <label for="phone">�绰</label>
   <input type="text" name="phone" id="registerPhone" size="20" maxlength="150" />  
	<span id="RegisterPhoneError">*���㽻��ʱ����ϵ��ʽ</span><br />
</div>
   <div>
   <label for="qq">QQ</label>
   <input type="text" name="qq" id="registerqq" size="20" maxlength="150" />  
	<span id="RegisterqqError"></span><br />
</div>
   <div>
   <label for="age">������</label>
   <select name="age" id="age">
  		<option value ="1980">1980</option><option value ="1981">1981</option><option value="1982">1982</option>
  		<option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option>
  		<option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option>
  		<option value="1989">1989</option>
  		<option value ="1990">1990</option><option value ="1991">1991</option><option value="1992">1992</option>
  		<option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option>
  		<option value="1996">1986</option><option value="1997">1997</option><option value="1998">1998</option>
  		<option value="1999">1999</option><option value="2000">2000</option>
   </select>��
 <br />  
</div> 
   <div>
   <label for="sex">�Ա�</label>
   <Input type=radio name="sex" id="sex" checked="o" value="��"/>��
   <Input type=radio name="sex" value="Ů">Ů<br />  
</div> 
   <div>
   <label for="password">����</label>
   <Input type="password" name="password1" id="password1" size="18" maxlength="15" /> 
   <span id="RegisterPassError">*(���15���ַ�)</span><br />
</div>
   <div>
   <label for="confirm_password">�ظ�����</label>
   <Input type="password" name="password" onBlur="passwordver()" id="confirm_password" size="18" maxlength="15" /> 
   <span id="passwordverdify">*</span><br />
</div>
<div>
   <label for="safe">��֤��:</label><img onClick="reloadcode()" title="�����һ��" id="safecode" src="securitycode.jsp">
   <Input type="text" name="securitycode" id="securitycode" size="18" maxlength="15" /><span id="safecodever"></span> 
	<br/>
</div>
   <div>
   <label for="AgreeToTerms">ͬ���������</label>
   <input type="checkbox" name="AgreeToTerms" onClick="agree();" id="AgreeToTerms" value="0"/> 
   <a href="#"  title="���Ƿ�ͬ���������">�ȿ������</a> *  </div>    
   <div class="enter">
   <input name="create791"  type="submit" class="buttom" disabled="disabled" id="regsubmit" onClick="return registerver()" value="�ύ" />
   <input name="Submit" type="reset" class="buttom" value="����" />
</div>
   <p><strong>*���ύ����ע����Ϣʱ, ������Ϊ���Ѿ�ͬ�������ǵķ�������.</strong></p>  
</fieldset>
</form>

</div>
</div>
<%@ include file="buildweb/footer.txt"%>
</HTML>