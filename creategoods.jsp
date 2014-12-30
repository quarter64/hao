<%/* 
**Date 2013/11/23 
**author zwx  
*brief 商品上传信息填写 
*note 通过upload上传 
*data 是否登录认证 
*copyright Copyright(c) 2013 转易 
*/ 
%>

<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="user.Login" %>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<% //如果客户直接进入该页面将被转向登录页面。
if(session.isNew())
{
	response.sendRedirect("login.jsp");
}
// 如果没有成功登录将被转向登录页面
String success=login.getSuccess();
if(success==null)
{
	success="false";
}
if(success.equals("false"))
{
	response.sendRedirect("login.jsp");
}

%>

<%
		HttpSession session0=request.getSession();
		session0.setAttribute("upload", "con");
%><head>
<script src="WEB/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){
       $("#securitycode").blur(function(){ 	
       $.ajax({ 
	   		type:"POST", 
			url:"ajax/securityverify.jsp", 
			data:"securitycode="+$("#securitycode").val(),
			async:false,  
			global:false, 
			dataType:'text',
			error: function(e)
							{  
			  					alert(e); 
							}, 
			success:function(data)
							{
							 	$("#safecodever").html(data);
                            } 
       	 	 	 	 }); 	    
 	   }); 
});

function reloadcode()
{
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','securitycode.jsp?'+Math.random());
}


function registerver()
{
	var picture=document.getElementById("pic").value;
	var name=document.getElementById("name").value;
	var price=document.getElementById("price").value;
	var clas=document.getElementById("clas").value;
	var safe=document.getElementById("securitycode").value;
	if(picture=="")
	{
		x=document.getElementById("picer");
		x.innerHTML="<font color='#f09085'>(必填)</font>";         
		return false;
	}
	if(!(picture==""))
	{
		x=document.getElementById("picer");
		x.innerHTML="<font color='#9ac458'>(必填)</font>";         
		if(name=="")
		{
			x=document.getElementById("nameer");
			x.innerHTML="<font color='#f09085'>(必填)</font>";         
			return false;
		}
		if(!(name==""))
		{
			x=document.getElementById("nameer");
			x.innerHTML="<font color='#9ac458'>(必填)</font>";
			if(price=="")
			{
				x=document.getElementById("priceer");
				x.innerHTML="<font color='#f09085'>(必填)</font>";   
				return false;
			}
			if(!(price==""))
			{
				x=document.getElementById("priceer");
				x.innerHTML="<font color='#9ac458'>(必填)</font>";
				if(clas=="")
				{
					x=document.getElementById("claser");
					x.innerHTML="<font color='#f09085'>(必填)</font>";         
					return false;
				}
				if(!(clas==""))
				{
					x=document.getElementById("claser");
					x.innerHTML="<font color='#9ac458'>(必填)</font>";
					if(safe=="")
					{
						x=document.getElementById("safecodever");
						x.innerHTML="<font color='#f09085'>(必填)</font>";         
						return false;
					}
					if(!(safe==""))
					{
						x=document.getElementById("safecodever");
						x.innerHTML="<font color='#9ac458'>(必填)</font>";
						return true;
					}
				}
			}
		}
	}
}
</script>


<style type="text/css">
body 
{
	background-color:#c9c9aa;  
}    
.textbox
{
	BACKGROUND: #BFCEDC;
	BORDER-TOP:#7F9DB9 1px solid;
	BORDER-LEFT: #7F9DB9 1px solid;
	BORDER-RIGHT: #7F9DB9 1px solid;
	BORDER-BOTTOM:#7F9DB9 1px solid;
	FONT-FAMILY: "宋体", "Verdana","Arial", "Helvetica";
	FONT-SIZE: 12px;
	TEXT-ALIGN: LIFT;
	color: #990099;
	scrollbar-face-color: #ffc0cb;  
	scrollbar-shadow-color: #ffb6c1;  
	scrollbar-highlight-color: #98fb98;  
	scrollbar-3dlight-color: #ffb6c1;   
	scrollbar-darkshadow-color: #90ee90;   
	scrollbar-track-color: #ffdead;   
	scrollbar-arrow-color: #f5deb3;
}
</style>
</head>

<%@ include file="buildweb/buygoods_head.txt"%>


<table width='100%' border='0'><tr><td align="center">
<table border='0' bgcolor=#54830c style="padding:20px;"> 
	<tr>
		<td width='500'>

<form method="post" action="upload.jsp" enctype="multipart/form-data">
为保证图片正常显示,应尽量大于300x300小于800x800像素。<br>
    <BR><font color='#FFFFFF'>主页显示图片<span id="picer"><font color='#9ac458'>(必填)</font></span><input type="file"  id="pic" name="f"></font>
	<BR><font color='#FFFFFF'>图片<font color='#9ac458'>(建议其他角度)</font><input type="file" name="f"></font>
	<BR><font color='#FFFFFF'>图片<font color='#9ac458'>(建议其他角度)</font><input type="file" name="f"></font>
	<BR><font color='#FFFFFF'>图片<font color='#9ac458'>(建议其他角度)</font><input type="file" name="f"></font>
	
	
   	<BR><BR><font color='#FFFFFF'>产品名称&nbsp;<span id="nameer"><font color='#9ac458'>(必填)</font></span></font><Input type=text id="name" name="goodsname">
   	<BR><font color='#FFFFFF'>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格<span id="priceer"><font color='#9ac458'>(必填)</font></span></font><Input type=text id="price" name="price">
	<BR><font color='#FFFFFF'>分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类<span id="claser"><font color='#9ac458'>(必填)</font></pre></font>
	<select name="goodsclass" id="clas">
	    <option value="手机">手机</option>
		<option value="相机">相机</option>
		<option value="电脑">电脑</option>
		<option value="服装">服装</option>
		<option value="日用">日用</option>
		<option value="食品">食品</option>
		<option value="体育用品">体育用品</option>
		<option value="卡券">卡券</option>
		<option value="计算机书籍">计算机书籍</option>
		<option value="杂志">杂志</option>
		<option value="传记">传记</option>
		<option value="其他">其他</option>
	</select> 
	
		</td>
	</tr>
	<tr>
		<td align="center">
		<hr>
	<p>详细介绍</p>
	<textarea cols=60 rows=10 name="detail" class="textbox"></textarea><BR>	
	验证码:
	<img onclick="reloadcode()" title="点击换一张" id="safecode" src="securitycode.jsp"><BR>
    <Input type="text" name="securitycode" id="securitycode" size="18" maxlength="15" /><BR>
    <span id="safecodever"></span>
   
    <BR><input type="submit" onclick="return registerver()" value="立即发布" name="Submit" style="font-family:微软雅黑;font-size:1.0em;border:none;width:80px;height:30px;color:#FFFFFF;background:#7ab323">
</form>

		</td>
	</tr>
</table>
</td></tr></table>
<%@ include file="buildweb/footer.txt"%>
