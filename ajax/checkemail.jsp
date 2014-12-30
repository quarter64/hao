<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.ResultSet" %>

<%
String email=request.getParameter("email");//验证端获取的邮箱
Connection con=null;
Statement sql=null;
ResultSet rs=null;

	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{
		con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
		
		
		String condition="SELECT email FROM user WHERE email = ?";
		PreparedStatement pstmt = con.prepareStatement(condition);
 		pstmt.setString(1,email);
 		rs = pstmt.executeQuery();
		
		String email1;
		if(!(rs.next()))
		{
			out.print("<font color='#6fc670'>邮箱可用!</font>");
		}
		else
		{
			out.print("<font color='#f09085'>此邮箱已经注册!</font>");
		}
	con.close();
	}
	catch(SQLException e)
	{
		out.print(e);
	}

%>