<%@include  file="/guidelines/includes/header.jsp"%>

<TITLE>Survey</TITLE>
 <% String survey_button_theme = "d"; %>

</HEAD>

<BODY>

<div data-role="dialog" id="surveypage" data-overlay-theme="<%=data_overlay_theme%>"  data-theme="<%=data_theme%>">
	
    <div data-role="content" >
	    
    	<div class="close_btn"> 
        <a data-role="button" data-inline= "true"  data-theme="a"   onClick="onSubmit(false,false,true);" data-rel="back" data-icon="delete" data-iconpos="notext">Close</a></div>
        
    	<p class="title">Quick Feedback</p>
		
        <form name="survey" id="survey">
        	<div style="margin-top: -10px;">
            <!--- This tool is easy to use --->
            <ol>
                <li>
                <div  class="feedback_title">This tool is easy to use:  </div>
              
                <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" >
                            <input data-theme="<%=survey_button_theme%>"  type="radio" name="easy" id="easy2" value="Agree"/>
                            <label for="easy2" class="input_text">Agree</label>
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="easy" id="easy3" value="Neutral"/>
                            <label for="easy3" class="input_text">Neutral</font></label>
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="easy" id="easy4" value="Disagree"/>
                            <label for="easy4" class="input_text">Disagree</label>
                           
                   </fieldset>
                   </li>
                   <li>
                    <!--- This tool has a potential to be adopted for use in clinical settings? --->
                    <div class="feedback_title">This tool has a potential <!--to be adopted -->for use in clinical settings:</div>
                    <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" >
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="potential" id="potential2" value="Agree"/>
                            <label for="potential2" class="input_text">Agree</label>
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="potential" id="potential3" value="Neutral"/>
                            <label for="potential3" class="input_text">Neutral</label>
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="potential" id="potential4" value="Disagree"/>
                            <label for="potential4" class="input_text">Disagree</label>
                    </fieldset>
                    </li>      
                    <!--- This tool has potential to be adopted for use in clinical settings --->
                    <li>
                    <div  class="feedback_title">Your profession: </div>
                    <fieldset data-role="controlgroup" data-mini="true" data-type="horizontal">
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="profession" id="profession1" value="Physician"/>
                            <label for="profession1" class="input_text">Physician</label>
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="profession" id="profession2" value="Nurse"/>
                            <label for="profession2" class="input_text">Nurse</label>
                            <input data-theme="<%=survey_button_theme%>" type="radio" name="profession" id="profession4" value="Other"/>
                            <label for="profession4" class="input_text">Other</label>
                    </fieldset>
                    </li>
                    <li>
                    <div class="feedback_title">Other comments:</div>
                    <textarea name="comment" id="comment"></textarea>
                    </li>
             </ol> 
            </div> 
            <div align="center" style="margin-top: -10px;"> 
            <a type="button" data-mini="true" data-rel="back" value="Submit" onClick="onSubmit(true,false,false);" data-inline="true" data-theme="b"/>Submit</a>
            <a  type="button" data-mini="true"  data-rel="back" value="No, thanks" onClick="onSubmit(false,false,true);" data-inline="true" data-theme="b"/>No, thanks</a>
            </div>
        </form>
        
 </div>   
</div> <!-- end of page -->


</BODY>
</HTML>
