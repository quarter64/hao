<%
/*
*Date 2013/10/30
*author zwx
*brief 主页
*note 展示所有信息 
*data goods.id=>goods* goodsemail=>usermessage 
*copyright Copyright(c) 2013 转易
*/
%>

<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="pagesplit.PageNumber" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="handlePage" class="pagesplit.PageNumber" scope="session" >
</jsp:useBean>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<HTML>
<body>
<% 
Connection con=null;
Statement sql;
ResultSet rs;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e)
	{
		out.print(e);
	}
	try
	{
		con=DriverManager.getConnection("jdbc:mysql://sqld.duapp.com:4050/FUPpBgzWklGxuWIPjVAf","FpfVrROVNuLXvwwH3MDIlpxl","xfls6mGEXTsr1SZdGdN4ewwgDnz1rem5");
		//con=DriverManager.getConnection("jdbc:odbc:shop","","");
		sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);

		rs=sql.executeQuery("SELECT * FROM user");
		while(rs.next())
		{   
			out.print(rs.getString(1));
		}
	}
	catch(SQLException e)
	{
		out.print(e);
	}
%>
</BODY>
</HTML>