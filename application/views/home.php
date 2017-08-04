<?=$Header;?>
     <div class="login-wrap">
    <div class="login-html" >
     <form class="memory" role="form" id="signup-form" action="home/register" method="POST">
	         <?php
         			print_r($this->session->flashdata('Errors'));
         		?>
        <div class="login-form">
            <div class="sign-in-htm">
                <div class="group">
                    <label for="pass" id="first" class="label">FirstName :</label>
                    <input name="firstname" id="user" type="text" class="input" />
                </div>
                <div class="group">
                    <label for="pass" id="last" class="label" >LastName :</label>
                    <input name="lastname" id="name" type="text" class="input" >
                </div>
                <div class="group">
                    <label for="pass" label="years" class="label" id="ageinyears">Age In Years :</label>
                    <input type="text" id="years" class="input" >
                </div>
                <div class="form-group">
                    <label class="label col-sm-4">GENDER : </label>
                    <input type="hidden" name="gender" id="hdnGender">  
                    <div class="col-sm-6" >
                        <div class="row" style="display: inline-flex; width: 100%; padding-top:12px; margin-bottom: 50px;"><br>
                             <div class="col-sm-5">
                                <label class="radio-inline">
                                    <input type="radio" id="rdMaleGender" value="Male" name="sex" onclick="$('#hdnGender').val($(this).val());">Male
                                </label>
                            </div>
                            <div class="col-sm-5" style="margin-left:100px;">
                                <label class="radio-inline">
                                    <input type="radio" id="rdFeMaleGender" name="sex" value="Female" onclick="$('#hdnGender').val($(this).val());">Female
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="group" align="center">
                    <label for="pass" label="years" class="label" id="register"></label>
                    <input type="submit" value="Register" id="register"  style="width:40vh; height:7vh; background-color:blue; border-radius:20px; color:white;">
                </div>
                
            </div>
        </div>
    </form>
    </div>
    <div class="register login-html register" id="number" style="display:none;" >
     <form class="memory" role="form" id="signup-form">
        <div class="login-form">
            <div class="sign-in-htm">
                <div class="group">
                    <label for="pass" id="first" class="label">File Number :</label>
                    <input name="filenumber" id="file" type="text" class="input" />
                </div>
                <div class="group" align="center">
                    <label for="pass" label="years" class="label" id="register"></label>
                    <input type="submit" value="Register" id="register"  style="width:40vh; height:7vh; background-color:blue; border-radius:20px; color:white;">
                </div>
                
            </div>
        </div>
    </form>
    </div>
  </div>  
  
  
<script>
    $('.memory').on('submit',  function(e) {
    e.preventDefault();
    
     var filenumberReg = /^[0-9]+$/;
      var filenumber = $('#file').val();
     var message='';  
     var inputVal = new Array(filenumber,message);
      var inputMessage = new Array("filenumber","message");
    if(inputVal[0] == ""){
            $('#file').after('<span class="error"> Please enter your ' + inputMessage[0] + '</span>');
        }
        else if(!filenumberReg.test(filenumber)){
            $('#file').after('<span class="error"> Digits only</span>');
            
        }
        if(inputVal[1] == ""){
            $('#messageLabel').after('<span class="error"> Please enter your ' + inputMessage[1] + '</span>');
        }   
    
    });
$(document).ready(function(){
$('#signup-form').on('submit',   function(e) {
    e.preventDefault();
    validateForm();
});
    
function validateForm(){
    console.log('test');
    
    var firstnameReg = /^[A-Za-z]+$/;
    var lastnameReg = /^[A-Za-z]+$/;
    var ageinyearsReg =  /^[0-9]+$/; 
    var firstname = $('#user').val();
    var lastname = $('#name').val();
    var ageinyears = $('#years').val();
    var gender    = $('#hdnGender').val();
    var message = $('#messageInput').val();
    var inputVal = new Array(firstname, lastname, ageinyears,  gender, message);
    var inputMessage = new Array("firstname", "lastname", "ageinyears",  "gender", "message");
     $('.error').hide();
        if(inputVal[0] == ""){
            $('#user').after('<span class="error"> Please enter your ' + inputMessage[0] + '</span>');
        } 
        else if(!firstnameReg.test(firstname)){
            $('#user').after('<span class="error"> Letters only</span>');
        }
        if(inputVal[1] == ""){
            $('#name').after('<span class="error"> Please enter your ' + inputMessage[1] + '</span>');
        } 
        else if(!lastnameReg.test(lastname)){
            $('#name').after('<span class="error"> Letters only</span>');
        }
        if(inputVal[2] == ""){
            $('#years').after('<span class="error"> Please enter your ' + inputMessage[2] + '</span>');
        }
        else if(!ageinyearsReg.test(ageinyears)){
            $('#years').after('<span class="error"> Digits only</span>');
        }
        
        
        if(inputVal[4] == ""){
            $('#messageLabel').after('<span class="error"> Please enter your ' + inputMessage[4] + '</span>');
        }   
    }
});
</script>
<?=$Footer;?>