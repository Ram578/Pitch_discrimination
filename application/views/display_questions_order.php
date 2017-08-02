<?php include 'admin_header.php'; ?>
	<script type="text/javascript">
		var strBaseURL = "<?=base_url();?>";
	</script>
	
		<!-- Admin Dashboard Starts here -->
			<!-- Header goes here -->
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="uploadQuestionspage container">
					<div class="navbar-header">
					  <a class="navbar-brand" href="#">Dashboard</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav" style="float:none;">
							<li><a href="<?=base_url();?>userslist">Users List</a></li>
							<li><a href="<?=base_url();?>usertestresult">Test Result</a></li>
							<li class="dropdown active">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Test Questions<span class="caret" style="margin-left:10px;"></span></a>
								<ul class="dropdown-menu navbar-inverse" >
									<li><a href="<?=base_url();?>uploadquestions">Upload Test Item</a></li>
									<li><a href="#">Display Order</a></li>
								</ul>
							</li>
							<li><a href="<?=base_url();?>certilescores">Certile Scores</a></li>
							<li class="pull-right"><a href="<?=base_url();?>admindashboard/logout">Log Out</a></li>
						</ul>
					</div><!--/.nav-collapse -->
			  </div>
			</nav>
			<!-- Header ends here -->
			<!-- Body Content goes here -->
			<!-- Practice Questions sorting list section start -->
			<div>
				<a id="" class="btn btn-primary pull-right col-md-1 col-sm-1" style="width:150px; min-width:inherit; margin-bottom:2%;">Save</a>
			</div>
			<section class="adminDashboardView">
				<div class="DisplayQuestionsOrder container">
					<h3>Practice Questions:</h3>
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h1 class="panel-title">List of questions</h1>
									</div>
									<div id="container1" class="panel-body box-container">
										<!--<div itemid="itm-1" class="btn btn-default box-item">Item 1</div>
										<div itemid="itm-2" class="btn btn-default box-item">Item 2</div>
										<div itemid="itm-3" class="btn btn-default box-item">Item 3</div>
										<div itemid="itm-4" class="btn btn-default box-item">Item 4</div>
										<div itemid="itm-5" class="btn btn-default box-item">Item 5</div> -->
										<ul id="practiceSortable" class="list-group">
											<?php
												foreach($practice_questions as $row)
												{
											?>
												<li class="list-group-item" data-id="<?=$row['id'];?>"><?=$row['questioncode'];?>-<?=$row['audiofilename'];?></li>
											<?php
												}
											?>
											<!--<li class="list-group-item">Item 1</li>
											<li class="list-group-item">Item 2</li>
											<li class="list-group-item">Item 3</li>
											<li class="list-group-item">Item 4</li> -->
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Practice Questions sorting list section end -->
			<!-- Test Questions sorting list section start -->
			<section class="adminDashboardView practiceQuesSection">
				<div class="DisplayQuestionsOrder container">
					<h3>Test Questions:</h3>
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h1 class="panel-title">List of questions</h1>
									</div>
									<div id="container1" class="panel-body box-container">
										<ul id="testSortable" class="list-group">
											<?php
												foreach($test_questions as $row)
												{
											?>
												<li class="list-group-item" data-id="<?=$row['id'];?>"><?=$row['questioncode'];?>-<?=$row['audiofilename'];?></li>
											<?php
												}
											?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Test Questions sorting list section end -->
			<!-- Body Content ends here -->
		<!-- Admin Dashboard ends here -->
	<script type="text/javascript" src="<?=base_url();?>resources/js/questionupload.js"></script>
<?php include 'admin_footer.php'; ?>