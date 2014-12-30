<%
/*
*Date 2013/11/14
*author zwx
*brief 卖家上传商品
*note 展示所有信息 
*data wirte goods 
*copyright Copyright(c) 2013 转易
*/
%>


<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,com.jspsmart.upload.*"%>
<%@ page import ="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="java.io.File" %>
<jsp:useBean id="login" class="user.Login" scope="session" >
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
<HTML>
<BODY >
<P>
<%
if(session.isNew())
{
	response.sendRedirect("login.jsp");
}
// 如果没有成功登录将被转向登录页面
String success=login.getSuccess();
if(success==null)
{
	success="";
}
if(success.equals(""))
{
	response.sendRedirect("login.jsp");
}
String emailname=login.getLogname();


Connection con;
Statement sql,sql1,sql2;
ResultSet rs;
int number=0;
int count=0;     //判断是否有图片
int id=0;		//id加一
String pictureaddress="";//数据库图片地址
String inttostr="";//自动生成图片名称
String savesql = "";     //加入数据库图片地址
String goodsname = "";   //产品名称
String detail = "";		 //详细介绍
String goodsclass = "";	 //产品分类
String price = "";           //价格



String newpictureaddress = "/images/";//图片上传地址
String buffernewpictureaddress = "/images/buffer/";//图片缓存地址
String delname="";//要删除的源文件

try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e){}
try
{ 
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	//String condition="INSERT INTO goods(id,email) VALUES ("+i+","+ema+")";
	String condition="select id,picture from goods";
	rs=sql.executeQuery(condition);
	rs.last();
	number=rs.getRow();	
	number = number+1;
	pictureaddress = rs.getString("picture");
	String di = rs.getString("id");
	id = Integer.parseInt(di);
	id = id+1;
	
	String picturearray[] = pictureaddress.split("<#");//分割图片地址，获得最后一张图片名称
	int pictureaddresslen = picturearray.length;       //取得长度
	pictureaddress = picturearray[pictureaddresslen-1];//取得图片序号

	
	String username = (String)session.getAttribute("upload");//是否从creategoods连接过来
	if (username == null || "".equals(username))
	{
		response.sendRedirect("creategoods.jsp");
	}
	else
	{	
		String email = emailname;
		email = email+"efbade9";
		String sarray[] = pictureaddress.split("efbade9");   
		String picturename = sarray[1];
		picturename = picturename.substring(0,9);//取出上一个文件名
		//强制转型
		int strtoint;
		strtoint=Integer.parseInt(picturename);
		//转为string
		try
		{
			SmartUpload su = new SmartUpload();
			// 上传初始化
			su.initialize(pageContext);
			su.upload();
			count = su.save("/images/buffer/");
			if(count == 0)
			{
				out.print("你还未上传图片!");
			}
			// 逐一提取上传文件信息，同时可保存文件。
			for (int i=0;i<su.getFiles().getCount();i++)
			{
				com.jspsmart.upload.File file = su.getFiles().getFile(i);
				// 若文件不存在则继续
				if (file.isMissing())continue;
				delname = delname+file.getFileName()+"<<>>>";//删除文件
				strtoint = strtoint+1;
				int strtoint1 = strtoint;
				inttostr = String.valueOf(strtoint1);
				inttostr = email+inttostr+".jpg";
				file.saveAs("/images/"+inttostr);
				
				savesql = savesql+inttostr+"<#";
				
				goodsname = su.getRequest().getParameter("goodsname");
				price = su.getRequest().getParameter("price");
				detail = su.getRequest().getParameter("detail");
				goodsclass = su.getRequest().getParameter("goodsclass");
			}
		}
		catch(Exception e)
		{
			out.print("无图片数据!!!");//刷新url时会出现
		}
	}
	if("".equals(goodsname))
	{
		out.print("没有输入产品名称!");
	}
	if("".equals(price))
	{
		out.print("没有填写价格!");
	}
	if(goodsname!="" && price!="" && count!=0)
	{
//		sql1=con.createStatement();
//		String condition1="INSERT INTO goods(id,email,goodsname,detail,picture,price,class,exist,ordernumber)VALUES("+id+",'"+emailname+"','"+goodsname+"','"+detail+"','"+savesql+"',"+price+",'"+goodsclass+"',2,'1')";
//		sql1.executeUpdate(condition1);
		int price1=Integer.parseInt(price);
		
		String condition1="INSERT INTO goods(id,email,goodsname,detail,picture,price,class,exist,ordernumber)VALUES(?,?,?,?,?,?,?,2,'1')";
		PreparedStatement pstmt = con.prepareStatement(condition1);
 		pstmt.setInt(1,id);
		pstmt.setString(2,emailname);
		pstmt.setString(3,goodsname);
		pstmt.setString(4,detail);
		pstmt.setString(5,savesql);
		pstmt.setFloat(6,price1);
		pstmt.setString(7,goodsclass);
 		pstmt.executeUpdate();
		
		
//		sql2=con.createStatement();
//		String condition2="INSERT INTO salegoods(id,email,history)VALUES("+id+",'"+emailname+"',2)";
//		sql2.executeUpdate(condition2);
		
		
		String condition2="INSERT INTO salegoods(id,email,history)VALUES(?,?,2)";
		PreparedStatement pstmt1 = con.prepareStatement(condition2);

 		pstmt1.setInt(1,id);
		pstmt1.setString(2,emailname);
 		pstmt1.executeUpdate();
		
		
		response.sendRedirect("ok.jsp?id="+id);
		//out.print("商品添加成功!");
		
		HttpSession session0=request.getSession(); //生成订单号，保存到session
		String verorderform = "zhuanyi00000"+id;
		session0.setAttribute("orderform",verorderform);//可用来获取订单号 
		%>
		
		
<!--		<form name=alipayment action=pay/WebRoot/alipayapi.jsp method=post target="_blank">
            <div id="body" style="clear:left">
                <dl class="content">
					<dt>卖家支付宝帐户：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDseller_email" />
						<span>必填
</span>
					</dd>
					<dt>商户订单号：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDout_trade_no" />
						<span>商户网站订单系统中唯一订单号，必填
</span>
					</dd>
					<dt>订单名称：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDsubject" />
						<span>必填
</span>
					</dd>
					<dt>付款金额：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDtotal_fee" />
						<span>必填
</span>
					</dd>
					<dt>订单描述：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDbody" />
						<span></span>
					</dd>
					<dt>商品展示地址：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDshow_url" />
						<span>需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html
</span>
					</dd>
                    <dt></dt>
                    <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">确 认</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>-->
<%	}
	//删除源文件
	String dellist[] = delname.split("<<>>>");
	int dellistlen = dellist.length;
	for(int k=0;k<dellistlen;k++)
	{
		String sPath=buffernewpictureaddress+dellist[k];
    	File f = new File(sPath);
    	f.delete();
    }
    
    con.close();
}
catch(SQLException e)
{
	out.print(e);
	//out.print("添加商品失败! Error 231");
}
%>