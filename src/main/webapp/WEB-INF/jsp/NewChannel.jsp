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
<style>
select {
	/*    margin: 50px; */
	margin-bottom: 10px;
	border: 1px solid #111;
	background: transparent;
	width: 150px;
	padding: 5px 25px 5px 5px;
	font-size: 13px;
	border: 1px solid #ccc;
	height: 30px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: url(http://www.stackoverflow.com/favicon.ico) 96%/15%
		no-repeat #eee;
	border: 1px solid #111;
}
/*target Internet Explorer 9 and Internet Explorer 10:*/
@media screen and (min-width:0\0) {
	select {
		background: none;
		padding: 5px;
	}
}

.nofound {
	color: red;
	font-size: 3ex;
	margin-left: 350px;
	widows: 100%;
}
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
/* @media ( min-width : 32em) { */
/* 	.modal-box { */
/* 		width: 30%; */
/* 	} */
/* } */
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
		width: 49%;
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


<script>
				$(function(){
					var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");
						$('a[data-modal-id]').click(function(e) {
							var url = $(this).attr('value');
// 							document.getElementById("demo").innerHTML ="Complaint Number: "+url;
							 
							 var fields = url.split('#');
							 var packname =  fields[0];;
							 var mso_price = fields[1];
							 var  lco_price= fields[2];
							 var  channel_id= fields[3];
						
							
							document.getElementById('pkgname').innerHTML=packname;
							document.getElementById('msoprice').value=mso_price;
							document.getElementById('lcoprice').value=lco_price;
							document.getElementById('chnlid').value=channel_id;
									
													
							//alert(url);
						e.preventDefault();
  						  $("body").append(appendthis);
   						 $(".modal-overlay").fadeTo(500, 0.7);
   						 //$(".js-modalbox").fadeIn(500);
						var modalBox = $(this).attr('data-modal-id');
						$('#'+modalBox).fadeIn($(this).data());
						});  
  
  
						$(".js-modal-close, .modal-overlay").click(function() {
  						  $(".modal-box, .modal-overlay").fadeOut(500, function() {
    				    $(".modal-overlay").remove();
   				 });
 
				});
 
					$(window).resize(function() {
  					  $(".modal-box").css({
   					     top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
   				     left: ($(window).width() - $(".modal-box").outerWidth()) / 2
   					 });
							});
 
				$(window).resize();
 
				});
				</script>

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
		<main class="hoc container clear"> <!-- main body --> <!-- ################################################################################################ -->

		<form action="channelList.html" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="user" value="${user }" />

			<div class="col-sm-3" style="margin-left: -421px; margin-right: 0;"></div>
			<div class="col-sm-3" style="width: 55%;">

				<h4>The Total Numbers of Channels are: ${count}</h4>
			</div>
			<div class="col-sm-3">

				<input type="file" name="excelfile" class="form-control"
					onchange="example()" id="filename" /><br>
				<script>
					var chk = function example() {
						var _validFileExtensions = [ ".xls" ];
						var arrInputs = document.getElementsByTagName("input");
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
			<div class="col-sm-2  pull-right" style="margin-top: 12px;">
				<a href="#" value="" data-modal-id="popupimage">Image template</a>
			</div>
			
		</form>
		<hr>
		<table>
			<thead>
				<tr>
					<th
						style="text-align: center; color: #FFFFFF; background-color: #12a59c;">SNo.</th>
					<th
						style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Name</th>
					<th
						style="text-align: center; color: #FFFFFF; background-color: #12a59c;">MSO
						Price</th>
					<th
						style="text-align: center; color: #FFFFFF; background-color: #12a59c;">LCO
						Price</th>
					<th
						style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Last
						Update</th>
					<th
						style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ChannelList}" var="bill" varStatus="itr">

					<tr>

						<td>${offset + itr.index +1 }</td>
						<td><a href="#"
							value="${bill.channel_name }#${bill.mso_price}#${bill.lco_price}#${bill.channel_id}"
							data-modal-id="popup2">${bill.channel_name}</a></td>


						<td>${bill.mso_price}</td>
						<td>${bill.lco_price}</td>
						<td>${bill.updated_on}</td>
						<td style="text-align: center;"><button
								onclick="deletefunction('${bill.channel_id}');" class="btn">Delete</button></td>

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

	<!-- 	Update model on Anckher Tag -->

	<div id="popup2" class="modal-box">
		<header style="background-color: #3eb3b3;">
			<a href="#" class="js-modal-close close">×</a>
			<h3 id="pkgname" />


		</header>
		<div class="modal-body">
			<p id="remark" />

			<div class="container">



				<div class="form-inline marginBottom" style="margin-top: -98px;">
					<div class="md-form" style="margin-bottom: 20px;">
						<label for="form1" class="" style="color: black;">MSO
							Price:</label> <input type="text" style="width: 74%; margin-left: 4%"
							id="msoprice" class="form-control input1">

					</div>
				</div>
				<div class="form-inline marginBottom">
					<div class="md-form">
						<label for="form1" class="" style="color: black;">LCO
							Price:</label> <input type="text" style="width: 74%; margin-left: 4%"
							id="lcoprice" class="form-control input1">

					</div>
				</div>
				<input type="hidden" id="chnlid"> <br> <input
					value="Submit!" type="submit" id="submit"
					class="btn-primary btn btn-block"
					style="margin-top: 7%; margin-bottom: -26%;">

				<script>
								$("#submit").click( function() {
									var pkname = $("#pkgname").text();
								    var msprice = $("#msoprice").val();
								    var lcprice = $("#lcoprice").val();
								    var channel_id = $("#chnlid").val();
								   	var st =  $('select[name=selector]').val();
								   
								    $.ajax({  
							            type : 'GET', 
							            url: 'updateChannel.html',
							            data: {
							            	'pkgname': pkname,
							            	'msoprice': msprice,
							            	'lcoprice': lcprice,
							            	'chnl_id': channel_id,
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
								
									function deletefunction(id){
										var r = confirm("Do you Really want to Delete the Channel from the Database!");
									    if (r == true){
									    	$.ajax({  
									            type : 'GET', 
									            url: 'deleteChannel.html',
									            data: {
									            	'chnl_id': id,
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
										   
									    }else{
									    	
									    }
										  
										
									}		 	 
						  </script>


			</div>

		</div>
	</div>

	<!-- 			Ancher ag End -->

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
								id="channel_name" required />
						</div>
					</div>
					<div class='col-md-3 indent-small' style="width: 38%;">
						<div class='form-group internal'>
							<label for="name"
								style="margin-bottom: 0px; font-size: 14px; font-weight: 400; color: black;">MSO
								Price</label> <input type="text" name="msoPrice" class="form-control"
								id="mso_price" required />
						</div>
					</div>
					<div class='col-md-3 indent-small'
						style="width: 38%; margin-left: 117px;">
						<div class='form-group internal'>
							<label for="name"
								style="margin-bottom: 0px; font-size: 14px; font-weight: 400; color: black;">LCO
								Price</label> <input type="text" name="lcoPrice" class="form-control"
								id="lco_price" required />
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
							var chn = document.getElementById("channelname").value;
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
									location.reload();
									alert(data);
								},
								error : function(e) {
								}
							});
						}
						function onDropDownChange() {
							var reg = new RegExp('^[0-9]+$');
							var chn = document.getElementById("channel_name").value;
							var mso = document.getElementById("mso_price").value;
							var lco = document.getElementById("lco_price").value;
							var id = document.getElementById("data").value;
							var flag = "true";
							if (chn === "") {
								alert("please Enter the Channel Name!!");
								flag = "false";
							}else
							if (mso === "") {
								alert("please Enter the MSO Price!!");
								flag = "false";
							} else if (!(/^[0-9]{1,10}$/.test(+mso))) {
								alert("The Price must be Numeric");
								flag = "false";
							}else
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

				<div class="modal-footer"></div>
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
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
	<script>
			$(function() {

				var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

				$('a[data-modal-image]').click(function(e) {

					var url = $(this).attr('value');
					var fields = url.split('#');
					var id = fields[0];
					;

					document.getElementById('id1').innerHTML = id;

					e.preventDefault();
					$("body").append(appendthis);
					$(".modal-overlay").fadeTo(500, 0.7);
					//$(".js-modalbox").fadeIn(500);
					var modalBox = $(this).attr('data-modal-image');
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
	<div id="popupimage" class="modal-box" >
			<header
				style="border-bottom-color: #0a7777; background-color: #3eb3b3; padding: 1px;">

				<a href="#" class="js-modal-close close"
					style="line-height: 0; font-size: 2.5em; position: absolute; top: 4%; right: 1%; text-decoration: none; color: #0b212f; opacity: 15.2;">×</a>
				<h3 id="id1" style="width: 27%; color: #ffffff;"></h3>
			</header>
			<div class="container" style="padding: 10px 0;">
			<div class="form-inline marginBottom">
					<div class="md-form">
					   <img id="myImg" src="assets/img/channel_list.png" alt="Trolltunga, Norway" width="900" height="550">
					</div>
				</div>
			</div>
		</div>
	<%
		}
		%>
</body>
</html>