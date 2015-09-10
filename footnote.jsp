<%@include  file="/guidelines/includes/header.jsp"%>

<div data-role="page" id="footnote" data-overlay-theme="<%=data_overlay_theme%>">
    <div data-role="content" data-position="inline">
    
        <%@include file="popup_close_btn.jsp"%>
   
		<%
        String note = request.getParameter("note");
        %>
        
		<script type="text/javascript">
			audit('<%= request.getRequestURI()%>','reference','<%= note %>','open webpage','User opens a footnote');
		</script>
        
        <p  class="info_title popup_title">Note</p>
        
        <%@include file="/guidelines/includes/close_btn_top.jsp"%>
		<%
		if (note.equals("1")){
		%>
            Defined by direct contact of the vagina, anus or mouth with the semen or blood of the perpetrator with or without physical injury, tissue damage, or presence of blood at the site of the assault.
        <%}%>
        
        <%
		if (note.equals("2")){
		%>
            Prophylaxis should be initiated within 36 hours of the assault.
        <%}%>
        
        
        <%
		if (note.equals("3")){
		%>
            Complicating factors: pregnancy; other medical conditions; drug interactions.
        <%}%>
        
        
        <%
		if (note.equals("4")){
		%>
            If Specialist not available on site, 24-hour consultation information available at <a href="http://www.hivguidelines.org"><font class="recommendation"> www.hivguidelines.org</font></a>
        <%}%>
        
        
        <%@include file="/guidelines/includes/back_btn.jsp"%>
    </div>
 </div>
        