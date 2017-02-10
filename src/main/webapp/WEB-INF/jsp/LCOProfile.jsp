

<!DOCTYPE html>

<html>
<head>
<title>LCO Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1 " />
<meta charset="utf-8">
<meta name="viewport "
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no ">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />


<link
	href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/css/bootstrap-switch.css'
	rel='stylesheet' type='text/css'>
<link
	href='http://davidstutz.github.io/bootstrap-multiselect/css/bootstrap-multiselect.css'
	rel='stylesheet' type='text/css'>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/js/bootstrap.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/js/bootstrap-switch.min.js'
	type='text/javascript'></script>
<script
	src='http://davidstutz.github.io/bootstrap-multiselect/js/bootstrap-multiselect.js'
	type='text/javascript'></script>
<style>
.indent-small {
	margin-left: 5px;
}

.form-group.internal {
	margin-bottom: 0;
}

.dialog-panel {
	margin: 10px;
}

.datepicker-dropdown {
	z-index: 200 !important;
}

.panel-body {
	background: #e5e5e5;
	/* Old browsers */
	background: -moz-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%,
		color-stop(0%, #e5e5e5), color-stop(100%, #ffffff));
	/* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* IE10+ */
	background: radial-gradient(ellipse at center, #e5e5e5 0%, #ffffff 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e5e5e5',
		endColorstr='#ffffff', GradientType=1);
	/* IE6-9 fallback on horizontal gradient */
	font: 600 15px "Open Sans", Arial, sans-serif;
}

label.control-label {
	font-weight: 600;
	color: #777;
}
</style>

<script type="text/javascript ">
      $(document).ready(function() {
      $('.multiselect').multiselect();
      $('.datepicker').datepicker();
      });
      </script>

<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</head>
<body id="top ">
	<div class="bgded overlay"
		style="background-image: url('images/demo/backgrounds/01.png');">
		<!-- ################################################################################################ -->
   <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="LCOHome.html?user=${user }">PaySpot</a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
            <li><a href="allSubscriber.html?user=${user }">Connection</a></li>
              <li><a href="allCollection.html?user=${user }">Collection</a></li>
               <li><a href="allComplaint.html?user=${user }">Complaint</a></li>
          <li><a class="drop" href="#">Services</a>
            <ul>
         	  <li><a href="newConnn.html?user=${user }">Add Subscriber</a></li>
              <li><a href="newLineman.html?user=${user}">Add LineMan</a></li>
               <li><a href="addStock.html?user=${user}">Add Stock</a></li>       
               <li><a href="topUp.html?user=${user }">Topup</a></li>           
             
            </ul>
          </li>
          <li><a class="drop" href="#">Repository</a>
            <ul>
             <li><a href="allLM.html?user=${user }">Line Man</a></li>
               <li><a href="stock.html?user=${user }">Stock</a></li>
              <li><a href="newPackage.html?user=${user }">Packages</a></li>                  
              <li><a href="newChannel.html?user=${user}">Channels</a></li>
              
            </ul>
          </li>
          <li><a href="lcoDetail.html?user=${user }">Profile</a></li>
          <li><a href="logOut.html?user=${user}" style="margin-right: -90px;">Log out</a></li>
        </ul>
      </nav>
    </header>
  </div>
		<div class="wrapper row3 ">
			<main class="hoc container clear "> <!-- main body --> <!-- ################################################################################################ -->

			<div class='container' style="margin-top: -128px;">
				<div class='panel panel-primary dialog-panel'>
					<div class='panel-heading'>
						<h5 style="font-size: 18px;font-weight: 800;">Local Cable Operator Detail</h5>
					</div>
					<div class='panel-body'>
						<form class='form-horizontal' role='form'>
							<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'
									for='id_title'>User Information</label>
								<div class='col-md-8'>
									<div class='col-md-3'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">LCO Code</label>
											<input requried class='form-control' 
												readonly value='${LCODetail.loc_code }' type='text'>
										</div>
									</div>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Username</label>
											<input class='form-control' readonly
												value='${LCODetail.login_id }' type='text'>
										</div>
									</div>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Password</label>
											<input requried class='form-control' id='id_last_name'
												readonly value='${LCODetail.password }' type="password">
										</div>
									</div>

								</div>
							</div>
					<hr>
							<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'
									for='id_title'>Account Information</label>
								<div class='col-md-8'>
									<div class='col-md-3'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">JV Number</label>
											<input requried class='form-control' id='id_first_name'
												readonly value='${LCODetail.jv_no }' type='text'>
										</div>
									</div>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Direct Number</label>
											<input class='form-control' id='id_middle_name' readonly
												value='${LCODetail.direct_no }' type='text'>
										</div>
									</div>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">BRM PO Id</label>
											<input requried class='form-control' id='id_last_name'
												readonly value='${LCODetail.brm_po_id }' type='text'>
										</div>
									</div>

								</div>
							</div>
							
							
							<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'></label>
								<div class='col-md-6'>
									<div class='form-group'>
										<div class='col-md-9' style="width: 72%;float: left; margin-right: 20px;"">
											<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Account No.</label>
											 <input requried="requried "
													class='form-control' id='address' readonly
													value='${LCODetail.account_no }' type='text'>
										

										</div>
									</div>
								
								</div>
							</div>
							<hr>
					

							<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'
									for='id_title'>Name</label>
								<div class='col-md-8'>
									<div class='col-md-3'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">First Name</label>
											<input requried="requried " class='form-control' id='crf_no'
												readonly value='${LCODetail.f_name }' type='text'>
										</div>
									</div>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Middle Name</label>
											<input requried="requried " class='form-control' id='crf_no'
												readonly value='${LCODetail.m_name }' type='text'>
										</div>
									</div>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Last Name</label>
											<input requried="requried " class='form-control' id='gst_no'
												readonly value='${LCODetail.l_name }' type="file ">
										</div>
									</div>

								</div>
							</div>
							<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'
									for='id_title'></label>
								<div class='col-md-8'>
									<div class='col-md-3'>
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Mobile</label>
										<input requried="requried " class='form-control'
												id='mobile_no' readonly value='${LCODetail.mobile }'type='text'>
										</div>
									</div>
									<div class='col-md-6 indent-small' style="width: 50.5%;">
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Email</label>
										<input requried="requried " class='form-control'
												id='email_id' readonly value='${LCODetail.emaiil }' type='text'>
										</div>
									</div>


								</div>
							</div>
							<hr>
							<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'>Address</label>
								<div class='col-md-6'>
									<div class='form-group'>
										<div class='col-md-9' style="width: 72%;">
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">Add</label>
											<input requried class='form-control' id='address'
												readonly value='${LCODetail.address }' type='text'>
										</div>
									</div>
									
								</div>
							</div>

								<div class='form-group' style="margin-left: -200px;">
								<label class='control-label col-md-2 col-md-offset-2'
									for='id_title'></label>
								<div class='col-md-8'>
									<div class='col-md-4' style="width: 38%;">
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">State</label>
											<input requried class='form-control' id='gst_no'
												readonly value='${LCODetail.state }' type='text'>
										</div>
									</div>

									<div class='col-md-4 indent-small' style="width: 38%;">
										<div class='form-group internal'>
										<label for="name" style="margin-bottom: 0px;font-size: 14px;font-weight: 400;">City</label>
											<input requried class='form-control' id='gst_no'
												readonly value='${LCODetail.city }' type='text'>
										</div>
									</div>

								</div>
							</div>
							<hr/>

						</form>
					</div>
				</div>
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear "></div>
			</main>
		</div>

		<!-- <div class= "wrapper coloured "> -->
		<!--   <div id= "social " class= "hoc clear ">  -->
		<!--     ################################################################################################ -->
		<!--     <div class= "one_half first "> -->
		<!--       <h6 class= "title ">Social Media</h6> -->
		<!--       <ul class= "faico clear "> -->
		<!--         <li><a class= "faicon-facebook " href= "# "><i class= "fa fa-facebook "></i></a></li> -->
		<!--         <li><a class= "faicon-pinterest " href= "# "><i class= "fa fa-pinterest "></i></a></li> -->
		<!--         <li><a class= "faicon-twitter " href= "# "><i class= "fa fa-twitter "></i></a></li> -->
		<!--         <li><a class= "faicon-dribble " href= "# "><i class= "fa fa-dribbble "></i></a></li> -->
		<!--         <li><a class= "faicon-linkedin " href= "# "><i class= "fa fa-linkedin "></i></a></li> -->
		<!--         <li><a class= "faicon-google-plus " href= "# "><i class= "fa fa-google-plus "></i></a></li> -->
		<!--         <li><a class= "faicon-vk " href= "# "><i class= "fa fa-vk "></i></a></li> -->
		<!--         <li><a class= "faicon-youtube " href= "# "><i class= "fa fa-youtube "></i></a></li> -->
		<!--         <li><a class= "faicon-rss " href= "# "><i class= "fa fa-rss "></i></a></li> -->
		<!--       </ul> -->
		<!--     </div> -->
		<!--     <div class= "one_half "> -->
		<!--       <h6 class= "title ">Newsletter sign-up</h6> -->
		<!--       <form class= "clear " method= "post " action= "# "> -->
		<!--         <fieldset> -->
		<!--           <legend>Newsletter:</legend> -->
		<!--           <input type= "text " value= " " placeholder= "Type Email Here&hellip; "> -->
		<!--           <button class= "fa fa-share " type= "submit " title= "Submit "><em>Submit</em></button> -->
		<!--         </fieldset> -->
		<!--       </form> -->
		<!--     </div> -->
		<!-- ################################################################################################ -->
		<!--   </div> -->
		<!-- </div> -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="one_third first">
      <h6 class="title">Quam aliquam ac</h6>
      <p>Molestie metus non pharetra felis donec volutpat molestie ligula imperdiet laoreet dolor scelerisque eu nunc aliquet tortor erat ut tempus justo tristique.</p>
      <p>Condimentum vivamus tempus nisi et augue fringilla aliquet mauris scelerisque sollicitudin justo non posuere nunc mollis facilisis purus imperdiet aliquet nisi consectetur et phasellus.</p>
    </div>
    <div class="one_third">
      <h6 class="title">Morbi ullamcorper</h6>
      <ul class="nospace linklist contact">
        <li><i class="fa fa-map-marker"></i>
          <address>
          E-6 &amp; Kailash Coloney, <br>                
          110042
          </address>
        </li>
        <li><i class="fa fa-phone"></i> +91 (123) 456 7890</li>
        <li><i class="fa fa-fax"></i> +00 (123) 456 7890</li>
        <li><i class="fa fa-envelope-o"></i> Sahib@gmail.com</li>
      </ul>
    </div>
    <div class="one_third">
      <h6 class="title">Finibus mauris</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="#">Suscipit mauris nunc</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
            <p class="nospace">Euismod leo pulvinar a aenean vehicula varius eros convallis sagittis integer&hellip;</p>
          </article>
        </li>
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="#">Eros magna sed</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-05">Thursday, 5<sup>th</sup> April 2045</time>
            <p class="nospace">Posuere donec posuere elit condimentum aliquet eget eu elit sed eget massa&hellip;</p>
          </article>
        </li>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">Payspot.in</a></p>
  
    <!-- ################################################################################################ -->
  </div>
</div>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<a id="backtotop " href="#top "><i class="fa fa-chevron-up "></i></a>
		<!-- JAVASCRIPTS -->
		<script src="layout/scripts/jquery.min.js "></script>
		<script src="layout/scripts/jquery.backtotop.js "></script>
		<script src="layout/scripts/jquery.mobilemenu.js "></script>
</body>
</html>
