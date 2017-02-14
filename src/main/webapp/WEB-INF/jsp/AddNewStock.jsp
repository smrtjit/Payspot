<!DOCTYPE html>

<html>
<head>
<title>AddStock</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">

<link href="assets/css/bootstrap.css" rel="stylesheet" />



</head>
<body id="top">
	<div class="bgded overlay"
		style="background-image: url('images/demo/backgrounds/01.png');">
		<!-- ################################################################################################ -->
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
								<li><a href="newConnn.html?user=${user }">Add
										Subscriber</a></li>
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
		<div class="wrapper row3">
			<main class="hoc container clear"> <!-- main body -->

			<div class="row">
				<form action="processExcel.html" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="user" value="${user }" />
					<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<input type="file" name="excelfile" class="form-control"
							onchange="example()" id="filename" /><br>


					</div>
					<div class="col-sm-2">

						<input type="submit" value="Upload"
							class="btn-primary btn btn-block"
							onclick="return checkValue(document.getElementById('filename').value);" />
					</div>
				</form>

				<div class="col-sm-2">

					<input type="button" value="Submit" id="myButton" tabindex="12"
						class="btn-danger btn btn-block" />


				</div>
				<div class="col-sm-2">

					<input type="button" value="Template"
						class="btn-primary btn btn-block" id="myBtn" />
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" style="padding: 1px 1px;">
									<img id="myImg" src="assets/img/bulktemplate.png"
										alt="Trolltunga, Norway" width="1000" height="600">
								</div>
							</div>
						</div>
					</div>


				</div>


			</div>
			<hr>

			<div class="col-sm-12">
				<div class="col-sm-12">
					<div style="margin-bottom: 0px">
						<p>
							Total No.of Data Uploaded : <span
								id="ContentPlaceHolder1_lblcount" style="font-weight: bold;"></span>
						</p>
						<div class="row">
							<div class="col-sm-2  pull-right" style="height: 1px;">
								<div class="container"
									style="margin-left: 64px; margin-top: -106px;">
									<a href="lcoTopUp.html?user=${user}">Clear All</a>
								</div>
							</div>
						</div>

						<form:form method="POST" action="uploadBulkTopup.html"
							modelAttribute="bulkData" id="dataForm">
							<input type="hidden" name="user" value="${user }" />
							<table
								class="table table-striped table-bordered table-hover fontsize"
								cellspacing="0" rules="all" border="1"
								id="ContentPlaceHolder1_gvdash"
								style="width: 100%; border-collapse: collapse;">
								<tr>
									<th scope="col"
										style="width: 5%; color: #FFFFFF;background-color: #12a59c;">SNo.</th>
									<th scope="col" style="color: #FFFFFF;background-color: #12a59c;">Customer
										ID</th>
									<th scope="col" style="color: #FFFFFF;background-color: #12a59c;">VC
										No</th>
									<th scope="col" style="color: #FFFFFF;background-color: #12a59c;">Name</th>
									<th scope="col" style="color: #FFFFFF;background-color: #12a59c;">Email</th>
									<th scope="col" style="color: #FFFFFF;background-color: #12a59c;">Connection
										Status</th>
									<th scope="col" style="color: #FFFFFF;background-color: #12a59c;">Create
										Time</th>

								</tr>

								<!-- 								<tr> -->
								<%-- 									<c:forEach items="${userList}" var="user" varStatus="itr"> --%>
								<!-- 										<tr> -->
								<%-- 											<td style="width: 5%;">${offset + itr.index +1 }</td> --%>
								<%-- 											<td><a href="#" value=${user.username --%>
								<%-- 												} --%>
								<%-- 												data-modal-link="popup3">${user.username}</a></td> --%>

								<%-- 											<td>${user.customer_vc_no}</td> --%>
								<%-- 											<td>${user.customer_name}</td> --%>
								<%-- 											<td>${user.customer_email}</td> --%>
								<%-- 											<td>${user.connection_status}</td> --%>
								<%-- 											<td>${user.timestamp}</td> --%>

								<!-- 										</tr> -->
								<%-- 									</c:forEach> --%>

								<!-- 								</tr> -->
							</table>


						</form:form>


					</div>
				</div>


				<div></div>

			</div>

			<div class="clear"></div>
			</main>
		</div>
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
		<script src="layout/scripts/jquery.min.js"></script>
		<script src="layout/scripts/jquery.backtotop.js"></script>
		<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>