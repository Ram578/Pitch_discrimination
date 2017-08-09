var showAlert;

var showGuessAlert;

function fnSaveUserAnswer(questionid, selectedoption)
{
	$.ajax({
		'type'		: 'POST',
		'url'		: strBaseURL+'tonaltest/saveuseranswer', 
		'ajax' 		: true,
		'data' 		: { questionid : questionid, selectedoption : selectedoption },
		'success' 	: function(){},
		'failure' 	: function(){}
	});
}

function fnShowAlert()
{
	clearInterval(showAlert);

	clearTimeout(showGuessAlert);

	$('.alert-danger').fadeIn().delay(3000).fadeOut(100);
			
	showGuessAlert = setTimeout(function(){
		$('.alert-warning').fadeIn().delay(9000).fadeOut(100);
	}, 12000);
}


$('document').ready(function()
{
	function disableF5(e) { if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82) e.preventDefault(); };

	$(document).on("keydown", disableF5);
	
   // More Info Audio
	setTimeout(function(){
		$(function () {
		 //Find the audio control on the page
			var audioPlay = document.getElementById('TestAudioData');
		  // Attaches an event ended and it gets fired when current playing song get ended
			audioPlay.addEventListener('ended', function() {

		   		clearInterval(showAlert);

				clearTimeout(showGuessAlert);

				$('.tonal-test-wrapper .tonal-test-view .option-view label').css('pointer-events','inherit');

				showAlert = setInterval(function(){
					fnShowAlert();
				},8000);
			});
	   });
	},200);

	$("input.custom-radio-button").bind('click', function()
	{	
		if(!$("input.custom-radio-button:checked").val())
		{
			fnShowAlert();			
		}else
		{
			clearInterval(showAlert);

			clearTimeout(showGuessAlert);

			fnSaveUserAnswer($("input.custom-radio-button:checked").attr("data-role-id"), $("input.custom-radio-button:checked").attr("data-role-option"));
			
			setTimeout(function(){

				if((parseInt($("#hdnQuestionNo").val())+1) == arrQuestions.length)
				{
					$('.intro-screen-01').show();
					$('.container .next-practice-test').hide();
				}

				var intNextQuestion = parseInt($("#hdnQuestionNo").val())+1;

				if(arrQuestions.length > intNextQuestion)
				{
					$("#hdnQuestionNo").val(intNextQuestion);

					$("#TestAudioData").attr('src', strBaseURL+arrQuestions[intNextQuestion].audiopath);

					$("input.custom-radio-button").attr("checked",false);
					
					//Change the data-role-id for Current Question id.
					$("#id_1").attr('data-role-id', arrQuestions[intNextQuestion].id);
					$("#id_2").attr('data-role-id', arrQuestions[intNextQuestion].id);
					
					$('.tonal-test-wrapper .tonal-test-view .option-view label').css('pointer-events','none');

					audioPlay1 = document.getElementById('TestAudioData');

					audioPlay1.play();

					$("#h1QuestionCode").html(arrQuestions[intNextQuestion].questioncode);
				}
		
			}, 1000);
		}
	});
	
  /*
  // More Info Audio
	var innerHTML = "<source src='audio/new-example/1.wav'></source>";
	ctrlaudioNewExample.InnerHtml = innerHTML;
	//hdTuneMoreInfoNames = "audio/new-example/1.wav" + "," + "audio/new-example/2.wav" + "," + "audio/new-example/3.wav" + "," + "audio/new-example/4.wav" + "," + "audio/new-example/5.wav" + "," + "audio/new-example/6.wav" + "," + "audio/new-example/7o.wav" + "," + "audio/new-example/new41.wav";
	//hdImgNames = "img/new-example/1.jpg" + "," + "img/new-example/2.jpg" + "," + "img/new-example/3.gif" + "," + "img/new-example/4.jpg" + "," + "img/new-example/5.jpg" + "," + "img/new-example/6.gif" + "," + "img/new-example/71ori.jpg" + "," + "img/new-example/dummy.jpg";
	
	//test
	hdTuneMoreInfoNames = "audio/new-example/1.wav";
	hdImgNames ="img/new-example/p18.jpg";
	
	$(function () {
	 //Find the audio control on the page
	   var audio = document.getElementById('ctrlaudioNewExample');
	   var ImgCount = document.getElementById('ctrlcount');
	   //songNames holds the comma separated name of songs
	   var TuneNamesexample = hdTuneMoreInfoNames;
	   var ImgNames = hdImgNames;
	   var lstTuneExampleInfo = TuneNamesexample.split(',');
		var lstImgNames = ImgNames.split(',');
	   var curPlaying = 0;
	   var ImgPlaying = 0;
	   // Attaches an event ended and it gets fired when current playing song get ended
	   audio.addEventListener('ended', function() {
		//alert(lstTuneExampleInfo.length);
		   if (curPlaying + 1 == lstTuneExampleInfo.length ) {
			  $('.intro-screen-01').show();
			  $('.intro-wrapper .img-view').hide();
			  
		   }
			
		   var urls = audio.getElementsByTagName('source');
		   // Checks whether last song is already run
		   if (urls[0].src.indexOf(lstTuneExampleInfo[lstTuneExampleInfo.length - 1]) == -1) {
			   //replaces the src of audio song to the next song from the list
			   urls[0].src = urls[0].src.replace(lstTuneExampleInfo[curPlaying], lstTuneExampleInfo[++curPlaying]);
			   //Loads the audio song
			   audio.load();
			   //Plays the audio song
			   audio.play();
			}
			
			var Imgurls = ImgCount.getElementsByTagName('img');
		   // Checks whether last song is already run
		   if (Imgurls[0].src.indexOf(lstImgNames[lstImgNames.length - 1]) == -1) {
			   //replaces the src of audio song to the next song from the list
			   Imgurls[0].src = Imgurls[0].src.replace(lstImgNames[ImgPlaying], lstImgNames[++ImgPlaying]);
			  
			}
			
		 });
	});
	
	*/
				   
});