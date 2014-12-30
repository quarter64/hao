<!DOCTYPE HTML>

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="pagesplit.PageNumber" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="handlePage" class="pagesplit.PageNumber" scope="session" >
</jsp:useBean>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<%
String id="";
String time="";
Statement sql=null;
ResultSet rs=null;
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e)
{
	out.print(e);
}
try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	rs=sql.executeQuery("SELECT * FROM timecount where email='lulu@zwx.com'");
	while(rs.next())
	{
		id = rs.getString("id");
		time = rs.getString("time");
	}
}
catch(SQLException e)
{
	out.print(e);
}
String idlist[] = id.split(",");
String timelist[] = time.split(",");

String[][] numfour=new String[idlist.length][2]; 
for(int i=0;i<idlist.length;i++)
{
	int count=1;
	for(int j=0;j<idlist.length;j++)
	{
		if(idlist[i].equals(idlist[j]))
		{
			count+=1;
			if(i == 0)
			{
				out.print("j=0");
				numfour[i][0] = idlist[i];
			}
		}
		else
		{
			numfour[i][0] = idlist[i];
		}
	}
	String c=count+"";
	numfour[i][1] = c;
}

/*
for(int i=0;i<numfour.length;i++)
{
	for(int j=0;j<2;j++)
	{
		if(numfour[i][j].equals)
		{
			s.add(numfour[i][j]);
		}
	}
}
*/
for(int i=0;i<numfour.length;i++)
{
	out.print(numfour[i][0]+",");
	out.print(numfour[i][1]+"<br>");
}
%>
