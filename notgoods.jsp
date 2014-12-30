<html>
<head>
<%@ page contentType="text/html;charset=GB2312" %>
<title>没有找到该商品</title>
<style type="text/css">
<!--
A.j:link {color:#286426; text-decoration:underline;}
a.j:visited {color:#4A5C6C; text-decoration:underline;}
a.j:hover {color:#6fc670;}

.t {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        color: #CC0000;
}
.c {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 11px;
        font-weight: normal;
        color: #000000;
        line-height: 18px;
        text-align: center;
        border: 1px solid #CCCCCC;
        background-color: #FFFFEC;
}
body {
        background-color: #FFFFFF;
        margin-top: 100px;
}
-->
</style>
</head>
<body>
<%@ include file="buildweb/buygoods_head.txt"%>
<div align="center">
  <h2><span class="t">糟糕！出错了！</span></h2>
  <table border="0" cellpadding="8" cellspacing="0" width="460">
    <tbody>
      <tr>
        <td class="c">没有找到任何有关该商品的信息。该商品可能已经被购买了！<a href="index.jsp" class='j'>回到首页</a></td>
      </tr>
    </tbody>
  </table>
</div>
<%@ include file="buildweb/footer.txt"%>
</body>
</html>

