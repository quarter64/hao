<%
/*
*Date 2013/11/01
*author zwx 
*brief 买家信息  买过那些东西 只显示20条信息 
*note <0标记该商品已没有了 
*copyright Copyright(c) 2013 转易
*/
%>

<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="user.BuyGoods" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<jsp:useBean id="buy" class="user.BuyGoods" scope="session" >
</jsp:useBean>
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
String success=login.getSuccess();
if(success==null)
{
	success="false";
}
if(success.equals("false"))
{
	response.sendRedirect("login.jsp");
}

%>
<HTML>
<head>
<script type="text/javascript" src="WEB/jBox/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="WEB/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="WEB/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link type="text/css" rel="stylesheet" href="WEB/jBox/Skins/Red/jbox.css"/>




<script type="text/javascript">

function altRows(id)
{
    if(document.getElementsByTagName)
	{  
        var table = document.getElementById(id); 
        var rows = table.getElementsByTagName("tr"); 
        for(i = 0; i < rows.length; i++)
		{          
            if(i % 2 == 0){
                rows[i].className = "evenrowcolor";
            }
			else
			{
                rows[i].className = "oddrowcolor";
            }      
        }
    }
}
window.onload=function()
{
    altRows('alternatecolor');
}

</script>
<style type="text/css">

