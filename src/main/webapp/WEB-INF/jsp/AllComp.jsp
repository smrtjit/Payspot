<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>Complaint</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
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
				<form action="searchComplaint.html">
						<input type="hidden" name="user" value="1111"  />
						<div class="col-sm-2">
							<div style="margin-bottom: 10px">
								<input name="fdate" type="text"
									id="fdate" tabindex="1"
									class="form-control" placeholder="From Date" />
							</div>

						</div>

						<div class="col-sm-2">
							<div style="margin-bottom: 10px">

								<input name="edate" type="text"
									id="edate"  tabindex="2"
									class="form-control" placeholder="To Date" />

							</div>
						</div>

						<div class="col-sm-2">
							<div style="margin-bottom: 10px">

								<input name="VC_No" type="text"
									 tabindex="2"
									class="form-control" placeholder="CAF Number" />
							</div>
						</div>
						<div class="col-sm-2">
							<div style="margin-bottom: 10px">
								<input name="mobile" type="text"
									 tabindex="1"
									class="form-control" placeholder="Mobile No." />

							</div>

						</div>
						<div class="col-sm-2">
							<div style="margin-bottom: 10px">
								<input name="status" type="text"
									 tabindex="2"
									class="form-control" placeholder="Status" />
							</div>

						</div>

						<div class="col-sm-2">
							<div style="margin-bottom: 10px">

								<input type="submit"
									name="submit"
									value="Search" id="ContentPlaceHolder1_btn_search_request"
									tabindex="30" class="btn-primary btn btn-block" />

							</div>

						</div>
						<div class="nofound">   </div>
						</form>


			</div>



			<div class="col-sm-12">
				<hr />
				<div class="titleTd" style="width: 25%;margin-bottom: -35px;text-align: center;padding: 10px;font-size: x-large;color: #c4c1e8;background-color: dimgray;border-top-left-radius: 34px;border-top-right-radius: 54px;">All
						Complaints</div>
						<div style="width: 40%;margin-left: 890px;/* font-size: 8px; */" class="col-sm-12">
					<div style="margin-bottom: 0px">
						<p>
							Total Count : <span id="ContentPlaceHolder1_lblcount" style="font-weight: bold;"></span>
						</p>
					</div>
				</div>
					<table
						class="table table-striped table-bordered table-hover fontsize"
						cellspacing="0" rules="all" border="1"
						id="ContentPlaceHolder1_gvdash"
						style="width: 100%; border-collapse: collapse;">
						<tr>
							<th scope="col"
								style="width: 5%; background-color: rgb(119, 127, 177);">SNo.</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">Customer
								ID</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">CAF Number</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">Name</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">Mobile</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">Address</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">Complaint Type</th>
							<th scope="col" style="background-color: rgb(119, 127, 177);">Complaint Status</th>
						</tr>
						
						<c:forEach items="${userList}" var="user" varStatus="itr">
							<tr>
								<td style="width: 5%;">${offset + itr.index +1 }</td>
								<td><a href="#" value="${user.complaint_no}"
									data-modal-link="popup3">${user.complaint_no}</a></td>

								<td>${user.customer_caf}</td>
								<td>${user.customer_name}</td>
								<td>${user.customer_mobile}</td>
								<td>${user.customer_add}</td>
								<td>${user.complaint_type}</td>
								<td>${user.complaint_status}</td>
							</tr>
						</c:forEach>
						
					</table>

					<tag:paginate max="15" offset="${offset}" count="${count}"
						uri="allSubscriber.html?user=${user}" next="&raquo;"
						previous="&laquo;" />
				</div>

		

			<!-- / main body -->
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