<script type="text/javascript">


function surveyCheck(){
	alert("check survey);
		<%
		try{
			String show_survey = (String)session.getAttribute("show_survey");
			String case_visited = (String)session.getAttribute("case_visited");
			String survey_opened = (String)session.getAttribute("survey_opened");
			
			if (survey_opened == null || !survey_opened.equals("true")){
				if (case_visited != null && case_visited.equals("true") && show_survey != null && show_survey.equals("true")) {
					%>
					window.open('survey.jsp','_blank');
					window.location.reload(); //refesh all sessionss
					//alert("Please show me the survey");
					$.ajax({
							type: "POST",
							url: "survey_set_open.jsp",
							dataType: "html",
							data:{}
					});

					<%
					//session.setAttribute("survey_opened","true");
					//session.setAttribute("show_survey","false");
				}
			}
		}catch (Exception e){
			out.println("error: " + e.getMessage());
		}%>
	
}

</script>



