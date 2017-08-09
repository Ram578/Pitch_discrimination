<?=$Header;?>	
	<!-- Body content goes here -->
	<section class="intro-wrapper nextbranch-view">
		<div class="container">
			<div class="row">
				<!-- When the page loads Audio will auto play -->
				<audio id="ctrlaudioNextBranch" class="audio-control" controls="controls" runat="server" autoplay>
					   <source src='resources/audio/next-branch/1.wav'></source>
				</audio>
			<!-- Audio Play count list -->
				<div id="ctrlcount" class="text-center img-view">
					<img src="resources/img/next/1.jpg" alt="" title="" />        
				</div>
			<!-- Auido Play count list ends here -->
			
			<!-- Next and New example Buttons will appear once the Audio will finish -->
				<!-- Screen to check next or new example -->
				<?php var_dump($Questions); ?>
				<div class="intro-screen-01  col-md-8 col-sm-10 col-xs-10 col-md-offset-2 col-sm-offset-1 col-xs-offset-1" style="display:none;">
					<a href="tonaltest" class="next-button col-md-4 col-sm-4 col-xs-4 text-center col-md-offset-1 col-sm-offset-1 col-xs-offset-1">Start</a>
				</div>		
				<!-- Screen to check next or new example ends -->
			</div>
		</div>
	</section>
	<!-- Body content ends here -->
	
	<!-- JS files will load here -->
	<script type="text/javascript" src="<?=base_url();?>resources/js/nextbranch.js"></script>
<?=$Footer;?>