<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Payspot</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
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
		width: 70%;
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
</style>

</head>
<body id="top">
	
	<div class="wrapper row1">
		<header id="header" class="hoc clear">
			<!-- ################################################################################################ -->
			<div id="logo" class="fl_left">
				<h1>
					<a href="LMDashboard.html?user=${user }">PaySpot</a>
				</h1>
			</div>
			<nav id="mainav" class="fl_right">
				<ul class="clear">
					<li><a href="LMnewConnn.html?user=${user }">Connection</a></li>

					<li><a class="drop" href="#">complaint</a>
						<ul>
							<li><a href="addComplaintLm.html?user=${user }">Add
									Complaint</a></li>
							<li><a href="LMallComp.html?user=${user }">All Complaint</a></li>
						</ul></li>
					<li><a href="lmtopUp.html?user=${user }">Topup</a></li>
					<li><a href="lmDetail.html?user=${user }">Profile</a></li>
					<li><a href="logOut.html?user=${user}"
						style="margin-right: -90px;">Log out</a></li>
				</ul>
			</nav>
		</header>
	</div>
		<div class="wrapper row3">
			<main class="hoc container clear"> <!-- Your Content -->
			<div id="container" style="margin-top: -62px;">
				<div class="row" style="margin-bottom: -20px;">
					<div class=" col-md-4 col-md-offset-4">
						<table id="ContentPlaceHolder1_rbselect" class="form-control"
							style="padding-top: 0px;">
							<tr>
								<td><span class="radio-inline"><input
										id="ContentPlaceHolder1_rbselect_0" type="radio"
										name="ctl00$ContentPlaceHolder1$rbselect" value="0" /><label
										for="ContentPlaceHolder1_rbselect_0">Account
											Management</label></span></td>
								<td><span class="radio-inline"><input
										id="ContentPlaceHolder1_rbselect_1" type="radio"
										checked="checked" name="ctl00$ContentPlaceHolder1$rbselect"
										value="1" /><label for="ContentPlaceHolder1_rbselect_1">Bulk
											Recharge</label></span></td>
							</tr>
						</table>
					</div>
				</div>
				<hr />

				<div id="oto" style="display: none;">
					<form:form action="saveBulkByLM.html" method="get"
						name="savebulkInfo" commandName="bulkInfoForm">
						<input type="hidden" name="user" value="${user }" />
						<div>
							<div class="col-sm-25">
								<div class="col-sm-0"></div>
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Invoice</p>
									</div>
									<div class="col-sm-8">
										<form:input path="invoice_id" class="form-control"
											id="findvalue" value="" onchange="" required="required"
											tabindex="1" placeholder="Invoice Number" />

										<script>
								$("#findvalue").keyup( function() {
								    var invoice = $("#findvalue").val();
								   
								     $.ajax({  
							            type : 'GET', 
							            url: 'invoiceDetail.html',
							            data: {
							            	'invoice': invoice,
							            	'user':  ${user}
							            },
							            dataType: 'json',
							       		cache: false,
										beforeSend: function(xhr) 
							                        {
							                            xhr.setRequestHeader("Accept", "application/json");  
							                            xhr.setRequestHeader("Content-Type", "application/json");  
							                        },
							         				success: function (data) {
							         					 if(data=="Data Not Found"){
							         						// alert(data);
							         					 }else{
							         						setData( data);
							         					 }
							         					 
							         					 
							           						
								            },
								            error: function(e){
								            	
								            }
							            
							        });
								   
								});
								function setData( data){
									var todate= data.eDate;
									var amt=data.totalDues;
									var st=data.serviceTax;
									var at=data.amusementTax;
									
									var cid=data.custId;
									var cname=data.custName;
									var ot=data.cess;
									var pkg=data.custAdd;
									//alert(todate+","+amt+","+st+","+at);
									
									document.getElementById("dte").value =todate;
									document.getElementById("amount").value =amt;
									
									document.getElementById("custname").value =cname;
									document.getElementById("custId").value =cid;
									
									document.getElementById("service").value =st;
									document.getElementById("enttax").value =at;
									document.getElementById("other").value =ot;
									document.getElementById("pkc").value =pkg;
									
									
									
								}
											 	 
						  </script>
									</div>
								</div>

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">From</p>
									</div>
									<div class="col-sm-8">

										<input name="dte" readonly="readonly" type="text" id="dte"
											class="form-control" placeholder="" />
									</div>
								</div>
							</div>

							<div class="col-sm-25">
								<div class="col-sm-0"></div>
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Customer Id</p>
									</div>
									<div class="col-sm-8">

										<input name="custId" readonly="readonly" type="text"
											id="custId" class="form-control" placeholder="" />
									</div>
								</div>

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Customer Name</p>
									</div>
									<div class="col-sm-8">

										<input name="custname" readonly="readonly" type="text"
											id="custname" class="form-control" placeholder="" />
									</div>
								</div>
							</div>


							<div class="col-sm-25">
								<div class="col-sm-0"></div>

								<div class="col-sm-0"></div>
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Address</p>
									</div>
									<div class="col-sm-8">

										<input name="amount" readonly="readonly" type="text" id="pkc"
											class="form-control" placeholder="" />
									</div>
								</div>
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Amount</p>
									</div>
									<div class="col-sm-8">

										<input name="amount" readonly="readonly" type="text"
											id="amount" class="form-control" placeholder="" />
									</div>
								</div>


							</div>
							<div class="col-sm-25">
								<div class="col-sm-0"></div>

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Service Tax</p>
									</div>
									<div class="col-sm-8">

										<input name="service" readonly="readonly" type="text"
											id="service" class="form-control" placeholder="" />
									</div>
								</div>

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Amusement Tax</p>
									</div>
									<div class="col-sm-8">

										<input name="enttax" readonly="readonly" type="text"
											id="enttax" class="form-control" placeholder="" />
									</div>
								</div>
							</div>

							<div class="col-sm-25">
								<div class="col-sm-0"></div>
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Cess</p>
									</div>
									<div class="col-sm-8">

										<input name="other" readonly="readonly" type="text" id="other"
											class="form-control" />
									</div>
								</div>

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Recived Amount</p>
									</div>
									<div class="col-sm-8">
										<form:input path="receivedAmt" class="form-control"
											placeholder="Enter Recived Amount" required="required" />

									</div>
								</div>
							</div>

							<div class="col-sm-25">
								<div class="col-sm-0"></div>
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Recived Via</p>
									</div>
									<div class="col-sm-8">
										<%-- 							<form:input path="agentId" class="form-control" placeholder="Enter The Agent Id" /> --%>
										<form:select path="agentId" class="form-control" id="package">
											<form:option value="NONE">Select Agent</form:option>
											<form:options items="${agentName}" />
										</form:select>
									</div>
								</div>

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Reference ID</p>
									</div>
									<div class="col-sm-8">
										<form:input path="referenceId" class="form-control"
											placeholder="Enter The Reference Id" />

									</div>
								</div>
							</div>

							<div class="col-sm-25">
								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Payment Type</p>
									</div>
									<div class="col-sm-8">
										<%-- 							<form:input path="agentId" class="form-control" placeholder="Enter The Agent Id" /> --%>
										<form:select path="Payment_Type" class="form-control"
											id="package">
											<form:option value="NONE">Select Payemnt Type</form:option>
											<form:options items="${paymentType}" />
										</form:select>
									</div>
								</div>



							</div>


							<div class="col-sm-25">

								<div class=" col-sm-6">
									<div class="col-sm-4" style="margin-bottom: 18px">
										<p class="p1">Remark</p>
									</div>
									<div class="col-sm-8">
										<form:textarea path="Remark" cols="100"
											id="ContentPlaceHolder1_txtrmark" class="form-control"
											placeholder="Enter Remark" style="overflow:auto;resize:none;" />
									</div>
								</div>
								<div class=" col-sm-6" style="text-align: center; width: 90%;">
									<input type="submit" name="ctl00$ContentPlaceHolder1$btn_sbmit"
										value="Submit" id="ContentPlaceHolder1_btn_sbmit"
										style="width: 20%;" class="btn btn-primary" />
								</div>
							</div>
					</form:form>
				</div>
			</div>
		</div>

		<div id="bulk" style="margin-top: -23px;">
			<main class="hoc container clear"> <!-- main body -->

			<div class="row" style="margin-top: -65px;">
				<form action="excelbulkSheet.html" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="user" value="${user }" />
					<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<input type="file" name="excelfile" class="form-control"
							onchange="example()" id="filename" /><br>
						<script>
							
							       function example(){
							    	   var _validFileExtensions = [".xls"]; 
							    	   var arrInputs = document.getElementsByTagName("input");
							    	   
							           		for (var i = 0; i < arrInputs.length; i++) {
											    	var oInput = arrInputs[i];
											    	if (oInput.type == "file") {
											        	var sFileName = oInput.value;
											        	
											        	
											            if (sFileName.length > 0) {
											                var blnValid = false;
											                for (var j = 0; j < _validFileExtensions.length; j++) {
											                    var sCurExtension = _validFileExtensions[j];
											                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
											                        blnValid = true;
											                        break;
											                    }
											                }
											                if (!blnValid) {
											                    alert("Sorry, " + sFileName + " is invalid File , allowed extensions are: " + _validFileExtensions.join(", "));
											                    return false;
											                }
											            }
											      }
										    }
											  return true;
								       }
						
							       
							       function checkValue(data){
							    	 if(data==null || data==""){
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
								    	   alert("check");
								    	   document.getElementById("dataForm").submit();
								       });
								    });
								</script>

				</div>
				
				
				
						<div  class="col-sm-2  pull-right" style="margin-top: 36px;">
						<a href="#" value=""
									data-modal-id="popup2">Image template</a>
			</div>
			<hr>

			<div class="col-sm-12" style="width: 121%; margin-left: -10%;">
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
									<a href="topUp.html?user=${user}">Clear All</a>
								</div>
							</div>
						</div>

						<form:form method="POST" action="saveBulkTopup.html"
							modelAttribute="bulkData" id="dataForm">
							<input type="hidden" name="user" value="${user }" />
							<table
								class="table table-striped table-bordered table-hover fontsize"
								cellspacing="0" rules="all" border="1"
								id="ContentPlaceHolder1_gvdash"
								style="width: 100%; border-collapse: collapse;">
								<tr>
									<th scope="col"
										style="width: 5%; background-color: rgb(119, 127, 177);">SNo.</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Invoice
										No</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Customer
										ID</th>

									<th scope="col" style="background-color: rgb(119, 127, 177);">Name</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Address</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Package
										Name</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Mobile
										No</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Email</th>
									<th scope="col" style="background-color: rgb(119, 127, 177);">Amount</th>
								</tr>
								<tr>
									<c:forEach items="${bulkData.bulkInfo}" var="user"
										varStatus="itr">
										<tr>
											<td>${itr.index}</td>
											<td><form:input path="bulkInfo[${itr.index}].invoiceid"
													style=" width: 135px;" /></td>
											<td><form:input path="bulkInfo[${itr.index}].customerid"
													style=" width: 135px;" /></td>
											<td><form:input
													path="bulkInfo[${itr.index}].customername"
													style=" width: 135px;" /></td>
											<td><form:input
													path="bulkInfo[${itr.index}].customeraddress"
													style=" width: 135px;" /></td>
											<td><form:input
													path="bulkInfo[${itr.index}].customerpackagename"
													style=" width: 135px;" /></td>
											<td><form:input
													path="bulkInfo[${itr.index}].customermobileno"
													style=" width: 135px;" /></td>
											<td><form:input
													path="bulkInfo[${itr.index}].customeremailid"
													style=" width: 135px;" /></td>
											<td><form:input
													path="bulkInfo[${itr.index}].customeramountofrecharge"
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


		<script type="text/javascript">
				function hello(){
					alert("hello");
				}
					$(document)
							.ready(
									function() {
									
										$('#ContentPlaceHolder1_rbselect')
												.click(
														function() {

															var chk = $(
																	'#ContentPlaceHolder1_rbselect')
																	.find(
																			":checked")
																	.val()

															if (chk == 0) {
																$('#oto')
																		.show();
																$('#bulk')
																		.hide();
															}
															if (chk == 1) {
																$('#bulk')
																		.show();
																$('#oto')
																		.hide();

															}
														});
									});

					function radioList() {
					
						var chk = $('#ContentPlaceHolder1_rbselect').find(
								":checked").val()

						if (chk == 0) {
							$('#oto').show();
							$('#bulk').hide();
						}
						if (chk == 1) {
							$('#bulk').show();
							$('#oto').hide();

						}
					}
				</script>
		</main>
	</div>










	<div class="wrapper row4">
		<footer id="footer" class="hoc clear">

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

		</footer>
	</div>

	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<!-- ################################################################################################ -->
			<p class="fl_left">
				Copyright &copy; 2016 - All Rights Reserved - <a href="#">Payspot.in</a>
			</p>

		</div>
	</div>

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
				<h3 id="id1" style="width: 27%; color: #ffffff;"></h3>
			</header>
			<div class="container" style="padding: 10px 0;">
			<div class="form-inline marginBottom">
					<div class="md-form">
					   <img id="myImg" src="assets/img/bulktemplate.png" alt="Trolltunga, Norway" width="900" height="550">
					</div>
				</div>
			</div>
		</div>
</body>
</html>