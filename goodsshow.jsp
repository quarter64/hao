<%
/*
*Date 2013/10/30
*author zwx
*brief ��Ʒ��ϸ��Ϣ 
*note id������Ʒ��Ϣ,ͨ��emailչʾ������Ϣ 
*data goods.id=>goods* goodsemail=>usermessage 
*copyright Copyright(c) 2013 ת��
*/
%>

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<HTML>
<script type="text/javascript" src="WEB/jBox/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="WEB/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="WEB/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link type="text/css" rel="stylesheet" href="WEB/jBox/Skins/Default/jbox.css"/>
<head>
</head>
<BODY onUnload="gbz()" bgcolor="#ebebeb">
<%@ include file="buildweb/goodsshow_head.txt"%>


<table border="0" width="100%"><tr><td align="center">
<div>
<style type="text/css">
#div1 { width:300px; height:300px; position:relative; margin:30px auto 0px;}
#div1 img{width:300px; height:300px;}
#div1 span { width:100px; height:100px; background:red; left:0px;top:0px; position:absolute; display:none; filter:alpha(opacity:20); opacity:0.2;}
.show { width:100%; height:100%; background:red; position:absolute; z-index:10px; filter:alpha(opacity:10); opacity:0.1; left:0px; top:0px; }
#div2 {width:300px; height:300px; position:absolute;top:145px;left:12px;display:none; overflow:hidden; margin:0px auto 0px;}
#img1 { position:absolute;}
A.message:link {color:#4A5C6C;text-decoration:none;}
a.message:visited {color: blue}
</style>
<script type="text/javascript">
window.onload=function ()
{
	var oDiv=document.getElementById('div1');
	var oShow=oDiv.getElementsByTagName('div')[0];
	var oSpan=oDiv.getElementsByTagName('span')[0];
	var oImg=document.getElementById('img1');
	oShow.onmouseover=function()
	{
		oSpan.style.display='block';
		oImg.parentNode.style.display='block';
	};
	oShow.onmouseout=function()
	{
		oSpan.style.display='none';
		oImg.parentNode.style.display='none';
	};
	oShow.onmousemove=function(ev)
	{
		var oEvent=ev||event;
		var x=oEvent.clientX-oDiv.offsetLeft-oSpan.offsetWidth/2;
		var y=oEvent.clientY-oDiv.offsetTop-oSpan.offsetHeight/2;
		
		if(x<0)
		{
			x=0;
		}
		else if(x>oShow.offsetWidth-oSpan.offsetWidth)
		{
			x=oShow.offsetWidth-oSpan.offsetWidth;
		}
		if(y<0)
		{
			y=0;
		}
		else if(y>oShow.offsetHeight-oSpan.offsetHeight)
		{
			y=oShow.offsetHeight-oSpan.offsetHeight
		}
		
		oSpan.style.left=x+'px';
		oSpan.style.top=y+'px';
		var percentX=x/(oShow.offsetWidth-oSpan.offsetWidth);
		var percentY=y/(oShow.offsetHeight-oSpan.offsetHeight);
		var oImgparent=oImg.parentNode;
		oImg.style.left=-percentX*(oImg.offsetWidth-oImgparent.offsetWidth)+'px';
		oImg.style.top=-percentY*(oImg.offsetHeight-oImgparent.offsetHeight)+'px';
	};
};
</script>
<script language="javascript" type="text/javascript">
function changeImg(image)
{
	document.image_name.src=image;
	document.image_name1.src=image;
}
function demo(name,phone,qq)
    {
	$.jBox("<div align='center'><font size='+1' color=#fda000>��ϵ����</font></br><font color=#fda000>�绰:</font>"+phone+"&nbsp;&nbsp;&nbsp;<font color=#fda000>QQ:</font>"+qq+"</div></br>�Ƽ�ѯ����:</br>����,����ת�������п����㷢����"+name+"���ܷ���ʱ������棬������̸�£�</br></br></br><div align=center><a href='register.jsp' class='message'>ע���Ա</a>����ø���ѯ�����</div>", 'jBox');
	}
</script>
<%
String buygoods=response.encodeURL("buygoods.jsp");
String num = request.getParameter("id"); //��ȡ��Ʒid,ȡ������


//�����ھ�
String logname=login.getLogname();
try
{ 
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	
	String numresult="";
	Statement sql3=con.createStatement();
	String condition3="SELECT showlist FROM showlist where email='"+logname+"'";
	ResultSet rs3=sql3.executeQuery(condition3);
	while(rs3.next())
	{ 
		numresult = rs3.getString("showlist");
	}
	String condition = "INSERT INTO showlist (email,showlist) VALUES (?,?)  ON DUPLICATE KEY UPDATE showlist=?";
	PreparedStatement pstmt = con.prepareStatement(condition);
	pstmt.setString(1,logname);
	pstmt.setString(2,num);
	pstmt.setString(3,numresult+","+num);
	pstmt.executeUpdate();
	con.close();
}
catch(SQLException e)
{}






Connection con=null;
Statement sql,sql1;
ResultSet rs,rs1,rs2;
String email;

	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
	}
	catch(ClassNotFoundException e){}
	try
	{ 
		String goodsid = "";
		con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
		sql=con.createStatement();
		String condition="SELECT id,email,goodsname,detail,picture,price,class FROM goods where id="+num;
		rs=sql.executeQuery(condition);
		out.print("<table border='0' bgColor=#FFFFFF><tr><td><table width='300' height='400' border='0'><tr><tr><td align='center'><font color='#838383'><strong>");

		if(rs.next())
		{ 	
			email = rs.getString("email");//�������,ȡ��������Ϣ
			out.print(rs.getString("class"));
			out.print("</strong></font></td></tr><td align='center'><div id='div1'>");
			
			String picture = rs.getString("picture");
			String picturearray[] = picture.split("<#");//�ָ�ͼƬ��ַ��������һ��ͼƬ����
			int pictureaddresslen = picturearray.length;       //ȡ�ó���
			
			out.print("<img src='images/"+picturearray[0]+"' name='image_name' width='300' height='300'/>");
			out.print("<span></span><div class='show'></div></div><br>");
	
			for (int k=0;k<pictureaddresslen;k++)
			{
				String pictureaddress = picturearray[k];//ȡ��ͼƬ���
				//out.print("<TD ><img src='images/"+pictureaddress+"' height='108' width='138' border='4'></td>");
				out.print("<img src='images/"+pictureaddress+"' onclick=\"changeImg('images/"+pictureaddress+"')\" style='width:50px;height:50px;'/>&nbsp;");
			}
			%>
					</td>
	  			</tr>
				</table>
			</td>
			<td>
				<table width="400" height="300" border="0">
					  <tr>
						<td align="center">
			<% 
			out.print(rs.getString("goodsname"));
			out.print("</td></tr><tr><td align='top' height='50' bgcolor='#b00200'><font color='#FFFFFF'>�۸�&nbsp;&nbsp;&nbsp;<font size='+3'><strong>��");
			out.print(rs.getString("price"));
			%>
	</strong></font></font></td>
					  </tr>
					 <tr>
					 <td>
					<table width="400" height="150" border="0">
					  <tr>
						<td width="50%"><font color="#838383" size="-1">�ǳ�&nbsp;&nbsp;
			<%
			sql1=con.createStatement();
			String condition1="SELECT name,sex,age,phone,address FROM usermessage where email='"+email+"'";
			rs1=sql1.executeQuery(condition1);
			while(rs1.next())
			{
				out.print(rs1.getString("name"));
				out.print("</font></td><td width='50%'><font color='#838383' size='-1'>�Ա�&nbsp;&nbsp;");
				out.print(rs1.getString("sex"));
				out.print("</font></td> </tr><tr><td width='50%'><font color='#838383' size='-1'>QQ&nbsp;&nbsp;");
				out.print(rs1.getString("address"));
				out.print("</font></td><td width='50%'><font color='#838383' size='-1'>����&nbsp;&nbsp;");
				out.print(rs1.getString("age"));
				out.print("</font></td></tr><tr><td width='50%'><font color='#838383' size='-1'>�绰&nbsp;&nbsp;");
				out.print(rs1.getString("phone"));
				out.print("</font></td><td width='50%'>");
				out.print("<FORM action='' Method='post'><Input type='hidden' name='id' value="+num+">");
				out.print("<input type='button' value='��Ҫ��(�ο͵����)' onclick=demo('"+rs.getString("goodsname")+"','"+rs1.getString("phone")+"','"+rs1.getString("address")+"'); name='g' style='font-family:΢���ź�;font-size:1.0em;border:none;width:150px;height:30px;color:#ffffff;background:#c21c00'>");
				out.print("</Form></td></tr><tr><td><FORM action='buygoods.jsp' Method='post'><Input type='hidden' name='id' value="+num+">");
				out.print("<input type='submit' value='�ŵ��ҵ�������(��Աר��)' name='g' style='font-family:΢���ź�;font-size:1.0em;border:none;width:200px;height:30px;color:#ffffff;background:#b87337'>");
				out.print("</Form></td></tr>");
			}
			%>
			</table></td></tr>
			</td></tr></table></td></tr></table>
			<table width="50%"><tr><td aglin="center">��ϸ����</br>
			<%
			out.print(rs.getString("detail"));
			%>
			</td></tr></table>
			<%
			out.print("<div id='div2'><img name='image_name1' id='img1' src='images/"+picturearray[0]+"'/></div></div>");
		}
		else
		{
			String str=response.encodeURL("notgoods.jsp");
			response.sendRedirect(str);
		}
	con.close();
	}
	catch(SQLException e)
	{}

%>
</td></tr></table>
<%@ include file="buildweb/footer.txt"%>
</BODY>
<script src="WEB/js/jquery-1.9.1.js"></script>
<script language="javascript" type="text/javascript">
var start;
var end;
var state;
start = new Date();
$(document).ready(function() {
	$(window).unload(function() {
	end = new Date();
	state = end.getTime() - start.getTime();
	var logname="<%out.print(logname);%>";
	var num="<%out.print(num);%>";
	$.ajax({ 
	type:"POST", 
	url:"ajax/timecount.jsp", 
	data:{email:logname,id:num,time:state/1000},
	/*async: false,  
	global: false, 
	dataType:'text',
	error: function()
	{ 
		alert(error)
	}, 
	success:function(data)
	{
		alert(data);
    } */
   
       	 });
	 


	});
});
</script>
</HTML>