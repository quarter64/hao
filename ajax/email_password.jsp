<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %> 
<%@ page import="java.sql.*,java.util.Date" %>  
<%@ page import="java.text.SimpleDateFormat" %>  
<%@ page import="java.util.*,javax.mail.*"%> 
<%@ page import="javax.mail.internet.*"%> 
<% 
String logname="";
logname=request.getParameter("email");
//logname="zwx64@foxmail.com";


String password = "";
int length=9;
String base = "abcdefghijklmnopqrstuvwxyz0123456789";   //生成字符串从此序列中取
Random random = new Random();   
StringBuffer sb = new StringBuffer();   
for (int i=0;i < length; i++) 
{   
    int number = random.nextInt(base.length());   
     sb.append(base.charAt(number));   
}   
password = sb.toString(); 

Statement sql;
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e){}
try
{ 
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao","root","123456");
	String condition="UPDATE user SET password=? where email=?";
	PreparedStatement pstmt = con.prepareStatement(condition);
 	pstmt.setString(1,password);
 	pstmt.setString(2,logname);
 	pstmt.executeUpdate();
	out.print("ok");
	con.close();
}
catch(SQLException e)
{} 



String qm ="lysq8388120oo0@"; //您的QQ密码 
String tu = "qq.com"; //你邮箱的后缀域名 
String tto=logname; //接收邮件的邮箱 
String ttitle="请修改你的密码（转易网）"; 
String tcontent="<font color='#036664'>亲爱的"+logname+"！</font><BR><BR>你的转易网密码为"+password+",为防止密码泄露，请你尽快修改密码。<BR><BR><BR><font color='#83b19a'>为什么我会收到这封邮件？<BR></font><font color='#bdc8c3'>您在注册转易网时，填写了此电子邮箱作为账户名，我们发送这封邮件，以确认您的确是邮箱的主人。<br>如果您没有注册转易网，请忽略此邮件。可能是有人在注册时填错了自己的邮箱。</font><font color='#c6c9a7' size='0.75em'><br>此为系统邮件，请勿回复 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Copyright 2004 转易 Corporation. All rights reserved.</font>"; 
Properties props=new Properties(); 
props.put("mail.smtp.host","smtp."+tu);//发信的主机，这里我填写的是我们公司的主机！可以不用修改！ 
props.put("mail.smtp.auth","true"); 
Session s=Session.getInstance(props); 
s.setDebug(true); 
  
MimeMessage message=new MimeMessage(s); 
  
//给消息对象设置发件人/收件人/主题/发信时间 
InternetAddress from=new InternetAddress("w-lysq@"+tu); //发信主机
message.setFrom(from); 
InternetAddress to=new InternetAddress(tto); 
message.setRecipient(Message.RecipientType.TO,to); 
message.setSubject(ttitle); 
message.setSentDate(new Date()); 
  
  
//给消息对象设置内容 
BodyPart mdp=new MimeBodyPart();//新建一个存放信件内容的BodyPart对象 
mdp.setContent(tcontent,"text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式 
Multipart mm=new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对 
//象(事实上可以存放多个) 
mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart) 
message.setContent(mm);//把mm作为消息对象的内容 
  
message.saveChanges(); 
Transport transport=s.getTransport("smtp"); 
transport.connect("smtp."+tu,"w-lysq",qm); //发信的邮箱 
transport.sendMessage(message,message.getAllRecipients()); 
transport.close();
%>