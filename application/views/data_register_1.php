<?=$Header;?>
<!--<div class="login-wrap">-->
	<div class="login-html">
		<div class="intro-wrapper registrer-wrapper" id="id">
			<!-- Registration Block goes here -->
			<form class="form-horizontal col-sm-8" role="form" id="dataRegisterForm" action="register" method="POST" autocomplete="false" >
         		<?php
         			print_r($this->session->flashdata('Errors'));
         		?>
				<input type="hidden" id="sleFileNumber" placeholder="File Number" class="form-control" name="filenumber" value="<?php echo $file_number?>" autocomplete="false" />
                <!--h2>Registration Form</h2-->
                <div class="form-group"style="margin-top:3%;">
                    <label for="sleFirstName" class="col-sm-4 col-sm-offset-2  control-label"> First Name : </label>
                    <div class="col-sm-4 col-sm-offset-4" style="width:62%;">
                        <input type="text" id="sleFirstName" placeholder="First Name" class="form-control" maxlength="30" minlength="2" name="firstname" autocomplete="false" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="sleLastName" class="col-sm-4 col-sm-offset-2 control-label"> Last Name : </label>
                    <div class="col-sm-4 col-sm-offset-4" style="width:62%;">
                         <input type="text" id="sleLastName" placeholder="Last Name" class="form-control" maxlength="30" minlength="2" name="lastname" autocomplete="false" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="sleAge" class="col-sm-4 col-sm-offset-2  control-label"> Age in Years : </label>
                    <div class="col-sm-4 col-sm-offset-4" style="width:62%;">
                        <input type="text" id="sleAge" class="form-control" placeholder="Age in years" maxlength="3" name="age" autocomplete="false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 col-sm-offset-2 control-label">Gender : </label>
                    <input type="hidden" name="gender" id="hdnGender">
                    <div class="col-sm-4 col-sm-offset-2">
                        <div class="row">
                             <div class="col-sm-4 " style="width:62%;">
                                <label class="col-sm-4 radio-inline">
                                    <input type="radio" id="rdMaleGender" value="Male" name="sex" onclick="$('#hdnGender').val($(this).val());" required>Male
                                </label>
                            </div>
                            <div class="col-sm-4  " style=" width:62%;">
                                <label class=" radio-inline">
                                    <input type="radio" id="rdFeMaleGender" name="sex" value="Female" onclick="$('#hdnGender').val($(this).val());" required>Female
                                </label>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->	
				<div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4" style="width:62%;" >
                        <button  disabled="disabled" type="submit" id="RegisterBtn" class="btn btn-primary btn-block" >Register</button>
                    </div>
                </div>
            </form> <!-- /form -->
			<!-- Registration Block ends here -->
		</div>
	</div>
<!--</div>-->
		<!-- JS files will load here -->
		<!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!--<script src="resources/js/formValidator.js"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#dataRegisterForm').bootstrapValidator({
					message: 'This value is not valid',
					fields: {
						firstname: {
							validators: {
								notEmpty: {
									message: 'The firstname is required and can\'t be empty'
								},
								stringLength: {
									min: 2,
									max: 30,
									message: 'The firstname must be more than 1 and less than 30 characters long'
								},
								regexp: {
									regexp: /^[a-zA-Z0-9_\.]+$/,
									message: 'The firstname can only consist of alphabetical, number, dot and underscore'
								}
							}
						},
					   lastname: {
							validators: {
								notEmpty: {
									message: 'The lastname is required and can\'t be empty'
								},
								stringLength: {
									min: 2,
									max: 30,
									message: 'The lastname must be more than 1 and less than 30 characters long'
								},
								regexp: {
									regexp: /^[a-zA-Z0-9_\.]+$/,
									message: 'The lastname can only consist of alphabetical, number, dot and underscore'
								}
							}
						},
						age: {
							validators: {
								notEmpty: {
									message: 'The age is required and can\'t be empty'
								},
								stringLength: {
									min: 1,
									max: 3,
									message: 'The age must be more than 1 and less than 3 characters long'
								},
								regexp: {
									regexp: /^[0-9]+$/,
									message: 'The age can only consist of number'
								}
							}
						},
						gender: {
							validators: {
								notEmpty: {
									message: 'The gender is required and can\'t be empty'
								}
							}
						}
					}
				});
			}); //document end
		</script>
<?=$Footer;?>