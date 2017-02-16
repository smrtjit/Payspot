<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>Stock</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<style>
/* ////////////////////////////////////////////////////////////////////////////////////// */
.v-center {
	height: 100vh;
	width: 100%;
	display: table;
	position: relative;
	text-align: center;
}

.v-center>div {
	display: table-cell;
	vertical-align: middle;
	position: relative;
	top: -10%;
}

.btn {
	font-size: 2.5vmin;
	padding: 0.15em .75em;
	/*   background-color: #fff; */
	border: 1px solid #bbb;
	/*   color: #333; */
	text-decoration: none;
	display: inline;
	/*   border-radius: 4px; */
	-webkit-transition: background-color 1s ease;
	-moz-transition: background-color 1s ease;
	transition: background-color 1s ease;
}

.btn
:hover {
	background-color: #ddd;
	-webkit-transition: background-color 1s ease;
	-moz-transition: background-color 1s ease;
	transition: background-color 1s ease;
}

.btn-small {
	padding: .75em 1em;
	font-size: 0.8em;
}

.modal-box {
	display: none;
	position: absolute;
	z-index: 1000;
	width: 98%;
	background: white;
	border-bottom: 1px solid #aaa;
	border-radius: 4px;
	box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	border: 1px solid rgba(0, 0, 0, 0.1);
	background-clip: padding-box;
}

@media ( min-width : 32em) {
	.modal-box {
		width: 70%;
	}
}

h2 {
	margin: 1.75em 0 0;
	font-size: 5vw;
}

h3 {
	font-size: 1.3em;
}

.v-center {
	height: 100vh;
	width: 100%;
	display: table;
	position: relative;
	text-align: center;
}

.v-center>div {
	display: table-cell;
	vertical-align: middle;
	position: relative;
	top: -10%;
}

.btn {
	font-size: 2.5vmin;
	padding: 0.15em .75em;
	/*   background-color: #fff; */
	border: 1px solid #bbb;
	/*   color: #333; */
	text-decoration: none;
	display: inline;
	/*   border-radius: 4px; */
	-webkit-transition: background-color 1s ease;
	-moz-transition: background-color 1s ease;
	transition: background-color 1s ease;
}

.btn:hover {
	background-color: #ddd;
	-webkit-transition: background-color 1s ease;
	-moz-transition: background-color 1s ease;
	transition: background-color 1s ease;
}

.btn-small {
	padding: .75em 1em;
	font-size: 0.8em;
}

.modal-box {
	display: none;
	position: absolute;
	z-index: 1000;
	width: 98%;
	background: white;
	border-bottom: 1px solid #aaa;
	border-radius: 4px;
	box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	border: 1px solid rgba(0, 0, 0, 0.1);
	background-clip: padding-box;
}

@media ( min-width : 32em) {
	.modal-box {
		width: 70%;
	}
}

.modal-box header, .modal-box .modal-header {
	padding: 1.25em 1.5em;
	border-bottom: 1px solid #ddd;
}

.modal-box header h3, .modal-box header h4, .modal-box .modal-header h3,
	.modal-box .modal-header h4 {
	margin: 0;
}

.modal-box .modal-body {
	padding: 2em 1.5em;
}

.modal-box footer, .modal-box .modal-footer {
	padding: 1em;
	border-top: 1px solid #ddd;
	background: rgba(0, 0, 0, 0.02);
	text-align: right;
}

.modal-overlay {
	opacity: 0;
	filter: alpha(opacity = 0);
	position: absolute;
	top: 0;
	left: 0;
	z-index: 900;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.3) !important;
}

a.close {
	line-height: 1;
	font-size: 1.5em;
	position: absolute;
	top: 5%;
	right: 2%;
	text-decoration: none;
	color: #bbb;
}

a.close:hover {
	color: #222;
	-webkit-transition: color 1s ease;
	-moz-transition: color 1s ease;
	transition: color 1s ease;
}
</style>


