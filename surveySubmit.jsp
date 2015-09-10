<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*" session="false"%>
<%@include  file="connection.jsp"%>

<% String device = "other"; %>

<%-- detect device model --%>
<%
  String userAgent = request.getHeader("user-agent");
  device = (String)userAgent;
%>

<%-- write to the database --%> 
<%
try{
String sessionID = (String)request.getParameter("sessionID");
String ipAddress = (String)request.getParameter("ipAddress");
String easy = (String)request.getParameter("easy");
String potential = (String)request.getParameter("potential");
String profession = (String)request.getParameter("profession");
String comment = (String)request.getParameter("comment");
String submitted = (String)request.getParameter("submitted");
String doitlater = (String)request.getParameter("doitlater");
String nothanks = (String)request.getParameter("nothanks");
String url = (String)request.getRequestURI();

DateFormat fmt = new SimpleDateFormat("M/dd/yyyy HH:mm:ss");
String time_stamp = fmt.format(new java.util.Date());

Statement stmt = con.createStatement();
String query = "";

query = "INSERT INTO survey(" + 
	    "sessionID, "+
        "ipAddress, "+
		"device, "+
		"easy, "+
		"potential, " +
		"profession, " +
		"comment, "+
		"submitted, "+
		"doitlater, "+
		"nothanks," + 
		"time_stamp, url) " +
		" VALUES ('" + 
		sessionID + "', '" +
        ipAddress+ "', '" +
		device + "', '" +
		easy + "', '" +
		potential + "', '" + 
		profession + "', '" +
		comment + "', '" +
		submitted + "', '" +
		doitlater + "', '" +
		nothanks + "', '" +
		time_stamp + "', '" +
		url + "')";
        
stmt.executeUpdate(query);

return;

} catch(Exception e){
	out.println(e.getMessage());
}
%>