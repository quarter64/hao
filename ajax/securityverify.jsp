<%@ page contentType="text/html;charset=gb2312" %>
<%
String s=request.getParameter("securitycode");//��֤�˻�ȡ����֤��
String security = (String)session.getAttribute("securitycode");//����session����֤��
if(s.equals(security))
{
	out.print("<font color='#6fc670'>��֤����ȷ</font>");
}
else
{
	out.print("<font color='#f09085'>��֤�����!</font>");
}
%>