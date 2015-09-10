<%try{ %>

<%@include  file="connection.jsp"%>
<%
Statement stmt = con.createStatement();
String query = "";
String ipAddress = request.getRemoteAddr();

int threshold = 15;
String survey_str = (String)session.getAttribute("survey_click");
int survey_click = 0;
if (survey_str != null) 
	survey_click = Integer.parseInt(survey_str) + 1;
else
	survey_click = 1;
	
session.setAttribute("survey_click", String.valueOf(survey_click));


/*query = "SELECT COUNT(*) as ct FROM audit WHERE ipAddress= '" + ipAddress + "' AND field NOT LIKE '%_btn%' AND URL like '%/" + tool_name + "/%' ";
stmt.executeQuery(query);
ResultSet rs0 = stmt.getResultSet();
rs0.next();
int ct = rs0.getInt(1);
int mod = ct % threshold;*/

//int mod = survey_click % threshold;

out.println("survey_click = " + survey_click);
boolean show_survey = false;

//if (mod == 0)
if (survey_click > threshold)
{
	//first check if the user has been submitted
	query = "SELECT * FROM survey WHERE ipAddress= '" + ipAddress + "' AND submitted = 1 AND URL like '%/" + tool_name + "/%' ";
	stmt.executeQuery(query);
	ResultSet rs = stmt.getResultSet();
	if (!rs.next()){
		show_survey = true; //never submit
	}
	
	//if note, check if it has been shown in this session
	if (show_survey)
	{
		query = "SELECT * FROM survey WHERE ipAddress= '" + ipAddress + "' AND sessionID = '" + session.getId() + "' AND URL like '%/" + tool_name + "/%' ";
		stmt.executeQuery(query);
		ResultSet rs1 = stmt.getResultSet();
		if (!rs1.next())
			show_survey = true; //never show in this session
		else
			show_survey = false;
	}
	//session.setAttribute("survey_click", "1");	
}

if (show_survey) {
	out.println("show_survey");
	session.setAttribute("show_survey","true");
}else {
	out.println("hide_survey");
	session.setAttribute("show_survey","false");
}

}catch(Exception e){
	out.println(e.getMessage());
}
%>