<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*" session="false"%>
<%@include  file="connection.jsp"%>
<% String device = "other"; %>

<%-- detect device model --%>
<%
  String userAgent = request.getHeader("user-agent");
  /*if (userAgent.matches(".*Android.*")) {
  	device = "Android";
  }else if (userAgent.matches(".*iPhone.*")){
	device = "iPhone";
  }else if (userAgent.matches(".*iPod.*")){
	device = "iPod";
  }else {
    device = "other";
  }*/
  
  device = (String)userAgent;
%>

<%-- write to the database --%> 
<%
try{
String sessionID = (String)request.getParameter("sessionID");
String userID = (String)request.getParameter("userID");
String ipAddress = (String)request.getParameter("ipAddress");
String url = (String)request.getParameter("url");
String field = (String)request.getParameter("field");
String value = (String)request.getParameter("value");
String action = (String)request.getParameter("action");
String note = (String)request.getParameter("note");
DateFormat fmt = new SimpleDateFormat("M/dd/yyyy HH:mm:ss.SSS");
String time_stamp = fmt.format(new java.util.Date());

%>
<%@include file="/guidelines/includes/get_cookie.jsp"%>
<%

Statement stmt = con.createStatement();
String query = "";

query = "INSERT INTO audit(" + 
	    "sessionID, "+
        "userID, "+
        "ipAddress, "+
		"device, " +
        "url, "+
        "field, "+
        "value, "+
        "action, "+
        "note, "+
        "time_stamp) VALUES ('" + 
		sessionID + "', '" +
        userID + "', '" +
        ipAddress+ "', '" +
		device + "', '" +
        //url.replace("/insomnia/","") + "', '" +
		url + "', '" +
        field+ "', '" +
        value+ "', '" +
        action+ "', '" +
        note+ "', '" +
        time_stamp + "')";
        
stmt.executeUpdate(query);

} catch(Exception e){
	%>
    <script type="text/javascript">
	 sendEmail("Audit Error");
	 </script>
    <%
}
%>
Successful