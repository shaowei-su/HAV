<%@include  file="/guidelines/includes/header.jsp"%>


<div data-role="page" id="note" data-overlay-theme="<%=data_overlay_theme%>" data-theme="<%=data_theme%>">
    
    <div data-role="content" data-position="inline">
    <div  id="step_info_text">
		<%
        String info = request.getParameter("info");
		if (info == null) info = "none";
        %>
        
        <script type="text/javascript">
			audit('<%= request.getRequestURI()%>','note','<%= info %>','open webpage','User opens a note <%= info %>');
		</script>
        
       
        <p  class="info_title popup_title">Note</p>
		<%
		if (info.equals("inst1")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p>The first follow-up visit should occur at 30 days from initiation of PrEP</p>
            
        <%}%>
        
        
         
     <%@include file="/guidelines/includes/back_btn.jsp"%>
        
    </div>
</div>
