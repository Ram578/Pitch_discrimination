$(document).ready(function(){
	
	$('#subScoresList').DataTable();
	
	//Edit the row
	$( ".subScoresView" ).on("click", ".editBtn", function() {
		editId = $(this).data("id");
		currentRow  = $(this).closest('tr');
		var questions = currentRow.find("td:eq(0)").text();
		var scoreRange = currentRow.find("td:eq(1)").text();
		
		//append the values to the edit form
		$('#id').val(editId);
		$('#questions').val(questions);
		$('#score-range').val(scoreRange);
	});
	
	//modal form submit
	$("#editRow").submit(function(e) {
		e.preventDefault();
		var url = strBaseURL+'subscores/edit_subscores'; 
		var id = $('#id').val();
		var questions = $('#questions').val();
		var scoreRange = $('#score-range').val();
		
		var formData = {
			'id' : id,
			'questions'    : questions,
			'score_range' : scoreRange
		}; 
	
		$.ajax({
			type: "POST",
			url: url,
			data: formData,
			success: function (result) {
				var data = JSON.parse(result);
				$("#myModal").modal('hide');
				if(data.success != "failed") {
					if(data.status == "update") {
						//get current row TD's & replace the text with the updated text
						currentRow.find("td:eq(0)").text(questions);
						currentRow.find("td:eq(1)").text(scoreRange);
						swal("Update!", data.message, "success");
					} else {
						swal("Warning!", "Something went wrong.", "warning");
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
	
	// Save the sub scores active status on onchange event.
	$( ".subScoresView" ).on("change", "#activeSubscores", function(e) {
		var row_id = $(this).data("id");
		
		if ($(this).is(":checked"))
		{
			// it is checked
			var active = 1;
		} else {
			var active = 0;
		}
		
		$.ajax({
			'type'		: 'POST',
			'url'		: strBaseURL+'subscores/inactive_subscores', 
			'ajax' 		: true,
			'data' 		: { rowId : row_id, active : active },
			'success' 	: function(){},
			'failure' 	: function(){}
		});
		
	});
	
});
