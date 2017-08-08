<?=$Header;?>
<div class="login-wrap">
 <div class="login-html">
	<div class="intro-wrapper registrer-wrapper" id="demo" >
	<!-- Registration Block goes here -->
        <form class="form-horizontal col-sm-8 col-sm-offset-2" role="form" id="pitchRegisterForm" action="home/check_register" method="POST" autocomplete="false">
			<?php
				print_r($this->session->flashdata('Errors'));
			?>
			<!--h2>Registration Form</h2-->
			<div class="form-group"  style="margin-top:10%; ">
				<label for="sleFileNumber" class="col-sm-4 col-sm-offset-2 control-label" style="margin-bottom:7px;">File Number :</label>
				
				<div class="col-sm-4 col-sm-offset-4"  >
					<input type="text" id="sleFileNumber" placeholder="File Number" class="form-control" name="filenumber" value="103B-D-2017-" autocomplete="false" />
				</div>
				
			</div>
			<div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4" >
                        <button  disabled="disabled" type="submit" id="RegisterBtn" class="btn btn-primary btn-block" >Register</button>
                    </div>
                </div>
		
        </form> <!-- /form -->
    	<!-- Registration Block ends here -->
		</div>
		
	</div>
	</div>
		<!-- JS files will load here -->
		<!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!--<script src="resources/js/formValidator.js"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#pitchRegisterForm').bootstrapValidator({
					message: 'This value is not valid',
					fields: {
						filenumber: {
							validators: {
								notEmpty: {
									message: 'The file Number is required and can\'t be empty'
								},
								
								regexp: {
									regexp: /^[a-zA-Z0-9-]+$/,
									message: 'The File Number can only consist of alphabetical, number, Hypen'
								}
							}
						}
					}
				});
				/*$('#pitchRegisterForm').bootstrapValidator({
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
						},
						fileNumber: {
							validators: {
								notEmpty: {
									message: 'The file Number is required and can\'t be empty'
								},
								
								regexp: {
									regexp: /^[a-zA-Z0-9-]+$/,
									message: 'The File Number can only consist of alphabetical, number, Hypen'
								}
							}
						}
					}
				}); */
				
			}); //document end
		</script>
<?=$Footer;?>