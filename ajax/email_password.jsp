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
String base = "abcdefghijklmnopqrstuvwxyz0123456789";   //�����ַ����Ӵ�������ȡ
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



String qm ="lysq8388120oo0@"; //����QQ���� 
String tu = "qq.com"; //������ĺ�׺���� 
String tto=logname; //�����ʼ������� 
String ttitle="���޸�������루ת������"; 
String tcontent="<font color='#036664'>�װ���"+logname+"��</font><BR><BR>���ת��������Ϊ"+password+",Ϊ��ֹ����й¶�����㾡���޸����롣<BR><BR><BR><font color='#83b19a'>Ϊʲô�һ��յ�����ʼ���<BR></font><font color='#bdc8c3'>����ע��ת����ʱ����д�˴˵���������Ϊ�˻��������Ƿ�������ʼ�����ȷ������ȷ����������ˡ�<br>�����û��ע��ת����������Դ��ʼ���������������ע��ʱ������Լ������䡣</font><font color='#c6c9a7' size='0.75em'><br>��Ϊϵͳ�ʼ�������ظ� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Copyright 2004 ת�� Corporation. All rights reserved.</font>"; 
Properties props=new Properties(); 
props.put("mail.smtp.host","smtp."+tu);//���ŵ���������������д�������ǹ�˾�����������Բ����޸ģ� 
props.put("mail.smtp.auth","true"); 
Session s=Session.getInstance(props); 
s.setDebug(true); 
  
MimeMessage message=new MimeMessage(s); 
  
//����Ϣ�������÷�����/�ռ���/����/����ʱ�� 
InternetAddress from=new InternetAddress("w-lysq@"+tu); //��������
message.setFrom(from); 
InternetAddress to=new InternetAddress(tto); 
message.setRecipient(Message.RecipientType.TO,to); 
message.setSubject(ttitle); 
message.setSentDate(new Date()); 
  
  
//����Ϣ������������ 
BodyPart mdp=new MimeBodyPart();//�½�һ������ż����ݵ�BodyPart���� 
mdp.setContent(tcontent,"text/html;charset=gb2312");//��BodyPart�����������ݺ͸�ʽ/���뷽ʽ 
Multipart mm=new MimeMultipart();//�½�һ��MimeMultipart�����������BodyPart�� 
//��(��ʵ�Ͽ��Դ�Ŷ��) 
mm.addBodyPart(mdp);//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart) 
message.setContent(mm);//��mm��Ϊ��Ϣ��������� 
  
message.saveChanges(); 
Transport transport=s.getTransport("smtp"); 
transport.connect("smtp."+tu,"w-lysq",qm); //���ŵ����� 
transport.sendMessage(message,message.getAllRecipients()); 
transport.close();
%>