A.table:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*灰色4A5C6C*/}
a.table:visited {color:#4A5C6C}
a.table:hover {color:#6fc670; text-decoration:none;}

A.j:link {color:#286426; text-decoration:underline;}
a.j:visited {color:#4A5C6C; text-decoration:underline;}
a.j:hover {color:#6fc670;}

table.altrowstable 
{
    font-family: verdana,arial,sans-serif;
    font-size:11px;
    color:#333333;
    border-width: 1px;
    border-color: #a9c6c9;
    border-collapse: collapse;
}
table.altrowstable th 
{
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
table.altrowstable td 
{
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
.oddrowcolor
{
    background-color:#d4e3e5;
}
.evenrowcolor
{
    background-color:#c3dde0;
}
</style>
</head>
<BODY >
<%@ include file="buildweb/buygoods_head.txt"%>

<table border='0' width='100%' bgcolor=#fef4f5><tr><td align=center>

<%
//String str=response.encodeURL("myorderform.jsp");

String logname=login.getLogname();
String email = codeString(logname);

String dont=request.getParameter("dont");
String del=request.getParameter("del");


if(dont==null)
{
	dont="";
}
if(del==null)
{
	del="";
}


if(!(del.equals("")))//彻底删除
{
	Statement sql;
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{ 
		Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
		
		
		String condition="UPDATE salegoods SET history=history-1 where id=?";
		PreparedStatement pstmt = con.prepareStatement(condition);
 		pstmt.setString(1,del);
 		pstmt.executeUpdate();
		
		
//		sql=con.createStatement();
//		String condition="UPDATE salegoods SET history=history-1 where id="+del;
//		sql.executeUpdate(condition);
		con.close();
	}
	catch(SQLException e)
	{}
}



if(!(dont.equals("")))//出售了 sale.history=0 goods删除此件商品 加入history
{
	Statement sql,sql1,sql2,sql3;
	ResultSet rs;
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{ 
		Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
		
		
		String condition="UPDATE salegoods SET history=history-1 where id=?";
		PreparedStatement pstmt = con.prepareStatement(condition);
 		pstmt.setString(1,dont);
 		pstmt.executeUpdate();
		
		
//		sql=con.createStatement();
//		String condition="UPDATE salegoods SET history=history-1 where id="+dont;
//		sql.executeUpdate(condition);
		
		sql1=con.createStatement();
		String condition1="SELECT email,goodsname,detail,picture,price,class,ordernumber FROM goods where id="+dont;
		rs=sql1.executeQuery(condition1);
		while(rs.next())
		{ 
			String oldemail = rs.getString("email");
			String oldgoodsname = rs.getString("goodsname");
			String olddetail = rs.getString("detail");
			String oldpicture = rs.getString("picture");
			String oldprice = rs.getString("price");
			String oldclass = rs.getString("class");
			String oldordernumber = rs.getString("ordernumber");
			
//			sql2=con.createStatement();
//			String condition2="INSERT INTO history_goods (id,email,goodsname,detail,picture,price,class,ordernumber) VALUES ("+dont+",'"+oldemail+"','"+oldgoodsname+"','"+olddetail+"','"+oldpicture+"',"+oldprice+",'"+oldclass+"','"+oldordernumber+"')";
//
//			sql2.executeUpdate(condition2);
			
			
		String condition2="INSERT INTO history_goods (id,email,goodsname,detail,picture,price,class,ordernumber) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt2 = con.prepareStatement(condition2);
 		pstmt2.setString(1,dont);
		pstmt2.setString(2,oldemail);
		pstmt2.setString(3,oldgoodsname);
		pstmt2.setString(4,olddetail);
		pstmt2.setString(5,oldpicture);
		
		int price1=Integer.parseInt(oldprice);
		
		pstmt2.setFloat(6,price1);
		pstmt2.setString(7,oldclass);
		pstmt2.setString(8,oldordernumber);
 		pstmt2.executeUpdate();			
			
			
		}
		
		String condition3="delete from goods where id=?";
		PreparedStatement pstmt3 = con.prepareStatement(condition3);
 		pstmt3.setString(1,dont);
 		pstmt3.executeUpdate();
		
		
//		sql3=con.createStatement();
//		String condition3="delete from goods where id="+dont;
//		sql3.executeUpdate(condition3);
		
		con.close();
	}
	catch(SQLException e)
	{
	}
}


%>
<font size=+1 color=#103e3c>还没卖掉的商品:</font>
<table class="altrowstable" id="alternatecolor">
	<tr>
		<th align="center">图片</th>
		<th align="center">卖家</th>
		<th align="center">商品名称</th>
		<th align="center">详细介绍</th>
		<th align="center">价格</th>
		<th align="center">分类</th>
		<th align="center" width="150px">操作</th>
		<th></th>
	</tr>
	<tr>
<%
Statement sql,sql1;
ResultSet rs,rs1;
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e){}
try
{ 
	int i = 0;//只显示20条
	String id = "";
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	sql=con.createStatement();
	String condition="SELECT id FROM salegoods where email='"+email+"' and history=2";
	rs=sql.executeQuery(condition);
	while(rs.next())
	{ 
		i+=1;
		if(i>=20)
		{
			break;
		}
		id = rs.getString("id");
		sql1=con.createStatement();
		//"SELECT email,goodsname,detail,picture,price,class FROM goods where id="+id;
		String condition1="SELECT goods.email,goodsname,detail,picture,price,class,name FROM goods,usermessage where goods.email=usermessage.email and goods.id="+id;
		rs1=sql1.executeQuery(condition1);
		while(rs1.next())
		{
			String picture = rs1.getString("picture");
			String picturearray[] = picture.split("<#");//分割图片地址，获得最后一张图片名称
			String pictureaddress = picturearray[0];//取得图片序号
			out.print("<td align='center'><a href=goodsshow.jsp?id="+id+"><img src='images/"+pictureaddress+"' height='108' width='138' style='border:6px #FFFFFF solid;'></a></td>");
			
			out.print("<td align='center'>"+rs1.getString("name")+"</td>");
			out.print("<td align='center'><a class='table' href=goodsshow.jsp?id="+id+">"+rs1.getString("goodsname")+"</a></td>");
			
			
			String subdetail = rs1.getString("detail");//获取detail，只允许在页面显示10个字
			int lendetail = subdetail.length();//获取长度
			if (lendetail<10)
			{
				out.print("<td align='center'>"+subdetail+"</td>");
			}
			else
			{
				subdetail = subdetail.substring(0,10);
				out.print("<td align='center'>"+subdetail+"...</td>");
			}
			
			//out.print("<td align='center'>"+rs1.getString("detail")+"</td>");
				
			//out.print("<TD >"+"<Font size=1><img style='width:100px;height:100px;'src="+rs1.getString("picture")+"></TD>");
			//out.print("<TD >"+"<Font size=1>"+rs1.getString("picture")+"</TD>");
			out.print("<td align='center'>"+rs1.getString("price")+"</td>");
			out.print("<td align='center'>"+rs1.getString("class")+"</td>");
		
			out.print("<FORM action='salegoods.jsp' Method='post'><Input type='hidden' name='dont' value="+id+">");
			out.print("<td align='center'><input type='submit' value='已经出售了' id='dontneed' name='g' style='font-family:微软雅黑;font-size:1.0em;border:none;width:100px;height:30px;color:#ffffff;background:#b87337'></br></br>");
			out.print("</FORM><td></tr>");
		}
	}
	out.print("</Table>");
	con.close();

}
catch(SQLException e)
{}


%>
<font size=+1 color=#103e3c>交易成功的商品:</font>
<table class="altrowstable" id="alternatecolor">
	<tr>
		<th align="center">图片</th>
		<th align="center">卖家</th>
		<th align="center">商品名称</th>
		<th align="center">详细介绍</th>
		<th align="center">价格</th>
		<th align="center">分类</th>
		<th align="center" width="150px">操作</th>
	</tr>
	<tr>
<%
try
{ 
	int i=0;//只显示20条
	String id = "";
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	sql=con.createStatement();
	String condition="SELECT id FROM salegoods where email='"+email+"' and history=1";
	rs=sql.executeQuery(condition);
	while(rs.next())
	{ 
		i+=1;
		if(i>=20)
		{
			break;
		}
		id = rs.getString("id");
		sql1=con.createStatement();
		//"SELECT email,goodsname,detail,picture,price,class FROM goods where id="+id;
		String condition1="SELECT history_goods.email,goodsname,detail,picture,price,class,name FROM history_goods,usermessage where history_goods.email=usermessage.email and history_goods.id="+id;
		rs1=sql1.executeQuery(condition1);
		while(rs1.next())
		{
			String picture = rs1.getString("picture");
			String picturearray[] = picture.split("<#");//分割图片地址，获得最后一张图片名称
			String pictureaddress = picturearray[0];//取得图片序号
			out.print("<td align='center'><img src='images/"+pictureaddress+"' height='108' width='138' style='border:6px #FFFFFF solid;'></td>");
			
			out.print("<td align='center'>"+rs1.getString("name")+"</td>");
			out.print("<td align='center'>"+rs1.getString("goodsname")+"</td>");
			
			
			String subdetail = rs1.getString("detail");//获取detail，只允许在页面显示30个字
			int lendetail = subdetail.length();//获取长度
			if (lendetail<10)
			{
				out.print("<td align='center'>"+subdetail+"</td>");
			}
			else
			{
				subdetail = subdetail.substring(0,10);
				out.print("<td align='center'>"+subdetail+"...</td>");
			}
			
			//out.print("<td align='center'>"+rs1.getString("detail")+"</td>");
				
			//out.print("<TD >"+"<Font size=1><img style='width:100px;height:100px;'src="+rs1.getString("picture")+"></TD>");
			//out.print("<TD >"+"<Font size=1>"+rs1.getString("picture")+"</TD>");
			out.print("<td align='center'>"+rs1.getString("price")+"</td>");
			out.print("<td align='center'>"+rs1.getString("class")+"</td>");
		
			out.print("<FORM action='salegoods.jsp' Method='post'><Input type='hidden' name='del' value="+id+">");
			out.print("<td align='center'><input type='submit' value='删除记录(此操作不可恢复)' onclick=demo() name='g' style='font-family:微软雅黑;font-size:1.0em;border:none;width:150px;height:30px;color:#ffffff;background:#838383'></br></br>");
			out.print("</FORM></tr>");
		}
	}
	out.print("</Table>");
	con.close();
}
catch(SQLException e)
{}
%>
</td></tr></table>
<%@ include file="buildweb/footer.txt"%>
</BODY>
</HTML>