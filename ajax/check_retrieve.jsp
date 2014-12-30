<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
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
<%
String logname="";
String password="";
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

Statement sql;
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e){}
try
{ 

	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	String condition="UPDATE user SET password=? where email=?";
	PreparedStatement pstmt = con.prepareStatement(condition);
 	pstmt.setString(1,password);
 	pstmt.setString(2,logname);
 	pstmt.executeUpdate();
	out.print("ok");
	con.close();
}
catch(SQLException e)
{}
%>