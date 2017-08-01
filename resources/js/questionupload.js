$('document').ready(function(){
	
	$('#uploadQtnsList').DataTable();
	
	//Delete the row
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
					console.log(result);
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
	
	/*
	$('.delete-btn').each(function(){
		$(this).on('click', function(){
			$(this).parent().parent().remove();
		});
	});

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