</head>
<body id="top">
	
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
				<form:form action="searchLCOConByLCO.html" method="get">
					<input type="hidden" name="user" value="${user }" />
					<div class="col-sm-3">
						<div style="margin-bottom: 10px">
							<input name="fdate" type="text" id="fdate" tabindex="1"
								class="form-control" placeholder="From Date" />

						</div>

					</div>
					<div class="col-sm-3">
						<div style="margin-bottom: 10px">

							<input name="edate" type="text" id="edate" tabindex="2"
								class="form-control" placeholder="To Date" />

						</div>
					</div>


					<div class="col-sm-3">
						<div style="margin-bottom: 10px">
							<input name="stb_no" type="text" id="fdate" tabindex="3"
								class="form-control" placeholder="STB No." />
						</div>

					</div>

					<div class="col-sm-3">
						<div style="margin-bottom: 10px">

							<input name="VC_No" type="text" id="ContentPlaceHolder1_txtvcno"
								tabindex="4" class="form-control" placeholder="VC No." />
						</div>
					</div>
					<div class="col-sm-3">
						<div style="margin-bottom: 10px">
							<input name="mobile" type="text"
								id="ContentPlaceHolder1_txtmobile" tabindex="5"
								class="form-control" placeholder="Mobile No." />

						</div>

					</div>

					<div class="col-sm-3">
						<div style="margin-bottom: 10px">
							<select name="status" id="ContentPlaceHolder1_ddlstatus"
								tabindex="6" class="form-control">
								<option value="0">Select</option>
								<option value="Pending">Offline</option>
								<option value="Live">Live</option>
								<option value="Expire">Expire</option>

							</select>

						</div>

					</div>
					<div class="col-sm-3">
						<div style="margin-bottom: 10px">
							<input name="pckg" type="text"
								id="ContentPlaceHolder1_txtpackage" tabindex="7"
								class="form-control" placeholder="Package Name" />

						</div>

					</div>


					<div class="col-sm-3">
						<div style="margin-bottom: 10px">

							<input type="submit"
								name="ctl00$ContentPlaceHolder1$btn_submit_request"
								style="border-radius: 8px; padding: 4px;" value="Search"
								id="ContentPlaceHolder1_btn_submit_request" tabindex="30"
								class="btn-primary btn-color btn-block pull-left" />


						</div>

					</div>
					<div class="nofound">${error}</div>
				</form:form>

			</div>



			<div class="col-sm-12">
				<hr />
				<div class="titleTd"
					style="width: 25%; margin-bottom: -35px; text-align: center; padding: 10px; font-size: x-large; color: #c4c1e8; background-color: dimgray; border-top-left-radius: 34px; border-top-right-radius: 54px;">Stock</div>
				<div style="width: 40%; margin-left: 890px;" class="col-sm-12">
					<div style="margin-bottom: 0px">
						<p>
							Total Count : <span id="ContentPlaceHolder1_lblcount"
								style="font-weight: bold;">${count }</span>
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
							style="width: 5%; color: #FFFFFF; background-color: #12a59c;">SNo.</th>
						<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">STB
							Number</th>
						<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Brand</th>
						<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">MSO</th>
						<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Status</th>
						<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Expiry
							Date</th>
					</tr>

					<tr>
						<c:forEach items="${StbList}" var="user" varStatus="itr">
							<tr>
								<td style="width: 5%;">${offset + itr.index +1 }</td>
								<td><a href="#" value="${user.stbNo}"
									data-modal-id="popup2">${user.stbNo}</a></td>




								<td>${user.brand}</td>
								<td>${user.MSO}</td>
								<td>${user.stbStatus}</td>
								<td>${user.warranty}</td>


							</tr>
						</c:forEach>

					</tr>
				</table>

				<tag:paginate max="15" offset="${offset}" count="${count}"
					uri="stock.html?user=${user}" next="&raquo;" previous="&laquo;" />
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
		<script>
			$(function() {

				var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

				$('a[data-modal-id]').click(function(e) {

					var url = $(this).attr('value');

					// 							document.getElementById("demo").innerHTML ="Complaint Number: "+url;

					var fields = url.split('#');

					var id = fields[0];
					;

					document.getElementById('id1').innerHTML = id;

					e.preventDefault();
					$("body").append(appendthis);
					$(".modal-overlay").fadeTo(500, 0.7);
					//$(".js-modalbox").fadeIn(500);
					var modalBox = $(this).attr('data-modal-id');
					$('#' + modalBox).fadeIn($(this).data());
				});

				$(".js-modal-close, .modal-overlay").click(function() {
					$(".modal-box, .modal-overlay").fadeOut(500, function() {
						$(".modal-overlay").remove();
					});

				});

				$(window).resize(
						function() {
							$(".modal-box")
									.css(
											{
												top : ($(window).height() - $(
														".modal-box")
														.outerHeight()) / 2,
												left : ($(window).width() - $(
														".modal-box")
														.outerWidth()) / 2
											});
						});

				$(window).resize();

			});
		</script>
		<div id="popup2" class="modal-box">
			<header
				style="border-bottom-color: #0a7777; background-color: #3eb3b3; padding: 1px;">

				<a href="#" class="js-modal-close close"
					style="line-height: 0; font-size: 2.5em; position: absolute; top: 4%; right: 1%; text-decoration: none; color: #0b212f; opacity: 15.2;">×</a>
				<table style="border-color: #3eb3b3;">
					<tbody>
						<tr>
							<td style="width: 27%; color: #ffffff; border-color: #3eb3b3;">
								<h3>Complaint ID:</h3>
							</td>
							<td style="border-color: #3eb3b3;">
								<h3 id="id1" style="width: 27%; color: #ffffff;">123456789</h3>
							</td>
						</tr>
					</tbody>
				</table>


			</header>

			<div class="container" style="padding: 10px 0;">
				<%-- 					<form id="contact" action="#"> --%>

				<div class="form-inline marginBottom">
					<div class="md-form">
						<div class='col-md-8' style="margin-bottom: 22px;">
							<div class="form-group internal">
								<label for="name"
									style="width: 330%; margin-left: -306px; margin-bottom: 0px; font-size: 12px; font-weight: 400; color: black;">VC
									Number</label> <input type="text"
									style="width: 140%; margin-left: -156.5%;" class="form-control"
									readonly="">
							</div>
							<div class='col-md-3 indent-small'>
								<div class='form-group internal'>
									<label for="name"
										style="width: 230%; margin-left: 240%; margin-bottom: 1px; font-size: 12px; font-weight: 400; color: black;">Name</label>
									<input type='text' style="width: 230%; margin-left: 240%;"
										class="form-control" readonly />
								</div>
							</div>
							<div class='col-md-3 indent-small'>
								<div class='form-group internal'>
									<label for="name"
										style="width: 230%; margin-left: 378.5%; margin-bottom: 0px; font-size: 12px; font-weight: 400; color: black;">Mobile</label>
									<input type='text' style="width: 230%; margin-left: 378.5%;"
										class="form-control" readonly />
								</div>
							</div>

						</div>

						<br>
						<textarea type="text" name="remark" class="form-control" readonly
							style="overflow: auto; margin-left: 23px; width: 95%; resize: none"></textarea>
					</div>
					<br> <br> <input value="Submit!" type="submit"
						id="submit" class="btn-primary btn btn-block"
						style="width: 29%; height: 26px; font-size: 12px; margin-left: 35%;">

				</div>

			</div>
		</div>
</body>
</html>