<%@ include  file="/guidelines/includes/header.jsp"%>
<%@include  file="mode_js.jsp"%>


<%
String expandID = (String)request.getParameter("expandID"); //1: recommendation, 2: decision diagram
int expandIDnum = 0;
if (expandID != null) expandIDnum = Integer.parseInt(expandID);
%>


<body>
 
<div data-role="page" id="index" data-dom-cache="true" data-theme="<%=data_theme%>">
	<% String nav = "home"; %>
	<%@include  file="/guidelines/includes/navigation.jsp"%>
	
    <div data-role="content" data-theme="d">
	
        <p class="title">Guidance for the Use of Pre-Exposure Prophylaxis (PrEP) to Prevent HIV Transmission</p>
        
        <%@ include  file="/guidelines/includes/download_originalpdf.jsp"%>
        
        <!-- algorithms -->
        <div data-role="collapsible-set" data-inset="true" data-content-theme="<%=data_theme%>" >
                        
                        
                        <% sectionID=1; %>
                        <div  id="section<%=sectionID%>"  data-role="collapsible" <%if (expandID != null && expandIDnum == sectionID){%> data-collapsed="false" <%}%> data-theme="<%=recommendation_bar_theme%>" >
                                <h3 onClick="audit('<%= request.getRequestURI()%>','recommendation','','onClick','User expands/collapses recommendation')">Recommendations
                                <div class="debug-text">recommendations</div>
                                </h3>
                                <%@include  file="recommendations.jsp"%>
                        </div>
                        
                        <%--
                        <div  data-role="collapsible" <%if (expandID != null && expandID.equals("3")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>"  >
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses key_principles')">Table
                                <br><font class="collapsive_subtitle">Key Principles for Prescribing PrEP</font>
                                </h3>
								<%@include  file="key_principles.jsp"%>
                        </div>
                        
                       
                        <div  data-role="collapsible" <%if (expandID != null && expandID.equals("4")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>" >
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 1')">Table
                                <br><font class="collapsive_subtitle">Potential Candidates for PrEP</font>
                                </h3>
								<%@include  file="table1.jsp"%>
                        </div>
                        
                        <div data-role="collapsible" <%if (expandID != null && expandID.equals("5")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 2')">Table
                                <br><font class="collapsive_subtitle">Contraindications to PrEP</font>
                                </h3>
								<%@include  file="table2.jsp"%>
                        </div>
                        
                        <div data-role="collapsible" <%if (expandID != null && expandID.equals("6")){%> data-collapsed="false" <%}%>data-theme="<%=table_bar_theme%>" >
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 3')">Table
                                <br><font class="collapsive_subtitle">Important Considerations when Prescribing PrEP</font>
                                </h3>
								<%@include  file="table3.jsp"%>
                        </div>
                        
                        <div data-role="collapsible" <%if (expandID != null && expandID.equals("7")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 4')">Table
                                <br><font class="collapsive_subtitle">Pre-Prescription: Assessment Checklist</font>
                                </h3>
								<%@include  file="table4.jsp"%>
                        </div>
                        
                        <div id="section8" data-role="collapsible" <%if (expandID != null && expandID.equals("8")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 5')">Table
                                <br><font class="collapsive_subtitle">Pre-Prescription: Patient Education Checklist</font>
                                </h3>
								<%@include  file="table5.jsp"%>
                        </div>
                        
                        <div id="section9"  data-role="collapsible" <%if (expandID != null && expandID.equals("9")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 6')">Table
                                <br><font class="collapsive_subtitle">Pre-Prescription: Laboratory Tests</font>
                                </h3>
								<%@include  file="table6.jsp"%>
                        </div>
                        
                        <div data-role="collapsible" <%if (expandID != null && expandID.equals("10")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 7')">Table
                                <br><font class="collapsive_subtitle">PrEP: Prescribing Recommendations</font>
                                </h3>
								<%@include  file="table7.jsp"%>
                        </div>
                        --%>
                       	<% sectionID=2; %>
                        <div  id="section<%=sectionID%>"  data-role="collapsible" <%if (expandID != null && expandIDnum == sectionID){%> data-collapsed="false" <%}%> data-theme="<%=diagram_bar_theme%>" >
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses diagram 1')">Interactive Decision Diagram
                                <br><font class="collapsive_subtitle">PrEP Management</font>
                                <div class="debug-text">guideline1</div>
                                </h3>
								<%@include  file="guideline1.jsp"%>
                        </div>
                        
                         <%--                       
                        <div id="section11" data-role="collapsible" <%if (expandID != null && expandID.equals("11")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 8')">Table
                                <br><font class="collapsive_subtitle">PrEP: Follow-Up Visits</font>
                                </h3>
								<%@include  file="table8.jsp"%>
                        </div>
                        
                        <div  data-role="collapsible" <%if (expandID != null && expandID.equals("12")){%> data-collapsed="false" <%}%> data-theme="<%=table_bar_theme%>">
                                <h3 onClick="audit('<%= request.getRequestURI()%>','diagram','','onClick','User expands/collapses Table 9')">Table
                                <br><font class="collapsive_subtitle">PrEP: Discontinuation of Regimen</font>
                                </h3>
								<%@include  file="table9.jsp"%>
                        </div>--%>
                        
                        
        </div>
		
        <%original_guideline ="http://www.hivguidelines.org/clinical-guidelines/pre-exposure-prophylaxis/guidance-for-the-use-of-pre-exposure-prophylaxis-prep-to-prevent-hiv-transmission/";%>
                
        <!-- feedback link --->	
        <% String last_update = "August 13, 2014"; %>
    	<%@include  file="/guidelines/includes/feedback_link.jsp"%> 
        
         <%--<div class="last_update">
        	Last update:  October 15, 2012 
            <div style="float:right; margin:-5px 0px 0px 10px;"><img src="/images/cei_logo.gif" width="50" alt="CEI" /></div>
        </div>--%>

       
	</div>
<%@include  file="/guidelines/includes/footer.jsp"%>


