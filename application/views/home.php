<?=$Header;?>
	<div class="login-wrap">
	<div class="login-html">
	 <form class="memory form-horizontal" role="form" id="ToneRegisterForm" action="home/register" method="POST" autocomplete="false">
		<div class="login-form">
		<?php
         			print_r($this->session->flashdata('Errors'));
       	?>
			<div class="sign-in-htm">
				<div class="group" >
					<label for="user" class="label">FirstName :</label>
					<input name="firstname" type="text" class="input" maxlength="20" minlength="2"  autocomplete="false" />
				</div>
				<div class="group">
					<label for="pass" class="label" >LastName :</label>
					<input name="lastname" type="text" class="input"  maxlength="20" minlength="2" autocomplete="false" />
				</div>
				<div class="group">
					<label for="pass" class="label" id="ageinyears">Age In Years:</label>
					<input type="text" class="input" maxlength="3" name="age" autocomplete="false" >
				</div>
				<div class="form-group">
                    <label class="control-label col-sm-4">Gender : </label>
                    <input type="hidden" name="gender" id="hdnGender">  
                    <div class="col-sm-6">
                        <div class="row" style="display: inline-flex; width: 100%; padding-top:12px; margin-bottom: 50px;">
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
				<div class="form-group" style="display:none;">
                    <label for="sleFileNumber" class="col-sm-4 control-label" >File Number :</label>
                    <div class="col-sm-8">
                         <input type="text" id="sleFileNumber" placeholder="File Number" class="form-control" name="fileNumber" value="103B-D-2017-" autocomplete="false" />
                    </div>
                </div>
				<div class="group" id="register">
					<label for="pass" class="label" id="register"></label>
					<input type="submit" class="button" id="register" value="Register">
				</div>
				
				
			</div>
		</div>
	</form>
</div>
</div>
		<!-- JS files will load here -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="resources/js/bootstrapValidator.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#ToneRegisterForm').bootstrapValidator({
					message: 'This value is not valid',
					fields: {
						firstname: {
							validators: {
								notEmpty: {
									message: 'The firstname is required and can\'t be empty'
								},
								// stringLength: {
									// min: 2,
									// max: 30,
									// message: 'The firstname must be more than 1 and less than 30 characters long'
								// },
								// regexp: {
									// regexp: /^[a-zA-Z0-9_\.]+$/,
									// message: 'The firstname can only consist of alphabetical, number, dot and underscore'
								// }
							}
						}
					}
				});
			});
		</script>
<?=$Footer;?>