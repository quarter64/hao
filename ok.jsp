<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=GB2312" %>
<title>信息提示</title>
<style type="text/css">
a.table:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*灰色4A5C6C*/}
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
<div id="title">提示</div>
<div id="content">商品上传成功</div>
<div id="url"><font color="#7CCD7C">为了尽量减少您的信息泄露，请您在商品交易完成后尽快将该商品下架！<br>下架方式为依次点击我的主页-->我发布的商品-->已经出售了。<br>
<%
String id=request.getParameter("id");
out.print("<a href='goodsshow.jsp?id="+id+"' class='table'>查看我上传的商品</a>");
%>
</font></div>
</div>

</td></tr></table>
<%@ include file="buildweb/login_footer.txt"%>
</body>
