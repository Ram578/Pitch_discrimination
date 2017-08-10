$('document').ready(function(){
	
	///// upload test item page /////
	$('#uploadQtnsList').DataTable();
	
	// Set the default form values for new question when click the new question button
	$( ".UploadQuestionsList" ).on("click", "#btnNewQuestion", function(e) {
		
		$('#myModalLabel').text("New Question");
		$("#sleFile").attr("disabled", false);
		$("#uploadQuesDiv").show();
		$('#hdnQuestionID').val("-1");
		$('#newOrEdit').val("new");
		$('#quesItemCode').val("");
		$('#cboCorrectAnswer option[value=-1]').prop('selected', true);
	});
	
	// Show the required row data in the model when click the edit icon button in the table
	$( ".UploadQuestionsList" ).on("click", ".editBtn", function() {
		$('#myModalLabel').text("Edit Question");
		$("#sleFile").attr("disabled", true);
		$("#uploadQuesDiv").hide();
		
		editId = $(this).data("id");
		currentRow  = $(this).closest('tr');
		var quesItemCode = currentRow.find("td:eq(0)").text();
		var answer = currentRow.find("td:eq(2)").text();
		
		$('#hdnQuestionID').val(editId);
		$('#newOrEdit').val("edit");
		$('#quesItemCode').val(quesItemCode);
		$('#cboCorrectAnswer option[value='+answer+']').prop('selected', true);
	});
	
	//form Submit action
	$("form").submit(function(evt){	 
		evt.preventDefault();
		
		var formData = new FormData($(this)[0]);
		var url = strBaseURL+'uploadquestions/uploadquestion';
		
		//get the form values
		var quesItemCode = $('#quesItemCode').val();
		var cboCorrectAnswer = $('#cboCorrectAnswer').val();
		
		$.ajax({
			url: url,
			type: 'POST',
			data: formData,
			async: false,
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function (result) {
				var data = JSON.parse(result);
				$("#myModal").modal('hide');
				if(data.success != "failed") {
					if(data.status == "update") {
						//get current row TD's & replace the text with the updated text
						currentRow.find("td:eq(0)").text(quesItemCode);
						currentRow.find("td:eq(2)").text(cboCorrectAnswer);
						swal("Update!", data.message, "success");
					} else {
						location.reload(true);
						swal("Insert!", data.message, "success");
					}
				} else {
					swal("Warning!", "Something went wrong.", "warning");
				}
			},
			error: function (err) {
				console.log(err);
			}
	   });
	});
	
	//Delete the selected row in the aims_questions table in the db by using the ajax
	$( "#uploadQtnsList" ).on("click", ".deleteBtn", function() {
		var itemId = $(this).data("id");
		var row = $(this).closest('tr');
		// console.log(itemId);
		// showing bootstrap sweet alert for confirming the item deleting.
		swal({
		  title: "Are you sure?",
		  text: "You will not be able to recover this item!",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "Delete",
		  closeOnConfirm: false
		},
		function(){
			var url = strBaseURL+'uploadquestions/delete_question'; 
			var formData = {
				'id'  : itemId
			};
			$.ajax({
				type: "POST",
				url: url,
				data: formData,
				success: function (result) {
					//console.log(result);
					if(result == "success") {
						row.remove();
						swal("Deleted!", "Your item has been deleted.", "success");
					} else {
						swal("Warning!", "Something went wrong.", "warning");
					}
				},
				error: function (err) {
					console.log(err);
				}
			}); 
		}); 
	}); 
	
	///// Display question order page /////
	//Sortable for practice and test questions in display order page
	/*
	$( "#practiceSortable" ).sortable({
		distance:30
	});
	*/
	
	//Sortable for test questions in display order page
	$( "#testSortable" ).sortable({
		//distance:30
	});
	
	//Save the sorted questions order for practice and test questions through ajax in pitch_questions_order table
	$('.saveBtn').on("click", "#saveQuestionOrder", function () {
		var questionsOrder = {};
		//questionsOrder['practice'] = $("#practiceSortable").sortable("toArray");
		questionsOrder['test'] = $("#testSortable").sortable("toArray");
		
		swal({
		  title: "Are you sure?",
		  text: "You want to save this question order!",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-primary",
		  confirmButtonText: "Save",
		  closeOnConfirm: false
		},
		function(){
			var url = strBaseURL+'uploadquestions/save_question_order'; 
			var formData = {
				"question_order"  : questionsOrder
			};
			//console.log(questionsOrder);
			//console.log(formData);
			$.ajax({
				type: "POST",
				url: url,
				data: formData,
				success: function (result) {
					//console.log(result);
					if(result == "success") {
						//location.reload(true);
						swal("Success!", "Your questions order is saved successfully.", "success");
					} else {
						swal("Warning!", "Something went wrong.", "warning");
					}
				},
				error: function (err) {
					console.log(err);
				}
			}); 
		});
		
    });
	
	/*
	$(".edit").each(function(){
		selectedItem = $(this);
		selectedItem.click(function(){
			index = $(this).attr("data-index");
			id = $(this).attr("data-questionid");
			fnEditQuestion(index, id);
		});
	});
	*/
	
});

function fnValidateQuestionUpload()
{
	
}

function fnDeleteQuestion(question_id, active)
{
	if(question_id)
	{
		console.log(question_id);
		console.log(active);
		$.ajax({
			'type'		: 'POST',
			'url'		: strBaseURL+'uploadquestions/deletequestion', 
			'ajax' 		: true,
			'data' 		: { questionid : question_id, active : active },
			'success' 	: function(){},
			'failure' 	: function(){}
		});
	}
	
}

function fnIncludeInScore(question_id, includeinscore)
{
	if(question_id)
	{
		$.ajax({
			'type'		: 'POST',
			'url'		: strBaseURL+'uploadquestions/includeinscore', 
			'ajax' 		: true,
			'data' 		: { questionid : question_id, includeinscore : includeinscore },
			'success' 	: function(){},
			'failure' 	: function(){}
		});
	}
}

function fnEditQuestion(index, question_id)
{
	if(question_id && arrQuestions.length)
	{
		if(arrQuestions[index])
		{
			$("#sleFile").attr("disabled", true);
			$("#hdnQuestionID").val(arrQuestions[index]['id']);
			$("#sleItemCode").val(arrQuestions[index]['questioncode']);
			$("#cboOptionColor").val(arrQuestions[index]['optioncolor']);
			$("#cboOptionCount").val(arrQuestions[index]['optionscount']);
			$("#cboCorrectAnswer").val(arrQuestions[index]['answer']);
			$("#cboQuestionLevel").val(arrQuestions[index]['questionlevel']);
		}
	}
}