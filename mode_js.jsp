

<%
String patientID = (String)request.getParameter("patientID"); 
String patient_name = null;

String back_icon = "/guidelines/images/minus_btn.png";
String back_icon_gray = "/guidelines/images/minus_btn_gray.png";
String forward_icon = "/guidelines/images/plus_btn.png";
String forward_icon_gray = "/guidelines/images/plus_btn_gray.png";
%>

     
<script type="text/javascript" language="javascript">
	
	
	var totalSteps = 10;
	var conditionStepList = [5]; //must be selected Yes/No to go next
	//var conditionStepList = [8];
	
	

	$(document).delegate('#mode_demo', 'pageshow', disableAllRadioCheckboxes);
	$(document).delegate('#mode_my_case', 'pageshow', enableAllRadioCheckboxes);
	
	function disableAllRadioCheckboxes(){
			$("input[type='radio']").checkboxradio('disable');
			$("input[type='checkbox']").checkboxradio('disable');
	}
	
	function enableAllRadioCheckboxes(){
			$("input[type='radio']").checkboxradio('enable');
			$("input[type='checkbox']").checkboxradio('enable');
	}
	
	///////////////////////////////////////////////////////////////////////////
    $(document).ready(function() {
		$.mobile.loadPage('mode.jsp', { showLoadMsg: false } );
		
        <%if (patientID != null){ %>
            $("input[type=radio]").attr("disabled", "disabled");
            $("input[type=checkbox]").attr("disabled", "disabled");
        <%}%>
    });
    //////////////////////////////////////////////////////////////////////////
    var back_icon = "<%= back_icon %>";
    var back_icon_gray = "<%= back_icon_gray %>";
    var forward_icon = "<%= forward_icon %>";
    var forward_icon_gray = "<%= forward_icon_gray %>";
    /*************************************************************************
	*/
	function uncheckRadio(id){
		try{
			if (document.getElementById(id) != null /*&& !document.getElementById(id).style.visibility=='hidden'*/){
				$('#' + id).attr('checked', false).checkboxradio('refresh',false);
			}
		}catch(err){
			//alert("js error on  " + id + ": " + err);
		}

	}
	/*************************************************************************
	*/
    function uncheckRadios(){
		for (i=0; i <= totalSteps; i++){
			uncheckRadio('q' +  i + '_yes');
			uncheckRadio('q' +  i + '_no');
			uncheckRadio('q' +  i + '_unknown');
		}
	}
    /*************************************************************************
	*/
    function displayDiv(div){
        $("#" + div).show();
    }
	/*************************************************************************
	*/
    function hideDiv(div){
       $("#" + div).hide();
    }
    /*************************************************************************
	*/
    function changeBtnIcon(btn,txt){
        /*$("#" + btn).html(txt);
        $("span > span", $("#"+btn).parent()).html(txt);*/
        $("#" + btn).attr("src",txt);
        
    }
	/*************************************************************************
	*/
    function findNextStep(stepID){
		var stepID1 = -1;
		radios = document.getElementsByName("q"+stepID);
			
		if (stepID ==0) stepID1 = 1;
		if (stepID ==1) stepID1 = 2;
		if (stepID ==2) stepID1 = 3;
		if (stepID ==3) stepID1 = 4;
		if (stepID ==4) stepID1 = 5;
		
		if (stepID ==5 && radios[0].checked) stepID1 = 6;
		if (stepID ==5 && radios[1].checked) stepID1 = 7;
		if (stepID ==5 && radios[2].checked) stepID1 = 8;
		if (stepID ==5 && radios[3].checked) stepID1 = 9;
	
		
		return stepID1;
	}
	/*************************************************************************
	*/
	function hideNextSteps(stepID){
		nextStepID = parseInt(stepID) + 1;
		for (i=nextStepID; i <= totalSteps; i++){
			//hide next div (all foward steps)
			hideDiv('step' + i);
			changeBtnIcon("next_btn" + i, forward_icon);
		}
		changeBtnIcon("next_btn"+stepID, forward_icon);
	}
	
	/*************************************************************************
	*/
	
	
	function isConditionalStep(stepID){
		for (i=0; i < conditionStepList.length; i++)
			if (stepID == conditionStepList[i]){return true;} // no yes/no option
				
		return false;	
	}
	
	/*************************************************************************
	*/
	function showNextStep(stepID){
		nextConditionStep = false;
		nextStepID = findNextStep(stepID);
		//first, convert this step to forward icon
		changeBtnIcon("next_btn" + stepID, back_icon);
		//next, show the next step
		displayDiv('step' + nextStepID);
		
		if (isConditionalStep(nextStepID)){nextConditionStep = true;} // no yes/no option in next step
		
		if (nextConditionStep) {
			changeBtnIcon("next_btn" + nextStepID, forward_icon_gray);
			//uncheck all radio buttons
			$('input[name=q'+nextStepID + ']').attr('checked', false).checkboxradio('refresh',false);
			//$('#q'+nextStepID+'_no').attr('checked', false).checkboxradio('refresh',false);
		}
	}
    /*************************************************************************
	*/
    function goNextStep(){
			stepID = goNextStep.arguments[0];
			conditionalStep = false;
			
			
			if (isConditionalStep(stepID)){conditionalStep = true;} // no yes/no option
			
			if (stepID == "0"){ //start button
					//displayDiv('step1');
					$('#start_btn').button('disable');
			}
			//else 
			{
				if (conditionalStep){
					radios = document.getElementsByName("q"+stepID);
					checked = false;
					for (i=0; i < radios.length; i++){
						if (document.getElementsByName("q"+stepID)[i].checked==true) 
						checked = true; 
					}
					if (!checked) return;
				}
				
				nextStepID = findNextStep(stepID);
				divStep = document.getElementById('step' + nextStepID);
				//if (document.getElementById('step' + nextStepID).style.display == 'none'){ //it's currently hidden
				if (divStep != null && divStep.style.display == 'none'){
					showNextStep(stepID);
				}
				else {
					hideNextSteps(stepID);
				}
				
			}
		
    }
    /*************************************************************************
	*/
	 /*change Yes/No*/
    function changeAlert(stepID){
        hideNextSteps(stepID);
    }
  
 /*************************************************************************
	*/
	function hideAllSteps(){
		for (i=1; i <= totalSteps; i++){
				hideDiv('step' + i);
				changeBtnIcon("next_btn" + i, forward_icon);
		}
		//uncheckCheckboxes();
		uncheckRadios();
		
		$('#start_btn').button('enable');
	}
	 /*************************************************************************
	*/
	function surveyCheck(){
		$.ajax({
					type: "POST",
					url: "survey_check.jsp",
					dataType: "html",
					data:{},
					success: function(data){
						//                                                                                                                                                                                                                                                                                                                    alert(data);
						if (data.indexOf("show_survey")!= -1) {
							$.mobile.changePage( "survey.jsp", {
								transition: "none",
								role: "dialog",
								reverse: false,
								changeHash: true
							});
						}
					},
					error:function(xhr,err){
						//alert(err);
					}
		});
		
	}
	 /*************************************************************************
	*/
	
	function onSubmit(submitted,doitlater,nothanks){
		//alert("onsubmit");
		for(var i = 0; i < document.getElementsByName('easy').length; i++) {
			if(document.getElementsByName('easy')[i].checked) {
				var easy = document.getElementsByName('easy')[i].value;
			}
		}
		
		for(i = 0; i < document.getElementsByName('potential').length; i++) {
			if(document.getElementsByName('potential')[i].checked) {
				var potential = document.getElementsByName('potential')[i].value;
			}
		}
		
		
		
		for(i = 0; i < document.getElementsByName('profession').length; i++) {
			if(document.getElementsByName('profession')[i].checked) {
				var profession =  document.getElementsByName('profession')[i].value;
			}
		}
		var comment = document.getElementById('comment').value;
		//////////////////////////////////////
		
		var sessionID = '<%=session.getId() %>';
		var ipAddress = '<%= request.getRemoteAddr() %>';
	
		$.ajax({
					type: "POST",
					url: "surveySubmit.jsp",
					dataType: "html",
					data:{	'sessionID': sessionID, 
							'ipAddress' : ipAddress, 
							'easy' : easy, 
							'potential' : potential, 
							'profession' : profession, 
							'comment' : comment, 
							'submitted' : submitted, 
							'doitlater' : doitlater, 
							'nothanks' : nothanks},
					success: function(response){
						if (submitted)
							alert("Feedback submitted successfully. Thank you for your time.");
					},
						
					error:function(xhr,err){
						//alert(err);
					}
		});
	}

