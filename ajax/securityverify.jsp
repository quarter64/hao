<%@ page contentType="text/html;charset=gb2312" %>
<%
String s=request.getParameter("securitycode");//验证端获取的验证码
String security = (String)session.getAttribute("securitycode");//加入session的验证码
if(s.equals(security))
{
	out.print("<font color='#6fc670'>验证码正确</font>");
}
else
{
	out.print("<font color='#f09085'>验证码错误!</font>");
}
%>