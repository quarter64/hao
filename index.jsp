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
search_box form 
{ 
	margin: 0; 
} 
#search_box 
{ 
	width: 201px; 
	height: 31px; 
	background: url(WEB/images/bg_search_box.gif); 
} 
#search_box #s 
{ 
	float: left; 
	padding: 0; 
	margin: 6px 0 0 6px; 
	border: 0; 
	width: 159px; 
	background: none; 
	font-size: .8em; 
} 
#search_box #go 
{ 
	float: right; 
	margin: 3px 4px 0 0; 
} 
</style> 
</head>
<BODY>

<%@ include file="buildweb/index_head.txt"%>

<div style="position:absolute;top:70px;left:-2px;right:0px;background-image:url(WEB/images/index_bg.jpg);font-family:'微软雅黑'; font-size:0.8em;">

<table border='0' width='100%'><tr><td align='center'><!-- 最外层表格,使所有body内容居中 -->

<%@ include file="buildweb/index_powerpoint.txt"%><!-- 头部幻灯片 -->

<div id="search_box"> 
<form id="search_form" method="post" action="searchresult.jsp"> 
<input type="text" id="s" name="search" value="Search" class="swap_value" /> 
<input type="image" src="WEB/images/btn_search_box.gif" width="27" height="24" id="go" alt="Search" title="Search" /> 
</form> 
</div>

<hr style="color:#fe4500;">
</div>
<%! // 声明一个共享的连接对象：
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
//数据挖掘
String useremail="";
useremail = login.getLogname();

String userclass="";
if(useremail != "")
{
	Statement sql;
	ResultSet rs;
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{ 
		Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
		sql=con.createStatement();
		String condition="SELECT class FROM user where email='"+useremail+"'";
		rs=sql.executeQuery(condition);
		while(rs.next())
		{ 
			userclass = rs.getString("class");
		}
		con.close();
	}
	catch(SQLException e)
	{}
}



int nowpage=1;//当前页码
Statement sql=null;
//Statement sql2=null;

ResultSet rs=null;
//ResultSet rs2=null;
int rowCount=0; // 总的记录数。
// 第一个客户负责建立连接对象：

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

		rs=sql.executeQuery("select count(*) from goods");
		while(rs.next())
		{   
			rowCount = Integer.parseInt(rs.getString(1));
		}
		//rs=sql.executeQuery("SELECT id,email,goodsname,detail,picture,price,class FROM goods where exist>1 order by id desc");// 返回可滚动的结果集。
		//rs.last();// 将游标移动到最后一行。
		//int number=rs.getRow();// 获取最后一行的行号。

		//rowCount=number; // 获取记录数。
		handlePage.setPageSize(18); // 设置每页显示的记录数。
		handlePage.setPageCount(rowCount,handlePage.getPageSize());// 计算总页数。
//		out.print(" 共有"+handlePage.getPageCount()+"页，");
//		out.print(" 每页显示"+ handlePage.getPageSize()+"条记录");

		String s=request.getParameter("page");

		if(s==null)
		{	
			s="1";
		}
			
		nowpage=Integer.parseInt(s);
		if(nowpage>handlePage.getPageCount())
		{
			nowpage=handlePage.getPageCount();
		}
			
		if(nowpage<=0)
		{
			nowpage=1;
		}
		int datastart = ((nowpage-1)*18)+0;
		int dataend = nowpage*18;
		String space=""+datastart+","+dataend;
		//out.print("SELECT id,email,goodsname,detail,picture,price,class FROM goods where exist>1 order by id desc limit "+space);
		//rs=sql.executeQuery("SELECT id,email,goodsname,detail,picture,price,class FROM goods where exist>1 order by id desc limit "+space);
		rs=sql.executeQuery("SELECT id,email,goodsname,detail,picture,price,class FROM goods where exist>1 order by class='"+userclass+"' desc limit "+space);
		//out.print("SELECT id,email,goodsname,detail,picture,price,class FROM goods where exist>1 order by class='"+userclass+"' desc limit "+space);
		rs.absolute(1);//光标指向下一行
		showList(rs,out,handlePage.getPageSize());
		
	con.close();	
	}
	catch(SQLException e)
	{
		out.print(e);
	}

%>

<%-- 显示页码 --%>
<%@ include file="buildweb/index_showpage.txt"%>
<%@ include file="buildweb/footer.txt"%>
</td></tr></table> <!--为使底部信息正常显示-->
</BODY>
</HTML>