/*====================== GUIDELINE 2 ==========================*/
	var totalSteps2 = 9;
	var conditionStepList2 = [4,7]; //must be selected Yes/No to go next

	/*************************************************************************
	*/
    function findNextStep2(stepID){
		var stepID1 = -1;
		checkYes = false;
		checkNo = false;
		
		radios = document.getElementsByName("q"+stepID);
		if (radios.length > 0 && radios[0] != null ) checkYes = radios[0].checked;
		if (radios.length > 1 && radios[1] != null ) checkNo = radios[1].checked;
		//if ( document.getElementsByName("q"+stepID)[2] != null ) checkUnknown = document.getElementsByName("q"+stepID)[2].checked;
			
		if (stepID ==0) stepID1 = 1;
		if (stepID ==1) stepID1 = 2;
		if (stepID ==2) stepID1 = 3;
		if (stepID ==3) stepID1 = 4;
		if (stepID ==4 && checkYes) stepID1 = 5;
		if (stepID ==4 && checkNo) stepID1 = 6;
		if (stepID ==5) stepID1 = 7;
		if (stepID ==7 && checkYes) stepID1 = 9;
		if (stepID ==7 && checkNo) stepID1 = 8;
		
		return stepID1;
	}
	
	/*************************************************************************
	*/
	function hideNextSteps2(stepID){
		nextStepID = parseInt(stepID) + 1;
		for (i=nextStepID; i <= totalSteps2; i++){
			//hide next div (all foward steps)
			hideDiv('step' + i);
			changeBtnIcon("next_btn" + i, forward_icon);
		}
		changeBtnIcon("next_btn"+stepID, forward_icon);
	}
	
	/*************************************************************************
	*/
	
	
	function isConditionalStep2(stepID){
		for (i=0; i < conditionStepList2.length; i++)
			if (stepID == conditionStepList2[i]){return true;} // no yes/no option
				
		return false;	
	}
	
	/*************************************************************************
	*/
	function showNextStep2(stepID){
		nextConditionStep = false;
		nextStepID = findNextStep2(stepID);
		//first, convert this step to forward icon
		changeBtnIcon("next_btn" + stepID, back_icon);
		//next, show the next step
		displayDiv('step' + nextStepID);
		
		if (isConditionalStep2(nextStepID)){nextConditionStep = true;} // no yes/no option in next step
		
		if (nextConditionStep) {
			
			changeBtnIcon("next_btn" + nextStepID, forward_icon_gray);
			//uncheck all radio buttons
			$('#q'+nextStepID+'_yes').attr('checked', false).checkboxradio('refresh',false);
			$('#q'+nextStepID+'_no').attr('checked', false).checkboxradio('refresh',false);
		}
	}
	
	/*************************************************************************
	*/
    function goNextStep2(){
			stepID = goNextStep2.arguments[0];
			conditionalStep = false;
			
			
			if (isConditionalStep2(stepID)){conditionalStep = true;} // no yes/no option
			
			if (stepID == "0"){ //start button
					//displayDiv('step1');
					$('#start_btn').button('disable');
			}
			
			if (conditionalStep){
				radios = document.getElementsByName("q"+stepID);
				checked = false;
				for (i=0; i < radios.length; i++){
					if (document.getElementsByName("q"+stepID)[i].checked==true) 
					checked = true; 
				}
				if (!checked) return;
			}
			
			nextStepID = findNextStep2(stepID);
			divStep = document.getElementById('step' + nextStepID);
			//if (document.getElementById('step' + nextStepID).style.display == 'none'){ //it's currently hidden
			if (divStep != null && divStep.style.display == 'none'){
				showNextStep2(stepID);
			}
			else {
				hideNextSteps2(stepID);
			}
			
			
    }
	
	
	
	
</script>

