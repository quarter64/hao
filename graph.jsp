<!DOCTYPE HTML>

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.Login" %>
<%@ page import="pagesplit.PageNumber" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="handlePage" class="pagesplit.PageNumber" scope="session" >
</jsp:useBean>
<jsp:useBean id="login" class="user.Login" scope="session" >
</jsp:useBean>
<%
String name="";
String value="";
Statement sql=null;
ResultSet rs=null;
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
}
catch(ClassNotFoundException e)
{
	out.print(e);
}
try
{
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hao?useUnicode=true&characterEncoding=gb2312","root","123456");
	sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	rs=sql.executeQuery("SELECT name,value FROM count order by value limit 1,10");
	int i=0;
	while(rs.next())
	{
		name = name+i+":"+rs.getString("name")+"<br>";
		value = value+rs.getString("value")+",";
		i=i+1;
	}
}
catch(SQLException e)
{
	out.print(e);
}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>转易网搜索统计</title>

		<script type="text/javascript" src="WEB/js/jquery-1.9.1.js"></script>
		<script type="text/javascript">
$(function () {
    // Set up the chart
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: '统计信息'
        },
        subtitle: {
            //text: '1:小说<br>2:考研<br>3:计算机<br>4:四级<br>5:耳机<br>6:零食<br>7:六级'
			text:'<%out.print(name);%>'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            //data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 250,]
			data:[<%out.print(value);%>]
        }]
    });
    

    // Activate the sliders
    $('#R0').on('change', function(){
        chart.options.chart.options3d.alpha = this.value;
        showValues();
        chart.redraw(false);
    });
    $('#R1').on('change', function(){
        chart.options.chart.options3d.beta = this.value;
        showValues();
        chart.redraw(false);
    });

    function showValues() {
        $('#R0-value').html(chart.options.chart.options3d.alpha);
        $('#R1-value').html(chart.options.chart.options3d.beta);
    }
    showValues();
});
		</script>
	</head>
	<body>
<script src="WEB/graph/highcharts.js"></script>
<script src="WEB/graph/highcharts-3d.js"></script>
<script src="WEB/graph/modules/exporting.js"></script>

<div id="container"></div>
<div id="sliders">
	<table>
		<tr><td>角度</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
	    <tr><td>倾斜度</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
	</table>
</div>
	</body>
</html>
