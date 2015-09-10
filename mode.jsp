


<%@include  file="/guidelines/includes/header.jsp"%>
<%@include  file="mode_js.jsp"%>
<%
session.setAttribute("case_visited","true");
String pageID = "PrEP-";
data_overlay_theme = "d";
int optionID = 0;
int nodeID = 0;

String pdfurl = (String)request.getRequestURI();
pdfurl = pdfurl.replace("mode.jsp","card_full.pdf");

%>

<div data-role="dialog" <%if (patientID != null){ %> id="mode_demo" <%} else {%> id="mode_my_case" <%}%> data-dom-cache="true" data-overlay-theme="<%=data_overlay_theme%>" data-theme="<%=data_theme%>" >
    <% 
	
	String nav = "guideline"; 
    int totalSteps = 10;
	boolean hide[] = new boolean[totalSteps+1]; //value 0 is for Start button
	int radioCheck[] = new int[totalSteps+1];
	
	for (int i=1; i <= totalSteps; i++) hide[i] = true;
	for (int i=1; i <= totalSteps; i++) radioCheck[i] = -1;
	
	
	//for each patient demo case
	if (patientID != null)
	{
		if (patientID.equals("1")){int visibleSteps[] = {1,2,3,4,5,6}; for (int i=0;i<visibleSteps.length;i++){hide[visibleSteps[i]]=false;}  radioCheck[5] = 0;}
		if (patientID.equals("2")){int visibleSteps[] = {1,2,3,4,5,7}; for (int i=0;i<visibleSteps.length;i++){hide[visibleSteps[i]]=false;}  radioCheck[5] = 1;}
		if (patientID.equals("3")){int visibleSteps[] = {1,2,3,4,5,8}; for (int i=0;i<visibleSteps.length;i++){hide[visibleSteps[i]]=false;}  radioCheck[5] = 2;}
		if (patientID.equals("4")){int visibleSteps[] = {1,2,3,4,5,9}; for (int i=0;i<visibleSteps.length;i++){hide[visibleSteps[i]]=false;}  radioCheck[5] = 3;}
	}
	%>
		
	   
	 <div data-role="content" <% if (patientID == null) {  %> style="height:1800px;" <%}%> >
     
        <%@include file="/guidelines/includes/close_btn_top.jsp"%>
        
        <p class="info_title popup_title">PrEP Management
        
        </p>
		<% if (patientID == null) { %>
        	 <strong>Define & Explore My  Case</strong>
        <%} else {%>
        	<strong>Sample Case <%= patientID%> (view only)</strong> 
        <%}%>
       
        <br><br>
         
        <div class=" ui-body <%= div_class %> mode-node" >
            <strong>Note</strong>: PrEP is indicated for individuals who have a documented negative HIV test result
            and are at ongoing high risk for HIV infection. A negative HIV test result needs to be confirmed as close  
            to initiation of PrEP as possible, ideally on the same day the prescription is given. 
            Clinicians should wait to prescribe PrEP until confirmation of a negative test result is available.
        </div>  
        
        <br>
       
        <% stepID = "0"; %>
        <%-- Start Button ----------------------------------------------------------------%>
        <%@include file="/guidelines/includes/start_btn.jsp"%>
        
        <%--- STEP 1 Oral Mucosal Ulcer    --%>
        <% stepID = "1";%>
        <div id="step<%=stepID%>" class="step" <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body ui-body-<%=header_theme%> <%=div_class%> final_middle_recommendation" >
               <strong>Pre-Prescription Visit</strong>: 
               <ul class='single'>
                <li>Discuss PrEP use; clarify misconceptions 
                <li>Perform following laboratory tests: 
                <ul class='single'>
                	<li>HIV test (see 
                        <a href="step_info.jsp?info=inst7" data-inline="true" data-rel="dialog" data-transition="<%=transition%>" data-theme="c" class="recommendation">Table: Pre-Prescription: Laboratory Tests</a>
                        for guidance on what type of test to use) </li>
                    <li>Metabolic panel </li>
                    <li>Urinalysis </li>
                    <li>Hepatitis A, B, and C serology </li>
                    <li>STI screening </li>
                    <li>Pregnancy test</li>
                 </ul>
                </ul>
            </div>
            <%@include file="/guidelines/includes/next_btn1.jsp"%>
        </div>    
        
		<%--- STEP 2: Clinical diagnosis: Herpes labialis--%>
		<% stepID = "2";%>
        <div id="step<%=stepID%>" class="step" <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class=" ui-body <%= div_class %> final_recommendation" >
            After confirmation of negative HIV test: 
            <ul class="single">
               <li>
                <strong>Prescribe 30-day supply of PrEP </strong></li>
                <li>
                Follow up in 2 weeks to assess side effects 
                (in person or by phone) </li>
                </ul>
                
            </div>
            <%@include file="/guidelines/includes/next_btn1.jsp"%>
        </div> <!-- end of step 2 --> 
       
       <%--- STEP 3: Ulcer  --%>
       <% stepID = "3";%>
        <div id="step<%=stepID%>" class="step" <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body <%= div_class %> final_recommendation" >
                <strong>Adherence</strong> and commitment should be 
                assessed at <strong>each visit</strong>. Schedule visits every 30 
                days for patients who report poor adherence 
                or intermittent use. 
                
            </div>
         <%@include file="/guidelines/includes/next_btn1.jsp"%>
        </div> <!--// end of step 4 --> 
        
        <%--- STEP 4: 30-day visit--%>
        <% stepID = "4";%>
        <div id="step<%=stepID%>" class="step"  <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body  <%= div_class %> final_recommendation" >
                <strong>30-day visit
                
                <a href="note.jsp?info=inst1" data-inline="true" data-rel="dialog" data-transition="<%=transition%>" data-theme="c" class="recommendation">(note)</a>
                        
                </strong><br><br>
                Assess:
                <ul class='single'>  
                <li>Side effects </li> 
                <li>Serum creatinine and calculated creatinine clearance for patients with borderline renal function or at increased risk for kidney disease (>65 years of age, black race, hypertension, or diabetes) </li> 
                <li>Discuss risk reduction and provide condoms </li> 
                </ul>  
                <br><strong>Prescribe 60-day refill; patient must come in for 3-month visit for HIV test and follow-up assessments, then 90-day schedule can begin.</strong>
                
            </div>
         <%@include file="/guidelines/includes/next_btn1.jsp"%>
        </div> <!--// end of step 5 --> 
       
       
       <%--- STEP 4: WHICH VISITS--%>
		<% stepID = "5";%>
        <div id="step<%=stepID%>" class="step" <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class=" ui-body <%= div_class %> middle_recommendation" >
	            Please select follow-up visit
                
                <div class="yesnobutton" align="center"> 
                    <fieldset data-role="controlgroup" class="ui-body" >
                        <%optionID = 0;%>
                        <input type="radio"  name="q<%=stepID%>" id="q<%=stepID%>_<%=optionID%>"  value="<%=optionID%>" onChange="audit('<%= request.getRequestURI()%>','q<%=stepID%>','','onChange','<%=pageID%>User selects option <%=optionID%> of step <%= stepID%>');changeAlert('<%= stepID %>');" <% if (radioCheck[Integer.parseInt(stepID)] == optionID) { %> checked <%}%>>
                        <label for="q<%=stepID%>_<%=optionID%>" class="input_text">3-month visit</label>
                        <%optionID++;%>
                        <input type="radio"  name="q<%=stepID%>" id="q<%=stepID%>_<%=optionID%>"  value="<%=optionID%>" onChange="audit('<%= request.getRequestURI()%>','q<%=stepID%>','','onChange','<%=pageID%>User selects option <%=optionID%> of step <%= stepID%>');changeAlert('<%= stepID %>');" <% if (radioCheck[Integer.parseInt(stepID)] == optionID) { %> checked <%}%>>
                        <label for="q<%=stepID%>_<%=optionID%>" class="input_text">6-month visit</label>
                        <%optionID++;%>
                        <input type="radio"  name="q<%=stepID%>" id="q<%=stepID%>_<%=optionID%>"  value="<%=optionID%>" onChange="audit('<%= request.getRequestURI()%>','q<%=stepID%>','','onChange','<%=pageID%>User selects option <%=optionID%> of step <%= stepID%>');changeAlert('<%= stepID %>');" <% if (radioCheck[Integer.parseInt(stepID)] == optionID) { %> checked <%}%>>
                        <label for="q<%=stepID%>_<%=optionID%>" class="input_text">9-month visit</label>
                        <%optionID++;%>
                        <input type="radio"  name="q<%=stepID%>" id="q<%=stepID%>_<%=optionID%>"  value="<%=optionID%>" onChange="audit('<%= request.getRequestURI()%>','q<%=stepID%>','','onChange','<%=pageID%>User selects option <%=optionID%> of step <%= stepID%>');changeAlert('<%= stepID %>');" <% if (radioCheck[Integer.parseInt(stepID)] == optionID) { %> checked <%}%>>
                        <label for="q<%=stepID%>_<%=optionID%>" class="input_text">12-month visit</label>
                     
                  </fieldset> 
               </div>
            </div>
            <%@include file="/guidelines/includes/next_btn1.jsp"%>
        </div> <!-- end of step 4 --> 
       
        
       <%--- STEP 6:3-month visit--%>
        <% stepID = "6";%>
        <div id="step<%=stepID%>" class="step"  <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body  <%= div_class %> final_recommendation" >
                <p>  
                <strong>3-month visit</strong>
                <ul class='single'> 
                <li>HIV test</li>   
                <li>Serum creatinine and calculated creatinine clearance </li> 
                <li>Ask about STI symptoms</li> 
                <li>Pregnancy test</li> 
                <li>Discuss risk reduction and provide condoms</li> 
                </ul></p>
            </div>
         <%@include file="/guidelines/includes/end_btn.jsp"%>
        </div> <!--// end of step 6 --> 
        
        <%--- STEP 7:3-month visit--%>
        <% stepID = "7";%>
        <div id="step<%=stepID%>" class="step"  <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body  <%= div_class %> final_recommendation" >
                <p>  
                <strong>6-month visit</strong>
                <ul class='single'> 
                <li>HIV test</li> 
                <li>Pregnancy test</li>  
                <li>Obtain STI screening tests 
                (see  <a href="step_info.jsp?info=inst9" data-inline="true" data-rel="dialog" data-transition="<%=transition%>" data-theme="c" class="recommendation">Table: PrEP: Follow-Up Visits</a>)</li> 
                <li>Discuss risk reduction and provide condoms</li> 
                </ul></p>
            </div>
         <%@include file="/guidelines/includes/end_btn.jsp"%>
        </div> <!--// end of step 7 --> 
       
       <%--- STEP 8:9-month visit--%>
        <% stepID = "8";%>
        <div id="step<%=stepID%>" class="step"  <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body  <%= div_class %> final_recommendation" >
                <p>  
                <strong>9-month visit</strong>
                <ul class='single'> 
                <li>HIV test</li> 
                <li>Serum creatinine and calculated creatinine clearance </li> 
                <li>Ask about STI symptoms</li> 
                <li>Pregnancy test </li> 
                <li>Discuss risk reduction and provide condoms </li> 
                </ul></p>
            </div>
         <%@include file="/guidelines/includes/end_btn.jsp"%>
        </div> <!--// end of step 8 -->
  
        <%--- STEP 9:12-month visit--%>
        <% stepID = "9";%>
        <div id="step<%=stepID%>" class="step"  <% if (patientID == null || hide[Integer.parseInt(stepID)]) { %> style="display:none;" <%}%> >
            <%@include file="/guidelines/includes/arrow.jsp"%> 
            <div class="ui-body  <%= div_class %> final_recommendation" >
              	<p>  
                <strong>12-month visit</strong>
                <ul class='single'>  
                <li>HIV test</li> 
                <li>Pregnancy test</li> 
                <li>Obtain STI screening tests (see 
                		<a href="step_info.jsp?info=inst9" data-inline="true" data-rel="dialog" data-transition="<%=transition%>" data-theme="c" class="recommendation">Table: PrEP: Follow-Up Visits</a>)</li> 
                <li>Urinalysis </li> 
                <li>HCV serology for MSM, IDUs, and those with multiple sexual partners </li> 
                <li>Discuss risk reduction and provide condoms </li> 
                </ul></p>
            </div>
         <%@include file="/guidelines/includes/end_btn.jsp"%>
        </div> <!--// end of step 9 -->

    </div> <!-- end of content -->

</div> <!-- page -->