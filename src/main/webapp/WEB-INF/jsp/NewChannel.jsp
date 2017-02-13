
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>New Channels</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />

<!-- for model -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.first-column {
	width: 100%;
	float: left;
}

.second-column {
	width: 114%;
	float: right;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.multiselect').multiselect();
		$('.datepicker').datepicker();
	});
</script>
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
	<div class="wrapper row3">
		<main class="hoc container clear">
		 <!-- main body --> <!-- ################################################################################################ -->
		
		<form action="channelList.html" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="user" value="${user }" />

			<div class="col-sm-3" style="margin-left: -421px;margin-right: 0;"></div>
			<div class="col-sm-3" style="width: 55%;">

				<h4>The Total Numbers of Channels are: ${count}</h4>
			</div>
			<div class="col-sm-3">
			
				<input type="file" name="excelfile" class="form-control"
					onchange="example()" id="filename" /><br>
				<script>
					function example() {
						debugger;
						var _validFileExtensions = [ ".xls" ];
						var arrInputs = document.getElementsByTagName("input");
						alert('found');
						for (var i = 0; i < arrInputs.length; i++) {
							var oInput = arrInputs[i];
							if (oInput.type == "file") {
								var sFileName = oInput.value;

								if (sFileName.length > 0) {
									var blnValid = false;
									for (var j = 0; j < _validFileExtensions.length; j++) {
										var sCurExtension = _validFileExtensions[j];
										if (sFileName.substr(
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
						alert("done");
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
		<hr>
		<table>
			<thead>
				<tr>
					<th style="text-align: center;">SNo.</th>
					<th style="text-align: center;">Name</th>
					<th style="text-align: center;">MSO Price</th>
					<th style="text-align: center;">LCO Price</th>
					<th style="text-align: center;">Last Update</th>
					<th style="text-align: center;">Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ChannelList}" var="bill" varStatus="itr">

					<tr>
						<td>${offset + itr.index +1 }</td>
						<td>${bill.channel_name}</td>
						<td>${bill.mso_price}</td>
						<td>${bill.lco_price}</td>
						<td>${bill.updated_on}</td>
						<td style="text-align: center;"><a class="btn" href="#">Update</a></td>

					</tr>

				</c:forEach>
				<tr>
		</table>
		<div class="fl_right" style="width: 12%;">






			<button class="btn-lg btn-primary" data-toggle="modal"
				data-target="#channelmodel"
				style="padding: 0px 20px; background-color: white; border-color: darkgrey;">
				<img alt="" src="assets/img/add.png"
					style="height: 25px; width: 35px;">
			</button>

		</div>
		<tag:paginate max="15" offset="${offset}" count="${count}"
			uri="newChannel.html?user=${user}" next="&raquo;" previous="&laquo;" />


		</tbody>
		</table>

		</main>
	</div>



	<div class="modal fade" id="channelmodel" role="dialog">
		<div class="modal-dialog modal-lg" style="margin-top: 130px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="color: black;">Please Provide
						the Channel Information...</h4>
				</div>

				<input type="hidden" id="data" value="${user }" />
				<div class='form-group' style="height: 134px;">
					<div class='col-md-3' style="width: 38%; margin-left: 117px;">
						<div class='form-group internal'>
							<label for="name"
								style="margin-bottom: 0px; font-size: 14px; font-weight: 400; color: black;">Channel
								Name</label> <input type="text" name="chnName" class="form-control"
								id="channel" required />
						</div>
					</div>
					<div class='col-md-3 indent-small' style="width: 38%;">
						<div class='form-group internal'>
							<label for="name"
								style="margin-bottom: 0px; font-size: 14px; font-weight: 400; color: black;">MSO
								Price</label> <input type="text" name="msoPrice" class="form-control"
								id="msoprice" required />
						</div>
					</div>
					<div class='col-md-3 indent-small'
						style="width: 38%; margin-left: 117px;">
						<div class='form-group internal'>
							<label for="name"
								style="margin-bottom: 0px; font-size: 14px; font-weight: 400; color: black;">LCO
								Price</label> <input type="text" name="lcoPrice" class="form-control"
								id="lcoprice" required />
						</div>
					</div>
					<div class='col-md-3 indent-small' style="width: 38%;">
						<div class='form-group internal'>
							<label for="name"
								style="margin-bottom: 0px; font-size: 14px; font-weight: 400; color: black;"></label>
							<input type="submit"
								class="btn-primary btn-color btn-block pull-left" value="Submit"
								id="addData" onclick="onDropDownChange();"
								style="margin-top: 23px" />
						</div>
					</div>

				</div>

				<script>
					function addNew() {
						var chn = document.getElementById("channel").value;
						var mso = document.getElementById("msoprice").value;
						var lco = document.getElementById("lcoprice").value;
						var id = document.getElementById("data").value;
						alert("hello" + lco);
						$.ajax({
							type : 'GET',
							url : 'addSingleChn.html',
							data : {
								'chnName' : chn,
								'user' : id,
								'lcoPrice' : lco,
								'msoPrice' : mso
							},
							dataType : 'json',
							cache : false,
							beforeSend : function(xhr) {
								xhr.setRequestHeader("Accept",
										"application/json");
								xhr.setRequestHeader("Content-Type",
										"application/json");
							},
							success : function(data) {
								alert(data);
							},
							error : function(e) {

							}

						});
					}

					function onDropDownChange() {
						var reg = new RegExp('^[0-9]+$');
						var chn = document.getElementById("channel").value;
						var mso = document.getElementById("msoprice").value;
						var lco = document.getElementById("lcoprice").value;
						var id = document.getElementById("data").value;
						var flag = "true";
						if (chn === "") {
							alert("please Enter the Channel Name!!");
							flag = "false";
						}
						if (mso === "") {
							alert("please Enter the MSO Price!!");
							flag = "false";
						} else if (!(/^[0-9]{1,10}$/.test(+mso))) {
							alert("The Price must be Numeric");
							flag = "false";
						}

						if (lco === "") {
							alert("please Enter the LCO Price!!");
							flag = "false";
						} else if (!(/^[0-9]{1,10}$/.test(+lco))) {
							alert("The Price must be Numeric");
							flag = "false";
						}

						if (flag === "true") {
							$.ajax({
								url : 'addSingleChn.html',
								data : {
									'chnName' : chn,
									'user' : id,
									'lcoPrice' : lco,
									'msoPrice' : mso
								},
								type : 'GET',
								datatype : 'json',
								success : function(data) {
									alert(data);
									location.reload();
								},
								error : function() {
									alert('something bad happened');
								}
							});
						}

					}
				</script>

				<div class="modal-footer">
					<!-- 								<button type="button" class="btn btn-default" -->
					<!-- 									data-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
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
