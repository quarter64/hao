<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=GB2312" %>
<title>��Ϣ��ʾ</title>
<style type="text/css">
a.table:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*��ɫ4A5C6C*/}
a.table:visited {color:#4A5C6C}
a.table:hover {color:#6fc670; text-decoration:none;}

#box{
position:absolute;
left:50%;
top:30%;
width:600px;
height:200px;
margin-left:-300px;
margin-top:-100px;
border:1px solid #89BBDE;
}
#box div{
text-align:center;
height:50px;
line-height:50px;
}
#title{
background-color:#89BBDE;
color:white;
font-weight:bold;
}
#content{
color:green;
}
</style>


<body>
<%@ include file="buildweb/buygoods_head.txt"%>
<table border='0' width=100% height=500px align="center"><tr><td>
<div id="box">
<div id="title">��ʾ</div>
<div id="content">��Ʒ�ϴ��ɹ�</div>
<div id="url"><font color="#7CCD7C">Ϊ�˾�������������Ϣй¶����������Ʒ������ɺ󾡿콫����Ʒ�¼ܣ�<br>�¼ܷ�ʽΪ���ε���ҵ���ҳ-->�ҷ�������Ʒ-->�Ѿ������ˡ�<br>
<%
String id=request.getParameter("id");
out.print("<a href='goodsshow.jsp?id="+id+"' class='table'>�鿴���ϴ�����Ʒ</a>");
%>
</font></div>
</div>

</td></tr></table>
<%@ include file="buildweb/login_footer.txt"%>
</body>
