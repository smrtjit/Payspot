<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<!DOCTYPE html>

<html>
<head>
<title>New LineMan</title>
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
	<div class="wrapper row1">
		<header id="header" class="hoc clear">
			<!-- ################################################################################################ -->
			<div id="logo" class="fl_left">
				<h1>
					<a href="LCOHome.html?user=${user }">PaySpot</a>
				</h1>
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

						</ul></li>
					<li><a class="drop" href="#">Repository</a>
						<ul>
							<li><a href="allLM.html?user=${user }">Line Man</a></li>
							<li><a href="stock.html?user=${user }">Stock</a></li>
							<li><a href="newPackage.html?user=${user }">Packages</a></li>
							<li><a href="newChannel.html?user=${user}">Channels</a></li>

						</ul></li>
					<li><a href="lcoDetail.html?user=${user }">Profile</a></li>
					<li><a href="logOut.html?user=${user}"
						style="margin-right: -90px;">Log out</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="wrapper row3 ">
		<main class="hoc container clear "> <!-- main body --> <!-- ################################################################################################ -->

		<div class='container' style="margin-top: -128px;">
			<div class='panel panel-primary dialog-panel'
				style="border-color: #333333;">
				<div class='panel-heading'
					style="background-color: #072c31; border-color: #333333;">
					<h4>Create New Line Man</h4>
				</div>
				<div class='panel-body'>
				<form:form action="addLMUser.html" method="get" class='form-horizontal' role='form'
						commandName="LMUSER" autocomplete="off">
						<input type="hidden" name="user" value="${user }" />
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Name</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
									<form:input path="firstName" placeholder='First Name' required="required" class='form-control'/>
										
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
									<form:input path="middlename" placeholder='Middle Name' required="required" class='form-control'/>
<!-- 										<input class='form-control' id='id_middle_name' -->
<!-- 											placeholder='Middle Name' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
									<form:input path="lastName" placeholder='Last Name' required="required" class='form-control'/>
<!-- 										<input required class='form-control' id='id_last_name' -->
<!-- 											placeholder='Last Name' type='text'> -->
									</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Contact Detail</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
									<form:input path="mobile" placeholder='Mobile Number' required="required" class='form-control'/>
<!-- 										<input required="required " class='form-control' -->
<!-- 											id='mobile_no' placeholder='Mobile Number' type='text'> -->
									</div>
								</div>
								<div class='col-md-6 indent-small' style="width: 50.5%;">
									<div class='form-group internal'>
									<form:input path="email_id" placeholder='Email ID' required="required" class='form-control'/>
<!-- 										<input required="required " class='form-control' id='email_id' -->
<!-- 											placeholder='Email ID' type='text'> -->
									</div>
								</div>


							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>ID Proof</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<select required="required " class="form-control "
											id="id_title ">
											<option>Select Type</option>
											<option>Ms</option>
											<option>Mrs</option>
											<option>Miss</option>
											<option>Dr</option>
										</select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="identity_proof" placeholder='ID Number' required="required" class='form-control'/>
<!-- 										<input required="required " class='form-control' id='crf_no' -->
<!-- 											placeholder=' ID Number' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
<%-- 										<form:input path="firstName" placeholder='GST Number' required="required" class='form-control'/> --%>
										<input required class='form-control' id='gst_no'
											name='PhotoID' type='File'>
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Addredd Proof</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<select required="required " class="form-control "
											id="id_title ">
											<option>Select Type</option>
											<option>Ms</option>
											<option>Mrs</option>
											<option>Miss</option>
											<option>Dr</option>
										</select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
									<form:input path="add_proof" placeholder='ID Number' required="required" class='form-control'/>
