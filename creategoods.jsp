<%/* 
**Date 2013/11/23 
**author zwx  
*brief ��Ʒ�ϴ���Ϣ��д 
*note ͨ��upload�ϴ� 
*data �Ƿ��¼��֤ 
*copyright Copyright(c) 2013 ת�� 
*/ 
%>

<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="user.Login" %>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<% //����ͻ�ֱ�ӽ����ҳ�潫��ת���¼ҳ�档
if(session.isNew())
{
	response.sendRedirect("login.jsp");
}
// ���û�гɹ���¼����ת���¼ҳ��
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
		x.innerHTML="<font color='#f09085'>(����)</font>";         
		return false;
	}
	if(!(picture==""))
	{
		x=document.getElementById("picer");
		x.innerHTML="<font color='#9ac458'>(����)</font>";         
		if(name=="")
		{
			x=document.getElementById("nameer");
			x.innerHTML="<font color='#f09085'>(����)</font>";         
			return false;
		}
		if(!(name==""))
		{
			x=document.getElementById("nameer");
			x.innerHTML="<font color='#9ac458'>(����)</font>";
			if(price=="")
			{
				x=document.getElementById("priceer");
				x.innerHTML="<font color='#f09085'>(����)</font>";   
				return false;
			}
			if(!(price==""))
			{
				x=document.getElementById("priceer");
				x.innerHTML="<font color='#9ac458'>(����)</font>";
				if(clas=="")
				{
					x=document.getElementById("claser");
					x.innerHTML="<font color='#f09085'>(����)</font>";         
					return false;
				}
				if(!(clas==""))
				{
					x=document.getElementById("claser");
					x.innerHTML="<font color='#9ac458'>(����)</font>";
					if(safe=="")
					{
						x=document.getElementById("safecodever");
						x.innerHTML="<font color='#f09085'>(����)</font>";         
						return false;
					}
					if(!(safe==""))
					{
						x=document.getElementById("safecodever");
						x.innerHTML="<font color='#9ac458'>(����)</font>";
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
	FONT-FAMILY: "����", "Verdana","Arial", "Helvetica";
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
Ϊ��֤ͼƬ������ʾ,Ӧ��������300x300С��800x800���ء�<br>
    <BR><font color='#FFFFFF'>��ҳ��ʾͼƬ<span id="picer"><font color='#9ac458'>(����)</font></span><input type="file"  id="pic" name="f"></font>
	<BR><font color='#FFFFFF'>ͼƬ<font color='#9ac458'>(���������Ƕ�)</font><input type="file" name="f"></font>
	<BR><font color='#FFFFFF'>ͼƬ<font color='#9ac458'>(���������Ƕ�)</font><input type="file" name="f"></font>
	<BR><font color='#FFFFFF'>ͼƬ<font color='#9ac458'>(���������Ƕ�)</font><input type="file" name="f"></font>
	
	
   	<BR><BR><font color='#FFFFFF'>��Ʒ����&nbsp;<span id="nameer"><font color='#9ac458'>(����)</font></span></font><Input type=text id="name" name="goodsname">
   	<BR><font color='#FFFFFF'>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��<span id="priceer"><font color='#9ac458'>(����)</font></span></font><Input type=text id="price" name="price">
	<BR><font color='#FFFFFF'>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��<span id="claser"><font color='#9ac458'>(����)</font></pre></font>
	<select name="goodsclass" id="clas">
	    <option value="�ֻ�">�ֻ�</option>
		<option value="���">���</option>
		<option value="����">����</option>
		<option value="��װ">��װ</option>
		<option value="����">����</option>
		<option value="ʳƷ">ʳƷ</option>
		<option value="������Ʒ">������Ʒ</option>
		<option value="��ȯ">��ȯ</option>
		<option value="������鼮">������鼮</option>
		<option value="��־">��־</option>
		<option value="����">����</option>
		<option value="����">����</option>
	</select> 
	
		</td>
	</tr>
	<tr>
		<td align="center">
		<hr>
	<p>��ϸ����</p>
	<textarea cols=60 rows=10 name="detail" class="textbox"></textarea><BR>	
	��֤��:
	<img onclick="reloadcode()" title="�����һ��" id="safecode" src="securitycode.jsp"><BR>
    <Input type="text" name="securitycode" id="securitycode" size="18" maxlength="15" /><BR>
    <span id="safecodever"></span>
   
    <BR><input type="submit" onclick="return registerver()" value="��������" name="Submit" style="font-family:΢���ź�;font-size:1.0em;border:none;width:80px;height:30px;color:#FFFFFF;background:#7ab323">
</form>

		</td>
	</tr>
</table>
</td></tr></table>
<%@ include file="buildweb/footer.txt"%>
