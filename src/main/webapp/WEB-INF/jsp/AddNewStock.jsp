<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>AddStock</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">

<link href="assets/css/bootstrap.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

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
		width: 39%;
		margin-left: 8%;
	}
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

.err {
	width: 100%;
	color: black;
}
</style>


</head>
<body id="top">
	<%
		if (session.getAttribute("lcoLogin") == null) {
			System.out.print("session not found");
			response.sendRedirect("lcologin.html?error=Session is Expired!!!");
		} else {
			System.out.print("session found");
	%>
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
							<li><a href="billDownload.html?user=${user}">Download
									Bill</a></li>
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
			<form action="stockfile.html" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="user" value="${user }" />
				<div class="col-sm-3"></div>
				<div class="col-sm-3">
					<input type="file" name="excelfile" class="form-control"
						onchange="example()" id="filename" /><br>
					<script>
						function example() {
							var _validFileExtensions = [ ".xls" ];
							var arrInputs = document
									.getElementsByTagName("input");

							for (var i = 0; i < arrInputs.length; i++) {
								var oInput = arrInputs[i];
								if (oInput.type == "file") {
									var sFileName = oInput.value;

									if (sFileName.length > 0) {
										var blnValid = false;
										for (var j = 0; j < _validFileExtensions.length; j++) {
											var sCurExtension = _validFileExtensions[j];
											if (sFileName
													.substr(
															sFileName.length
																	- sCurExtension.length,
															sCurExtension.length)
													.toLowerCase() == sCurExtension
													.toLowerCase()) {
												blnValid = true;
												break;
											}
										}
										if (!blnValid) {
											alert("Sorry, "
													+ sFileName
													+ " is invalid File , allowed extensions are: "
													+ _validFileExtensions
															.join(", "));
											return false;
										}
									}
								}
							}
							return true;
						}

						function checkValue(data) {
							if (data == null || data == "") {
								alert('Please select the File First!!!');
								return false;
							}
						}
					</script>

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
				<script type="text/javascript">
					$(document).ready(function() {
						$("#myButton").click(function() {
							document.getElementById("dataForm").submit();
						});
					});
				</script>


			</div>
			<div class="col-sm-2  pull-right" style="margin-top: 36px;">
				<a href="#" value="" data-modal-id="popup2">Image template</a>
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
								<a href="addStock.html?user=${user}">Clear All</a>
							</div>
						</div>
					</div>

					<form:form method="POST" action="uploadstockdata.html"
						modelAttribute="StockData" id="dataForm">
						<input type="hidden" name="user" value="${user }" />
						<table
							class="table table-striped table-bordered table-hover fontsize"
							cellspacing="0" rules="all" border="1"
							id="ContentPlaceHolder1_gvdash"
							style="width: 100%; border-collapse: collapse;">
							<tr>
								<th scope="col"
									style="width: 5%; color: #FFFFFF; background-color: #12a59c;">SNo.</th>
								<th scope="col"
									style="width: 30%; color: #FFFFFF; background-color: #12a59c;">Brand</th>
								<th scope="col"
									style="width: 30%; color: #FFFFFF; background-color: #12a59c;">MSO</th>
								<th scope="col"
									style="width: 30%; color: #FFFFFF; background-color: #12a59c;">Warranty</th>

							</tr>
							<tr>
								<c:forEach items="${StockData.bulkstock}" var="user"
									varStatus="itr">
									<tr>
										<td>${itr.index}</td>
										<td><form:input path="bulkstock[${itr.index}].Brand"
												style=" width: 135px;" /></td>
										<td><form:input path="bulkstock[${itr.index}].mso"
												style=" width: 135px;" /></td>
										<td><form:input path="bulkstock[${itr.index}].warranty"
												style=" width: 135px;" /></td>

									</tr>
								</c:forEach>
							</tr>


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
	<a id="backtotop" href="#top" style="visibility: visible; opacity: .5;"><i
		class="fa fa-chevron-up"></i></a>

	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js "></script>
	<script src="layout/scripts/jquery.backtotop.js "></script>
	<script src="layout/scripts/jquery.mobilemenu.js "></script>
	<script>
		$(function() {

			var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

			$('a[data-modal-id]').click(function(e) {

				var url = $(this).attr('value');
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
						$(".modal-box").css(
								{
									top : ($(window).height() - $(".modal-box")
											.outerHeight()) / 2,
									left : ($(window).width() - $(".modal-box")
											.outerWidth()) / 2
								});
					});

			$(window).resize();

		});
	</script>
	<div id="popup2" class="modal-box" style="width: 39%; margin-left: 4%;">
		<header
			style="border-bottom-color: #0a7777; background-color: #3eb3b3; padding: 1px;">

			<a href="#" class="js-modal-close close"
				style="line-height: 0; font-size: 2.5em; position: absolute; top: 4%; right: 1%; text-decoration: none; color: #0b212f; opacity: 15.2;">×</a>
			<h3 id="id1" style="width: 27%; color: #ffffff;"></h3>
		</header>
		<div class="container" style="padding: 10px 0;">
			<div class="form-inline marginBottom">
				<div class="md-form">
					<img id="myImg" src="assets/img/stoklist.png"
						alt="Trolltunga, Norway" width="900" height="550">
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>
