<%
/*
*Date 2013/11/01
*author zwx 
*brief �����Ϣ  �����Щ���� ֻ��ʾ20����Ϣ   ��Ϣ��ʾû��prepareStatement
*note <0��Ǹ���Ʒ��û���� 
*copyright Copyright(c) 2013 ת��
*/
%>

<%@ page contentType="text/html;charset=GB2312" %>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="user.BuyGoods" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<jsp:useBean id="buy" class="user.BuyGoods" scope="session" >
</jsp:useBean>
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

function verphone()
{
	var s = "<table><tr><td align='center' width='350'>�����µĵ绰����:<br><br><FORM action='buygoods.jsp' Method='post'><Input name='varphone'><br><br><input type='submit' value='ȷ���޸�' style='font-family:΢���ź�;font-size:1.0em;border:none;width:100px;height:30px;color:#ffffff;background:#b87337'></FORM></td></tr></table>";
	$.jBox(s,'jBox');
}
</script>
<style type="text/css">

A.table:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*��ɫ4A5C6C*/}
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
<a href="salegoods.jsp" class="j"><font size=+1>�ҷ����Ķ���</font></a>
<table border='0' width='100%' bgcolor=#fef4f5><tr><td align=center>

<%
//String str=response.encodeURL("myorderform.jsp");

String logname=login.getLogname();
String email = codeString(logname);



String id1=request.getParameter("id");
String dont=request.getParameter("dont");
String my=request.getParameter("my");
String del=request.getParameter("del");
String varphone=request.getParameter("varphone");


if(varphone==null)
{
	varphone="";
}
if(dont==null)
{
	dont="";
}
if(my==null)
{
	my="";
}
if(id1==null)
{
	id1="";
}
if(del==null)
{
	del="";
}


if(!(varphone.equals("")))//�޸ĵ绰//�޸ĺ�ˢ��
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
		
		String condition="UPDATE usermessage SET phone=? where email=?";
		PreparedStatement pstmt = con.prepareStatement(condition);
 		pstmt.setString(1,varphone);
		pstmt.setString(2,email);
 		pstmt.executeUpdate();
//		
//		
//		sql=con.createStatement();
//		String condition="UPDATE usermessage SET phone='"+varphone+"' where email='"+email+"'";
//		sql.executeUpdate(condition);
		response.sendRedirect("buygoods.jsp");//�޸ĺ�ˢ��
		con.close();
	}
	catch(SQLException e)
	{}
}
if(!(del.equals("")))//ɾ��buygoods����
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
		
		String condition="delete from buygoods where id=?";
		PreparedStatement pstmt = con.prepareStatement(condition);
 		pstmt.setString(1,del);
 		pstmt.executeUpdate();
		con.close();
	}
	catch(SQLException e)
	{}
}


if(!(dont.equals("")))//�Ҳ�Ҫ�� �Żػ��� exist+=1 
{
	Statement sql,sql1;
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{ 
		Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
		/*sql=con.createStatement();
		String condition="UPDATE goods SET exist=exist+1 where id="+dont;
		sql.executeUpdate(condition);*///����������Ʒ
		
		String condition1="delete from buygoods where id=?";
		PreparedStatement pstmt = con.prepareStatement(condition1);
 		pstmt.setString(1,dont);
 		pstmt.executeUpdate();
		con.close();
	}
	catch(SQLException e)
	{
		out.print(e);
	}
}


if(!(my.equals("")))//��Ҫ�� history=0 �Ѿ��ɽ�
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
		
		String condition="UPDATE buygoods SET history=history-1 where id=?";
		PreparedStatement pstmt = con.prepareStatement(condition);
 		pstmt.setString(1,my);
 		pstmt.executeUpdate();

		con.close();
	}
	catch(SQLException e)
	{}
}



