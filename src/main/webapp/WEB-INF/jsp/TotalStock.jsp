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

<!-- datepicker -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
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
		width: 39%;
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

.nofound {
	width: 100%;
	color: red;
	font-size: 18px;
	text-align: left;
	height: 15px;
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
			<form:form action="searchStock.html" method="get">
				<input type="hidden" name="user" value="${user }" />
				<div class="col-sm-4">
					<div style="margin-bottom: 10px">
						<input name="stbId" type="text" id="fdate" tabindex="1"
							class="form-control" placeholder="STB Id" />

					</div>

				</div>
				<div class="col-sm-4">
					<div style="margin-bottom: 10px">

						<input name="mso" type="text" id="edate" tabindex="2"
							class="form-control" placeholder="MSO Name" />

					</div>
				</div>


				<div class="col-sm-4">
					<div style="margin-bottom: 10px">
						<input name="brand" type="text" id="fdate" tabindex="3"
							class="form-control" placeholder="Brand Name" />
					</div>

				</div>



				<div class="col-sm-4">
					<div style="margin-bottom: 10px">
						<select name="type" id="ContentPlaceHolder1_ddlstatus"
							tabindex="6" class="form-control">
							<option value="">Select Type</option>
							<option value="New">New</option>
							<option value="Stand By">Stand By</option>
							<option value="Damaged">Damaged</option>
							<option value="Returned">Returned</option>
						</select>

					</div>

				</div>
				<div class="col-sm-4">
					<div style="margin-bottom: 10px">
						<select name="status" id="ContentPlaceHolder1_ddlstatus"
							tabindex="6" class="form-control">
							<option value="">Select Staus</option>
							<option value="OffLine">OffLine</option>
							<option value="Live">Live</option>
							<option value="Expire">Expire</option>

						</select>

					</div>

				</div>



				<div class="col-sm-4">
					<div style="margin-bottom: 10px">

						<input type="submit" style="border-radius: 8px; padding: 4px;"
							value="Search" tabindex="30"
							class="btn-primary btn-color btn-block pull-left" />


					</div>

				</div>

			</form:form>

		</div>

		<div class="nofound">${error}</div>

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
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">STB
						Type</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Status</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Expiry
						Date</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Remove</th>
				</tr>

				<tr>
					<c:forEach items="${StbList}" var="user" varStatus="itr">
						<tr>
							<td style="width: 5%;">${offset + itr.index +1 }</td>
							<td><a href="#" value="${user.stb_Id}"
								data-modal-id="popup2">${user.stb_Id}</a></td>



							<td>${user.brand}</td>
							<td>${user.MSO}</td>
							<td>${user.STB_Type}</td>
							<td>${user.STB_Status}</td>
							<td>${user.warranty}</td>

							<td style="text-align: center; padding: 0.5%;"><button
									onclick="deletefunction('${user.stb_Id}');" class="btn">Delete</button></td>

						</tr>

					</c:forEach>

				</tr>
			</table>
			<script type="text/javascript">
			function deletefunction(id){
			var r = confirm("Do you Really want to Delete the Package from the Database!");
		    if (r == true){

				  $.ajax({  
			            type : 'GET', 
			            url: 'deleteSTB.html',
			            data: {
			            	'stb_id': id,
			            	'user': ${user}
			            },
			            dataType: 'json',
			       		cache: false,
						beforeSend: function(xhr) 
			                        {
			                            xhr.setRequestHeader("Accept", "application/json");  
			                            xhr.setRequestHeader("Content-Type", "application/json");  
			                        },
			         				success: function (data) {
			         					 alert(data);
			         					location.reload();
		           						
				          		    },
						            error: function(e){
						            	console.warn(e);
						            	 alert(e);
						            }
			            
			      		  });
		    }else{
		    	
		    }
			   
			
		}		 
		
		
		</script>
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
							<h3>Setup Box No:</h3>
						</td>
						<td style="border-color: #3eb3b3;">
							<h3 id="id1" style="width: 27%; color: #ffffff;">123456789</h3>
						</td>
					</tr>
				</tbody>
			</table>


		</header>

		<div class="container" style="padding: 10px 0;">

			<div class="form-inline marginBottom">
				<div class="md-form">

					<script>
					$(document).ready(function() {
						$('#datepicker').datepicker({
							dateFormat : 'yy-mm-dd'
						});
						
					});
					
					  </script>
					<label for="name"
						style="width: 22%; margin-left: 63px; margin-bottom: 0px; font-size: 12px; font-weight: 400; color: black;">Expiry
						Date </label> <input type="text" style="width: 50%; margin-left: 3.5%;"
						id="datepicker" class="form-control">


				</div>
				<br> <br> <input value="Submit!" type="submit" id="submit"
					class="btn-primary btn btn-block"
					style="width: 29%; height: 26px; font-size: 12px; margin-left: 35%;">
					<script>
								$("#submit").click( function() {
									var stbid = $("#id1").text();
								    var warrantystb = $("#datepicker").val();
								    $.ajax({  
							            type : 'GET', 
							            url: 'warrantySTB.html',
							            data: {
							            	'stb_id': stbid,
							            	'warranty': warrantystb,
							            	'user':  ${ user}
							            },
							            dataType: 'json',
							       		cache: false,
										beforeSend: function(xhr) 
							                        {
							                            xhr.setRequestHeader("Accept", "application/json");  
							                            xhr.setRequestHeader("Content-Type", "application/json");  
							                        },
							         				success: function (data) {
							         					 alert(data);
							         					location.reload();
						           						
								          		    },
										            error: function(e){
										            	console.warn(e);
										            	 alert(e);
										            }
							            
							      		  });
								   
								});
								
									 	 
						  </script>

			</div>

		</div>
	</div>
	<%
		}
		%>
</body>
</html>