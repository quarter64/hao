<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=GB2312" %>
<title>��Ϣ��ʾ</title>
<style type="text/css">
a.table:link {color:#286426;text-decoration:none;font:normal 12px/22px "Microsoft YaHei";/*��ɫ4A5C6C*/}
a.table:visited {color:#4A5C6C}
a.table:hover {color:#6fc670; text-decoration:none;}


*{
font-size:15px;
letter-spacing:2px;
}
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
a{
color:#89BBDE;
}
span{
color:red;
}
</style>
<script type="text/javascript" language="javascript">
$$=function(id){return document.getElementById(id);};
var time=5;
var href_url="retrieve.jsp";
function url(){
if(time<0){window.location.href=href_url;}
else{$$("second").innerHTML=time--;}
}
</script>
<%@ include file="buildweb/buygoods_head.txt"%>
<body>
<table border='0' width=100% height=500px align="center"><tr><td>
<div id="box">
<div id="title">�����ѷ��ͣ���ע�����</div>
<div id="content">Ϊ�˱�֤���밲ȫ���뾡���޸����룡</div>
<div id="url">��ҳ�潫��<span id="second"></span>�����ת����½���棬������<a class='table' href="retrieve.jsp">�������</a>������ת��</div>
</div>
<script type="text/javascript" language="javascript">setInterval("url()",1000);</script>
</td></tr></table>
<%@ include file="buildweb/login_footer.txt"%>
</body>