if(!(id1.equals("")))//����Ǵ�index���ӽ�������ִ�����д���
{
	id1 = codeString(id1);
	%>
	<jsp:setProperty name="buy" property="id" value="<%=id1%>"/>
	<jsp:setProperty name="buy" property="email" value="<%=email%>"/>
	<%
	String ms = buy.insertOrderForm();
	out.print(ms);
	//out.print(success);
}



//����Ϊ������Ϣ��ʾ

try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e){}
try
{ 
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	
	
	String condition="SELECT email,name,sex,age,phone,address FROM usermessage where email=?";;
	PreparedStatement pstmt = con.prepareStatement(condition);
 	pstmt.setString(1,email);
 	ResultSet rs=pstmt.executeQuery();
	
	
//	Statement sql=con.createStatement();
//	String condition="SELECT email,name,sex,age,phone,QQ FROM usermessage where email='"+email+"'";
//	ResultSet rs=sql.executeQuery(condition);		
	while(rs.next())
	{ 	
		String age = rs.getString("age");
		
		Calendar now = Calendar.getInstance();
		int time = now.get(Calendar.YEAR);
		int c = Integer.parseInt(age);//����ǿ��ת��
		time = time-c;
		
		String name = rs.getString("name");
		String sex = rs.getString("sex");
		String phone = rs.getString("phone");
		String QQ = rs.getString("address");
%>
</br>
<font size=+1 color=#103e3c>�ҵ���Ϣ</font>
<table width="650" border="0" cellspacing="6" cellpadding="0">
  <tr>
    <td>
		<table width="250" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td bgcolor="#CECFAD" height="10">�û���</td>
      		</tr>
     	 	<tr>
        		<td bgcolor="#EFEBDE" height="50"><font color=#999999><%=name%></font></td>
      		</tr>
    	</table>
	</td>
    <td>
		<table width="200" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td bgcolor="#CECFD6" height="10">����</td>
      		</tr>
      		<tr>
        		<td bgcolor="#F7F3F7" height="50"><font color=#999999><%=time%></font></td>
      		</tr>
    	</table>
	</td>
	 <td>
		<table width="200" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td bgcolor="#CECFAD" height="10">�Ա�</td>
      		</tr>
      		<tr>
        		<td bgcolor="#F7F3F7" height="50"><font color=#999999><%=age%></font></td>
      		</tr>
    	</table>
	</td>
  	</tr>
 	<tr>
    <td>
		<table width="250" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td bgcolor="#ADD3A5" height="20">��������</td>
      		</tr>
      		<tr>
        		<td bgcolor="#E7EFDE" height="50"><font color=#999999><%=email%></font></td>
      		</tr>
    	</table>
	</td>
    <td>
		<table width="200" border="0" cellspacing="0" cellpadding="0">
      	<tr>
        	<td bgcolor="#ADD3A5" height="20">QQ</td>
      	</tr>
      	<tr>
        	<td bgcolor="#E7EFDE" height="50"><font color=#999999><%=QQ%></font></td>
      	</tr>
    	</table>
	</td>
	 <td>
		<table width="200" border="0" cellspacing="0" cellpadding="0">
      	<tr>
        	<td bgcolor="#ADD3A5" height="20">�绰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       	
        	<font size='+1' color=#b87337 onclick='verphone()'>����޸�</font>
   			</td>
      	</tr>
      	<tr>
        	<td bgcolor="#E7EFDE" height="50"><font color=#999999><%=phone%></font></td>
      	</tr>
    	</table>
	</td>
  </tr>
</table>
<%
	}
con.close();
}
catch(SQLException e)
{}

