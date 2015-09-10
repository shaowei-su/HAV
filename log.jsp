<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Log</title>
</head>

<body>

<%@include  file="connection.jsp"%>

<%
String num = request.getParameter("num");
if (num == null) {num = "100";}

Statement stmt = con.createStatement();
	
String query = "";

ResultSet rs0 = stmt.executeQuery("SELECT COUNT(*) as count FROM audit");
rs0.next();
String recordCount = rs0.getString("count");

if (num.equals("all")) {
	query =	"SELECT  * FROM audit ORDER BY time_stamp";
}
else{
	query =	"SELECT  t2.* FROM " +
			"(SELECT TOP " + num + " t1.* FROM audit t1 ORDER BY t1.time_stamp DESC) t2 " +
			"ORDER BY t2.time_stamp " ;
}
				
ResultSet rs = stmt.executeQuery(query);

String[] col_names = {"Session ID","UserID","IP Address","User Device Info", "URL",  "Form Field","Value","User Action","Note","Time Stamp"};
String[] cols = {"sessionID","userID","ipAddress","device", "url","field","value","action","note","time_stamp"};

%>

<h1> Insomnia Log (show <%= num %> of total <%= recordCount%> records)</h1>

<a href="log.jsp?num=10">Show 10 </a> | <a href="log.jsp?num=100">Show 100 recent records</a> | <a href="log.jsp?num=all">Show all</a> <br /><br />

<div style="overflow: auto;	max-height:600px;border:solid thin #000;">
    <table border="1" cellpadding="0" cellspacing="0" width="100%" bgcolor="#F1F1F1">
    <tr style="background-color:#666; color:#FFF;">
        <% for (int i=0; i< col_names.length; i++){ %>
        <td><%= col_names[i] %></td>
        <%}%>
    </tr>
    <% while(rs.next()) { %>
    <tr>
        <% for (int i=0; i< cols.length; i++){ %>
        <td><%= rs.getString(cols[i]) %></td>
        <%}%>
    </tr>
    <%}%>
 	</table>
</div>	 

</body>
</html>