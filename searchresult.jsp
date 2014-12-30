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

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="pagesplit.PageNumber" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="handlePage" class="pagesplit.PageNumber" scope="session" >
</jsp:useBean>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<HTML>
<head><script src="WEB/js/index_point.js"></script>

<style type="text/css">
A.table:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*灰色4A5C6C*/}
a.table:visited {color:#4A5C6C}
a.table:hover {color:#6fc670; text-decoration:none;}
</style>

</head>
<BODY>

<%@ include file="buildweb/index_head.txt"%>

<div style="position:absolute;top:70px;left:-2px;right:0px;background-image:url(WEB/images/index_bg.jpg);font-family:'微软雅黑'; font-size:0.8em;">

<table border='0' width='100%'><tr><td align='center'><!-- 最外层表格,使所有body内容居中 -->

<%@ include file="buildweb/index_powerpoint.txt"%><!-- 头部幻灯片 -->

<hr style="color:#fe4500;">
<div>
<%! // 声明一个共享的连接对象：
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

Connection con=null;
String saleemail="";
Statement sql1;
ResultSet rs1;
// 显示数据库记录的方法：
public void showList(ResultSet rs,javax.servlet.jsp.JspWriter out,int n)throws Exception//,String buybook)
{
	try
	{
		out.print("<table border='0'><tr align='center' height='280px'>");
		for(int i=0;i<n;i++)
		{ 
			if(i%6==0 && i!=0)
			{
				out.print("</tr><tr align='center' height='280px'>");//只有在下一个<tr>标签显示之前才关闭上一个<tr>
			}
			out.print("<td width='180px'><table border='0' height='250px' width='160px'");
			if(i%3==1)
			{
				out.print("background='WEB/images/index_1.png'>");
			}
			if(i%3==2)
			{
				out.print("background='WEB/images/index_2.png'>");
			}
			if(i%3==0)
			{
				out.print("background='WEB/images/index_3.png'>");
			}
			out.print("<tr align='center' height='210px'>");
			saleemail = rs.getString("email");
			out.print("<td valign='top'><font color='#eaf5df' size='+2'><a href=goodsshow.jsp?id="+rs.getString("id")+">"
			+rs.getString("goodsname")+"</font><BR>");
			
			String picture = rs.getString("picture");
			String picturearray[] = picture.split("<#");//分割图片地址，获得最后一张图片名称
//			int pictureaddresslen = picturearray.length;       //取得长度
//			for (int k=0;k<pictureaddresslen;k++)
//			{
			String pictureaddress = picturearray[0];//取得图片序号
			out.print("<img src='images/"+pictureaddress+"' height='108' width='138' border='4'></a><BR>");
//			}
			out.print("价格："+rs.getString("price")+"<BR>");
			
			String subdetail = rs.getString("detail");//获取detail，只允许在页面显示30个字
			int lendetail = subdetail.length();//获取长度
			if (lendetail<30)
			{
				out.print("<font color='#eaf5df' size='-1'>"+subdetail+"</font></td></tr>");
			}
			else
			{
				subdetail = subdetail.substring(0,30);
				out.print("<font color='#eaf5df' size='-1'>"+subdetail+"...</font></td></tr>");
			}
			//out.print("<TD >"+rs.getString("class")+"</TD>");
		
			sql1=con.createStatement();
			String condition1="SELECT name FROM usermessage where email='"+saleemail+"'";
			rs1=sql1.executeQuery(condition1);
			while(rs1.next())
			{
				out.print("<tr height='23px'><td>提供者："+rs1.getString("name")+"</td></tr></table></td>");
			}
			rs.next();
		}
		out.print("</tr></table>");

	}
	catch(Exception e)//保持最后一个页面完整 
	{
		out.print("<td valign='top'><font color='#eaf5df' size='+2'>关于我们</td><td>你知道吗，你每一次页面业务的操作我们都会记录，作为改善服务的依据，使我们能更好的给你提供优质的服务！</td></tr></table></tr></table>");	
	}
}
%>
<% 

String search=request.getParameter("search");//搜索上传关键字
search = codeString(search);

Statement sql=null;
ResultSet rs=null;
int rowCount=0; // 总的记录数。
// 第一个客户负责建立连接对象：
if(con==null)
{ 
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
		con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
		//con=DriverManager.getConnection("jdbc:odbc:shop","","");
		sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs=sql.executeQuery("SELECT id,email,goodsname,detail,picture,price,class FROM goods where goodsname LIKE '%"+search+"%' and exist>1 order by id desc");// 返回可滚动的结果集。
		rs.last();// 将游标移动到最后一行。
		int number=rs.getRow();// 获取最后一行的行号。
		if(number == 0)
		{
			out.print("没有找到相关信息，可能是还没有人发布过此种商品。<a href='index.jsp' class='table'>返回首页</a>");
		}
		else
		{
			out.print("共找到相关信息"+number+"条!<a href='index.jsp' class='table'>返回首页</a>");
		}
		rowCount=number; // 获取记录数。
		handlePage.setPageSize(18); // 设置每页显示的记录数。
		handlePage.setPageCount(rowCount,handlePage.getPageSize());// 计算总页数。
//		out.print(" 共有"+handlePage.getPageCount()+"页，");
//		out.print(" 每页显示"+ handlePage.getPageSize()+"条记录");
	}
	catch(SQLException e)
	{
		out.print(e);
	}
}
// 其它客户通过同步块使用这个连接：
else
{ 
	synchronized(con)
	{ 
		try 
		{
			sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=sql.executeQuery("SELECT id,email,goodsname,detail,picture,price,class FROM goods where goodsname LIKE '%"+search+"%' and exist>1 order by id desc"); // 返回可滚动的结果集。
			rs.last(); // 将游标移动到最后一行。
			int number=rs.getRow();// 获取最后一行的行号。
			if(number == 0)
			{
				out.print("没有找到相关信息，可能是还没有人发布过此种商品。<a href='index.jsp' class='table'>返回首页</a>");
			}
			else
			{
				out.print("共找到相关信息"+number+"条!<a href='index.jsp' class='table'>返回首页</a>");
			}
			rowCount=number; // 获取记录数。
			handlePage.setPageSize(18); // 设置每页显示的记录数。
			handlePage.setPageCount(rowCount,handlePage.getPageSize());// 计算总页数。
//			out.print(" 每页显示"+ handlePage.getPageSize()+"条记录");
		}
		catch(SQLException e)
		{
			out.print(e);
		}
	}
}
%>
<% // 获取表单提交的信息：

//数据挖掘
String logname=login.getLogname();
String email = codeString(logname);
String goodsclass = rs.getString("class");
if(!(email.equals("")))
{
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{ 
		Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
		
		String condition="UPDATE user SET class=? where email=?";
		PreparedStatement pstmt = con.prepareStatement(condition);
		pstmt.setString(1,goodsclass);
		pstmt.setString(2,email);
		pstmt.executeUpdate();
		con.close();
	}
	catch(SQLException e)
	{}
}


//搜索信息加入usersearchkeyword
try
{ 
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	
	String searchresult="";
	String goodsclassresult="";
	Statement sql2=con.createStatement();
	String condition2="SELECT searchkeyword,searchkeywordclass FROM usersearchkeyword where email='"+email+"'";
	ResultSet rs2=sql2.executeQuery(condition2);
	while(rs2.next())
	{ 
		searchresult = rs2.getString("searchkeyword");
		goodsclassresult = rs2.getString("searchkeywordclass");
	}
	//String condition="UPDATE user SET class=? where email=?";
	//String condition3 = "INSERT INTO usersearchkeyword (email,searchkeyword,searchkeywordclass) VALUES ('"+email+"','"+search+"','"+goodsclass+"')  ON DUPLICATE KEY UPDATE searchkeyword='"+searchresult+search+"',searchkeywordclass='"+goodsclassresult+goodsclass+"'";
	//out.print(condition3);
	String condition = "INSERT INTO usersearchkeyword (email,searchkeyword,searchkeywordclass) VALUES (?,?,?)  ON DUPLICATE KEY UPDATE searchkeyword=?,searchkeywordclass=?";
	PreparedStatement pstmt = con.prepareStatement(condition);
	pstmt.setString(1,email);
	pstmt.setString(2,search);
	pstmt.setString(3,goodsclass);
	pstmt.setString(4,searchresult+","+search);
	pstmt.setString(5,goodsclassresult+","+goodsclass);
	pstmt.executeUpdate();
	con.close();
}
catch(SQLException e)
{}


try
{
	Statement sqlstr=null;
	ResultSet res=null;
	Connection con1=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	sqlstr=con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	res=sqlstr.executeQuery("SELECT name FROM count where name='"+search+"'");
	if(res.next())
	{
		String condition="UPDATE count SET value=value+1 where name=?";
		PreparedStatement pstmt = con1.prepareStatement(condition);
 		pstmt.setString(1,search);
 		pstmt.executeUpdate();
		con1.close();
	}
	else
	{
		String condition="INSERT INTO count (name,value) VALUES (?,?)";
		PreparedStatement pstmt = con1.prepareStatement(condition);
 		pstmt.setString(1,search);
		pstmt.setFloat(2,1);
		pstmt.executeUpdate();
		con1.close();
	}
}
catch(SQLException e)
{}


String s=request.getParameter("page");

if(s==null)
{	
	s="1";
}
if(s.equals("next"))
{ 
	int n=handlePage.getShowPage(); // 获取目前的页数。
	n=(n+1); // 将页数增1。
	if(n>handlePage.getPageCount())
	{ 
		n=1;
	}
	handlePage.setShowPage(n); // 显示该页。
//	out.print(" 目前显示第"+handlePage.getShowPage()+"页");
	// 将游标移到：
	rs.absolute((n-1)*handlePage.getPageSize()+1);
	showList(rs,out,handlePage.getPageSize());// 显示第该页的内容。
}
else if(s.equals("previous"))
{ 
	int n=handlePage.getShowPage(); // 获取目前的页数。
	n=(n-1); // 将页数减1。
	if(n<=0)
	{ 
		n=handlePage.getPageCount();
	}
	handlePage.setShowPage(n); // 显示该页。
//	out.print(" 目前显示第"+handlePage.getShowPage()+"页");
	rs.absolute((n-1)*handlePage.getPageSize()+1); // 移动游标。
	showList(rs,out,handlePage.getPageSize());// 显示第该页的内容。
}
else
{ 
	int m=Integer.parseInt(s);
	if(m>handlePage.getPageCount())
	{
		m=1;
	}
	handlePage.setShowPage(m);
//	out.print(" 目前显示第"+handlePage.getShowPage()+"页");
	int n=handlePage.getShowPage();
	rs.absolute((n-1)*handlePage.getPageSize()+1); // 移动游标。
	showList(rs,out,handlePage.getPageSize());// 显示该页的内容。
}

%>

<%-- 显示页码 --%>

<%@ include file="buildweb/footer.txt"%>
</td></tr></table> <!--为使底部信息正常显示-->
</BODY>
</HTML>