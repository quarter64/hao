<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="user.Login" %>
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
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<% // �ύ��Ϣ����֤��Ϣ�Ƿ���ȷ��
String message="",
logname="",
password="";
logname=request.getParameter("logname");
if(logname==null)
{
	logname="";
}
logname=codeString(logname);
password=request.getParameter("password");
if(password==null)
{
	password="";
}
password=codeString(password);

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
    
%>
<%
if(!(logname.equals("")))
{
	%>
	<jsp:setProperty name= "login" property="logname"
	value="<%=logname%>" />
	<jsp:setProperty name= "login" property="password"
	value="<%=password%>" />
	<%
	message=login.getMessage();
	if(message==null)
	{
		message="";
	}
}
%>
<% if(!(session.isNew()))
{ 
	if(message.equals("ok"))
	{ 
		//String str=response.encodeURL("index.jsp");
		//response.sendRedirect(str);
		out.print("ok");//��֤�ɹ�
	}
	else
	{
		out.print(message);
	}
}
%>