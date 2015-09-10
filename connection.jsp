
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<%@include  file="tool_name.jsp"%>

 
<%
//try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
	String server = request.getServerName();
	String db = "";
	if (server.contains("ceitraining.org") || server.contains("newcei") || server.contains("172.16.159.112"))
		db = "ceidb.urmc-sh.rochester.edu";
	else 
		db = "phobos.urmc-sh.rochester.edu";
	
	
	Connection con =  DriverManager.getConnection("jdbc:sqlserver://" +  db + ":1433;databaseName=simulation;user=simulation;password=cei2012!@");
	Connection con2 =  DriverManager.getConnection("jdbc:sqlserver://" +  db + ":1433;databaseName=simulation;user=simulation;password=cei2012!@");
/*} catch(Exception e){
	out.println(e.getMessage());
}
*/
%>    


