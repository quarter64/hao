<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String id=request.getParameter("id");
String time=request.getParameter("time");

//String email="lulu@zwx.com";
//String id="13";
//String time="5.54";
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e){}
try
{ 
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	
	String idresult="";
	String timeresult="";	
	Statement sql=con.createStatement();
	String condition="SELECT id,time FROM timecount where email='"+email+"'";
	ResultSet rs=sql.executeQuery(condition);
	while(rs.next())
	{ 
		idresult = rs.getString("id");
		timeresult = rs.getString("time");
	}
	String condition1 = "INSERT INTO timecount (email,id,time) VALUES (?,?,?)  ON DUPLICATE KEY UPDATE id=?,time=?";
	//String condition1 = "INSERT INTO timecount (id,time) VALUES ("+id+","+time+")  ON DUPLICATE KEY UPDATE id="+idresult+id+",time="+timeresult+time;
	PreparedStatement pstmt = con.prepareStatement(condition1);
	pstmt.setString(1,email);
	pstmt.setString(2,id);
	pstmt.setString(3,time);
	pstmt.setString(4,idresult+","+id);
	pstmt.setString(5,timeresult+","+time);
	pstmt.executeUpdate();
	con.close();
}
catch(SQLException e)
{}

%>