%>
<font size=+1 color=#103e3c>�ȴ��������Ʒ:</font>
<table class="altrowstable" id="alternatecolor">
	<tr>
		<th align="center">ͼƬ</th>
		<th align="center">����</th>
		<th align="center">��Ʒ����</th>
		<th align="center">��ϸ����</th>
		<th align="center">�۸�</th>
		<th align="center">����</th>
		<th align="center" width="150px">����</th>
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
	int i = 0;//ֻ��ʾ20��
	String id = "";
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	
//	String condition="SELECT id FROM buygoods where email=? and history=1";
//	PreparedStatement pstmt = con.prepareStatement(condition);
// 	pstmt.setString(1,email);
// 	rs=pstmt.executeQuery();
	
	
	
	sql=con.createStatement();
	String condition="SELECT id FROM buygoods where email=\"'"+email+"'\" and history=1";
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
			String picturearray[] = picture.split("<#");//�ָ�ͼƬ��ַ��������һ��ͼƬ����
			String pictureaddress = picturearray[0];//ȡ��ͼƬ���
			out.print("<td align='center'><a href=goodsshow.jsp?id="+id+"><img src='images/"+pictureaddress+"' height='108' width='138' style='border:6px #FFFFFF solid;'></a></td>");
			
			out.print("<td align='center'>"+rs1.getString("name")+"</td>");
			out.print("<td align='center'><a class='table' href=goodsshow.jsp?id="+id+">"+rs1.getString("goodsname")+"</a></td>");
			
			
			String subdetail = rs1.getString("detail");//��ȡdetail��ֻ������ҳ����ʾ30����
			int lendetail = subdetail.length();//��ȡ����
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
		
			out.print("<FORM action='buygoods.jsp' Method='post'><Input type='hidden' name='dont' value="+id+">");
			out.print("<td align='center'><input type='submit' value='�Ҳ�Ҫ��' id='dontneed' name='g' style='font-family:΢���ź�;font-size:1.0em;border:none;width:100px;height:30px;color:#ffffff;background:#b87337'></br></br>");
			out.print("</FORM>");
			
			out.print("<FORM action='buygoods.jsp' Method='post'><Input type='hidden' name='my' value="+id+">");
			out.print("<input type='submit' value='�����ҵ���' name='g' style='font-family:΢���ź�;font-size:1.0em;border:none;width:100px;height:30px;color:#ffffff;background:#c21c00'>");
			out.print("</FORM><td></tr>");
		}
	}
	out.print("</Table>");
	con.close();

}
catch(SQLException e)
{}


%>
<font size=+1 color=#103e3c>���׳ɹ�����Ʒ:</font>
<table class="altrowstable" id="alternatecolor">
	<tr>
		<th align="center">ͼƬ</th>
		<th align="center">����</th>
		<th align="center">��Ʒ����</th>
		<th align="center">��ϸ����</th>
		<th align="center">�۸�</th>
		<th align="center">����</th>
		<th align="center" width="150px">����</th>
	</tr>
	<tr>
<%
try
{ 
	int i=0;//ֻ��ʾ20��
	String id = "";
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	sql=con.createStatement();
	String condition="SELECT id FROM buygoods where email=\"'"+email+"'\" and history=0";
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
			String picturearray[] = picture.split("<#");//�ָ�ͼƬ��ַ��������һ��ͼƬ����
			String pictureaddress = picturearray[0];//ȡ��ͼƬ���
			out.print("<td align='center'><a href=goodsshow.jsp?id="+id+"><img src='images/"+pictureaddress+"' height='108' width='138' style='border:6px #FFFFFF solid;'></a></td>");
			
			out.print("<td align='center'>"+rs1.getString("name")+"</td>");
			out.print("<td align='center'><a class='table' href=goodsshow.jsp?id="+id+">"+rs1.getString("goodsname")+"</a></td>");
			
			
			String subdetail = rs1.getString("detail");//��ȡdetail��ֻ������ҳ����ʾ30����
			int lendetail = subdetail.length();//��ȡ����
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
			
			out.print("<FORM action='buygoods.jsp' Method='post'><Input type='hidden' name='del' value="+id+">");
			out.print("<td align='center'><input type='submit' value='ɾ����¼(�˲������ɻָ�)' onclick=demo() name='g' style='font-family:΢���ź�;font-size:1.0em;border:none;width:150px;height:30px;color:#ffffff;background:#838383'></br></br>");
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