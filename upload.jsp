<%
/*
*Date 2013/11/14
*author zwx
*brief �����ϴ���Ʒ
*note չʾ������Ϣ 
*data wirte goods 
*copyright Copyright(c) 2013 ת��
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
<HTML>
<BODY >
<P>
<%
if(session.isNew())
{
	response.sendRedirect("login.jsp");
}
// ���û�гɹ���¼����ת���¼ҳ��
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
int count=0;     //�ж��Ƿ���ͼƬ
int id=0;		//id��һ
String pictureaddress="";//���ݿ�ͼƬ��ַ
String inttostr="";//�Զ�����ͼƬ����
String savesql = "";     //�������ݿ�ͼƬ��ַ
String goodsname = "";   //��Ʒ����
String detail = "";		 //��ϸ����
String goodsclass = "";	 //��Ʒ����
String price = "";           //�۸�



String newpictureaddress = "/images/";//ͼƬ�ϴ���ַ
String buffernewpictureaddress = "/images/buffer/";//ͼƬ�����ַ
String delname="";//Ҫɾ����Դ�ļ�

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
	
	String picturearray[] = pictureaddress.split("<#");//�ָ�ͼƬ��ַ��������һ��ͼƬ����
	int pictureaddresslen = picturearray.length;       //ȡ�ó���
	pictureaddress = picturearray[pictureaddresslen-1];//ȡ��ͼƬ���

	
	String username = (String)session.getAttribute("upload");//�Ƿ��creategoods���ӹ���
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
		picturename = picturename.substring(0,9);//ȡ����һ���ļ���
		//ǿ��ת��
		int strtoint;
		strtoint=Integer.parseInt(picturename);
		//תΪstring
		try
		{
			SmartUpload su = new SmartUpload();
			// �ϴ���ʼ��
			su.initialize(pageContext);
			su.upload();
			count = su.save("/images/buffer/");
			if(count == 0)
			{
				out.print("�㻹δ�ϴ�ͼƬ!");
			}
			// ��һ��ȡ�ϴ��ļ���Ϣ��ͬʱ�ɱ����ļ���
			for (int i=0;i<su.getFiles().getCount();i++)
			{
				com.jspsmart.upload.File file = su.getFiles().getFile(i);
				// ���ļ������������
				if (file.isMissing())continue;
				delname = delname+file.getFileName()+"<<>>>";//ɾ���ļ�
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
			out.print("��ͼƬ����!!!");//ˢ��urlʱ�����
		}
	}
	if("".equals(goodsname))
	{
		out.print("û�������Ʒ����!");
	}
	if("".equals(price))
	{
		out.print("û����д�۸�!");
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
		//out.print("��Ʒ��ӳɹ�!");
		
		HttpSession session0=request.getSession(); //���ɶ����ţ����浽session
		String verorderform = "zhuanyi00000"+id;
		session0.setAttribute("orderform",verorderform);//��������ȡ������ 
		%>
		
		
<!--		<form name=alipayment action=pay/WebRoot/alipayapi.jsp method=post target="_blank">
            <div id="body" style="clear:left">
                <dl class="content">
					<dt>����֧�����ʻ���</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDseller_email" />
						<span>����
</span>
					</dd>
					<dt>�̻������ţ�</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDout_trade_no" />
						<span>�̻���վ����ϵͳ��Ψһ�����ţ�����
</span>
					</dd>
					<dt>�������ƣ�</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDsubject" />
						<span>����
</span>
					</dd>
					<dt>�����</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDtotal_fee" />
						<span>����
</span>
					</dd>
					<dt>����������</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDbody" />
						<span></span>
					</dd>
					<dt>��Ʒչʾ��ַ��</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDshow_url" />
						<span>����http://��ͷ������·�������磺http://www.xxx.com/myorder.html
</span>
					</dd>
                    <dt></dt>
                    <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">ȷ ��</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>-->
<%	}
	//ɾ��Դ�ļ�
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
	//out.print("�����Ʒʧ��! Error 231");
}
%>