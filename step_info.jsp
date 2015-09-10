<%@include  file="/guidelines/includes/header.jsp"%>

<style>
.ui-table th, .ui-table td
{
	padding: 0em;
	margin:0px;
	font-size: normal;
	border: none !important;
}
</style>

<div data-role="page" id="step_info" data-overlay-theme="<%=data_overlay_theme%>" data-theme="<%=data_theme%>">
    
    <div data-role="content" data-position="inline">
    <div  id="step_info_text">
		<%
        String info = request.getParameter("info");
		if (info == null) info = "none";
        %>
        
        <script type="text/javascript">
			audit('<%= request.getRequestURI()%>','step_info','<%= info %>','open webpage','User opens a general information link');
		</script>
        
        <%--About this tool --%>
		<%
		if (info.equals("inst0")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">About this tool</p>
            This is an online tool to provide a quick reference for Guidance for the Use of Pre-Exposure Prophylaxis (PrEP) to Prevent HIV Transmission. It integrates recommendations and interactive decision diagram custom-tailored to specific patient cases. 
            <br><br>
            Click "Help" button on the bottom for instruction how to use the tool.
            
        <%}%>
        
        
        
		<%
		if (info.equals("inst1")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Key Principles for Prescribing PrEP</p>
            <%@include file="key_principles.jsp"%>
            
        <%}%>
        
        
		<%
		if (info.equals("inst2")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: Potential Candidates for PrEP</p>
            <%@include file="table1.jsp"%>
            
        <%}%>
        
        
		<%
		if (info.equals("inst3")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: Contraindications to PrEP</p>
            <%@include file="table2.jsp"%>
            
        <%}%>
        
        
		<%
		if (info.equals("inst4")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: Important Considerations when Prescribing PrEP</p>
            
            <%@include file="table3.jsp"%>
        <%}%>
        
        
		<%
		if (info.equals("inst5")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: Pre-Prescription: Assessment Checklist</p>
            <%@include file="table4.jsp"%>
            
        <%}%>
        
        
		<%
		if (info.equals("inst6")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: Pre-Prescription: Patient Education Checklist</p>
            <%@include file="table5.jsp"%>
            
        <%}%>
        
        
		<%
		if (info.equals("inst7")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: Pre-Prescription: Laboratory Tests</p>
            
            <%@include file="table6.jsp"%>
        <%}%>
        
        
		<%
		if (info.equals("inst8")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: PrEP: Prescribing Recommendations</p>
            <%@include file="table7.jsp"%>
            
        <%}%>
        
        
		<%
		if (info.equals("inst9")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Table: PrEP: Follow-Up Visits</p>
            
            <%@include file="table8.jsp"%>
        <%}%>
        
        <%
		if (info.equals("inst10")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">PrEP: Discontinuation of Regimen</p>
            
            <%@include file="table9.jsp"%>
        <%}%>
        
        <%
		if (info.equals("inst11")){
		%>
            <%@include file="/guidelines/includes/close_btn_top.jsp"%>
            <p  class="info_title popup_title">Resources</p>
            
            
            <strong>Centers for Disease Control and Prevention  (CDC) guidelines for the use of daily pre-exposure prophylaxis (PrEP) for the  prevention of HIV infection</strong>:
            <ul class="single">
              <li><a href="http://www.cdc.gov/hiv/pdf/guidelines/PrEPguidelines2014.pdf" target="_blank">Preexposure Prophylaxis for HIV  Prevention in the United States - 2014. A Clinical Practice Guideline</a></li>
              <li><a href="http://www.cdc.gov/hiv/pdf/guidelines/PrEPProviderSupplement2014.pdf" target="_blank">Preexposure Prophylaxis for the  Prevention of HIV in the United States - 2014. Clinical Providers' Supplement</a></li>
            </ul>
            <p></p>
            <!--
            <p><strong>Interim Guidance from the Centers for Disease Control and Prevention:</strong></p>
            <ul>
              <li>Centers for Disease Control and Prevention. Interim guidance: Preexposure prophylaxis (PrEP) for the prevention of HIV infection in men who have sex with men. <em>Morb Mortal Wkly Rep</em> 2011;60:65-68. Available <a href="http://www.cdc.gov/mmwr/preview/mmwrhtml/mm6003a1.htm" target="_blank">here</a>.</li>
              <li>Centers for Disease Control and Prevention. Interim guidance for clinicians considering the use of preexposure prophylaxis for the prevention of HIV infection in heterosexually active adults. <em>Morb Mortal Wkly Rep</em> 2012;61:586-589. Available <a href="http://www.cdc.gov/mmwr/preview/mmwrhtml/mm6131a2.htm" target="_blank">here</a>.</li>
              <li>Centers for Disease Control and Prevention. Update to interim guidance for pre-exposure prophylaxis (PrEP) for the prevention of HIV infection: PrEP for injecting drug users. <em>Morb Mortal Wkly Rep</em> 2013;62:463-465. Available <a href="http://www.cdc.gov/mmwr/preview/mmwrhtml/mm6223a2.htm" target="_blank">here</a>.</li>
            </ul>
            -->
            
      <p><strong>World Health Organization.</strong> Guidance on oral pre-exposure prophylaxis (PrEP) for serodiscordant couples, men and transgender women who have sex with men at high risk of HIV: Recommendations for use in the context of demonstration projects; July 2012. Available <a href="http://www.who.int/hiv/pub/guidance_prep/en/index.html" target="_blank">here</a>.</p>
            <p><strong>Truvada Risk Evaluation and Mitigation Strategy (REMS) Materials:</strong> 
              Available <a href="http://www.truvadapreprems.com/truvadaprep-resources" target="_blank">here</a>.</p>
            <p><strong>Truvada Package Insert:</strong>
              Available <a href="http://www.accessdata.fda.gov/drugsatfda_docs/label/2013/021752s042lbl.pdf" target="_blank">here</a>.</p>
            <p><strong>AIDS Vaccine Advocacy Coalition (AVAC) website:</strong> <a href="http://www.avac.org/prevention-option/prep" target="_blank">Pre-Exposure Prophylaxis</a></p>
            <p><strong>PrEP Watch:</strong> <a href="http://www.prepwatch.org/" target="_blank">www.prepwatch.org/</a></p>
            <%}%>
        
         
     <%@include file="/guidelines/includes/back_btn.jsp"%>
        
    </div>
</div>