<!-- 										<input required="required " class='form-control' id='crf_no' -->
<!-- 											placeholder=' ID Number' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
<%-- 									<form:input path="firstName" placeholder='GST Number' required="required" class='form-control'/> --%>
										<input required="required " name="PhotoId" class='form-control' id='gst_no'
											 type='File'>
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'>Address</label>
							<div class='col-md-6'>
								<div class='form-group'>
									<div class='col-md-9' style="width: 72%;">

										<form:input path="Address" placeholder='Address' required="required" class='form-control'/>
									</div>
								</div>

							</div>
						</div>


						<div class='form-group'
							style="margin-left: -200px; margin-top: -15px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'></label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<select class="form-control " id="id_title ">
											<option>Select State</option>
											<option value=" ">Andaman and Nicobar Islands</option>
											<option value=" ">Andhra Pradesh</option>
											<option value=" ">Arunachal Pradesh</option>
											<option value=" ">Assam</option>
											<option value=" ">Bihar</option>
											<option value=" ">Chhattisgarh</option>
											<option value=" ">Chandigarh</option>
											<option value=" ">Dadra and Nagar Haveli</option>
											<option value=" ">Daman and Diu</option>
											<option value=" ">Delhi</option>
											<option value=" ">Goa</option>
											<option value=" ">Gujarat</option>
											<option value=" ">Haryana</option>
											<option value=" ">Himachal Pradesh</option>
											<option value=" ">Jammu & Kashmir</option>
											<option value=" ">Jharkhand</option>
											<option value=" ">Karnataka</option>
											<option value=" ">Kerala</option>
											<option value=" ">Madhya Pradesh</option>
											<option value=" ">Maharashtra</option>
											<option value=" ">Manipur</option>
											<option value=" ">Meghalaya</option>
											<option value=" ">Mizoram</option>
											<option value=" ">Nagaland</option>
											<option value=" ">Odisha</option>
											<option value=" ">Punjab</option>
											<option value=" ">Rajasthan</option>
											<option value=" ">Sikkim</option>
											<option value=" ">Tamil Nadu</option>
											<option value=" ">Telangana</option>
											<option value=" ">Tripura</option>
											<option value=" ">Uttar Pradesh</option>
											<option value=" ">Uttarakhand</option>
											<option value=" ">West Bengal</option>
											<option value=" ">Lakshadweep</option>
											<option value=" ">Puducherry</option>
										</select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:select required="true" path="city" class="form-control" >
										<form:option value="">Select City</form:option>
										<form:options items="${citylist}" />
									</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
									<form:input path="Address" placeholder='Pin Code' required="required" class='form-control'/>
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Role & Responsibility</label>
							<div class='col-md-8'>
								<div class='col-md-4' style="width: 38%;">
									<div class='form-group internal'>
									<form:input path="designation" placeholder='Role' required="required" class='form-control'/>
<!-- 										<input required="required " class='form-control' id='gst_no' -->
<!-- 											placeholder='Role' type='text'> -->
									</div>
								</div>

								<div class='col-md-4 indent-small' style="width: 38%;">
									<div class='form-group internal'>
									<form:input path="responsibility" placeholder='Responsibility' required="required" class='form-control'/>
<!-- 										<input required="required " class='form-control' id='gst_no' -->
<!-- 											placeholder='Responsibility' type='text'> -->
									</div>
								</div>

							</div>
						</div>




						<div class='form-group' style="margin-left: -200px;">
							<div class='col-md-offset-4 col-md-3'>
								<button class="btn-lg btn-primary " type="submit "
									style="font-size: 13px;">Save Connection</button>
							</div>
							<div class='col-md-3'>
								<button class='btn-lg btn-danger'
									style='float: right; font-size: 13px;' type='submit'>Cancel</button>
							</div>
						</div>
					</form:form>
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
				<p>Molestie metus non pharetra felis donec volutpat molestie
					ligula imperdiet laoreet dolor scelerisque eu nunc aliquet tortor
					erat ut tempus justo tristique.</p>
				<p>Condimentum vivamus tempus nisi et augue fringilla aliquet
					mauris scelerisque sollicitudin justo non posuere nunc mollis
					facilisis purus imperdiet aliquet nisi consectetur et phasellus.</p>
			</div>
			<div class="one_third">
				<h6 class="title">Morbi ullamcorper</h6>
				<ul class="nospace linklist contact">
					<li><i class="fa fa-map-marker"></i>
						<address>
							E-6 &amp; Kailash Coloney, <br> 110042
						</address></li>
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
							<h2 class="nospace font-x1">
								<a href="#">Suscipit mauris nunc</a>
							</h2>
							<time class="font-xs block btmspace-10" datetime="2045-04-06">
								Friday, 6<sup>th</sup> April 2045
							</time>
							<p class="nospace">Euismod leo pulvinar a aenean vehicula
								varius eros convallis sagittis integer&hellip;</p>
						</article>
					</li>
					<li>
						<article>
							<h2 class="nospace font-x1">
								<a href="#">Eros magna sed</a>
							</h2>
							<time class="font-xs block btmspace-10" datetime="2045-04-05">
								Thursday, 5<sup>th</sup> April 2045
							</time>
							<p class="nospace">Posuere donec posuere elit condimentum
								aliquet eget eu elit sed eget massa&hellip;</p>
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
			<p class="fl_left">
				Copyright &copy; 2016 - All Rights Reserved - <a href="#">Payspot.in</a>
			</p>

			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>

	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js "></script>
	<script src="layout/scripts/jquery.backtotop.js "></script>
	<script src="layout/scripts/jquery.mobilemenu.js "></script>
</body>
</html>
