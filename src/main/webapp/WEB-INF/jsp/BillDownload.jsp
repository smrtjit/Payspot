<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>Subscriber</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<style>
.modal-stb {
	margin-left: -39%;
	margin-top: -18%;
	display: none;
	position: absolute;
	z-index: 1000;
	width: 50%;
	background: white;
	border-bottom: 1px solid #aaa;
	border-radius: 4px;
	box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
	border: 1px solid rgba(0, 0, 0, 0.1);
	background-clip: padding-box;
}
/* .modal-stb { */
/* 	margin-left: -204px; */
/* 	top: 200px; */
/* 	left: 450px; */
/* 	display: block; */
/* 	position: absolute; */
/* 	z-index: 1000; */
/* 	width: 50%; */
/* 	background: white; */
/* 	border-bottom: 1px solid #aaa; */
/* 	border-radius: 4px; */
/* 	box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5); */
/* 	border: 1px solid rgba(0, 0, 0, 0.1); */
/* 	background-clip: padding-box; */
/* } */

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
	width: 55%;
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
<script>
	$(function() {

		var appendthis = ("<div class='modal-overlay js-modal-close'></div>");
		
		$('a[data-modal-id]').click(function(e) {
			var invoice = $(this).attr('value');
// 			alert(invoice);
			 $.ajax({  
            type : 'GET', 
            url: 'printBill.html',
            data: {
            	'invoice': invoice,
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
             setData(data);
           // alert(data.Billing_Date);
	            },
	            error: function(e){
	            	alert(e);
	            }
            
        });
			document.getElementById("inid").innerHTML ="Invoice Number: "+invoice;
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

		$(window).resize(function() {
			$(".modal-box").css({
				top : ($(window).height() - $(".modal-box").outerHeight()) / 2,
				left : ($(window).width() - $(".modal-box").outerWidth()) / 2
			});
		});

		$(window).resize();

	});
	
	function setData( data){
		var accNumber=data.custId;
		var billNo=data.Invoice_No;
		var billDate=data.currentBill;
		var dueDate=data.dueDate;
		var previous=data.totalDues;
		var lastPay=data.lastPaid;
		var advance=data.openingBal;
		var billAmt=data.totalAmt;
		var serviceTax=data.serviceTax;
		var entTax=data.cess;
		var PreviousBal=data.totalDues;
		var Disount=data.totalDues;
		var lateCharge=data.totalDues;
		var lateAmt=data.totalDues;
		var pckcost=data.custPckgCost;
		var addon=data.custAddPckg;
		var alacarte=data.custALPckg;
		var basepkg=data.custBasePckg;

		document.getElementById("accno").innerHTML =accNumber;
		document.getElementById("bill").innerHTML =billNo;
		document.getElementById("bill_d").innerHTML =billDate;
		document.getElementById("due").innerHTML =dueDate;
		document.getElementById("pre").innerHTML =previous;
		document.getElementById("last").innerHTML =lastPay;
		document.getElementById("ad").innerHTML =advance;
		document.getElementById("bill_a").innerHTML =pckcost;
		document.getElementById("st").innerHTML =serviceTax;
		document.getElementById("et").innerHTML =entTax;
		document.getElementById("pb").innerHTML =PreviousBal;
		document.getElementById("dis").innerHTML =Disount;
		document.getElementById("lpc").innerHTML =lateCharge;
		document.getElementById("lpa").innerHTML =lateAmt;
		document.getElementById("tot").innerHTML =billAmt;
		document.getElementById("stt").innerHTML =billAmt;
		document.getElementById("ala").innerHTML =alacarte;
		document.getElementById("addon").innerHTML =addon;
		document.getElementById("basepkg").innerHTML =basepkg;
		
// 		document.getElementById("accno").innerHTML =Disount;
// 		document.getElementById("accno").innerHTML =lateCharge;
// 		document.getElementById("accno").innerHTML =lateAmt;
// 		document.getElementById("accno").innerHTML =accNumber;
		
		
	}
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
		<div class="col-sm-12" style="width: 110%; margin-left: -50px;">
			<hr />
			<div class="titleTd"
				style="width: 25%; margin-bottom: -35px; text-align: center; padding: 10px; font-size: x-large; color: #c4c1e8; background-color: dimgray; border-top-left-radius: 34px; border-top-right-radius: 54px;">Download
				Bill</div>
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
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Invoice
						No.</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Customer
						ID.</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Name</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Mobile</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Address</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Due
						Balance</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Billing
						Date</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Due
						Date</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Download
						Bill</th>

				</tr>
				<tr>
					<c:forEach items="${userList}" var="user" varStatus="itr">
						<tr>
							<td style="width: 5%;">${offset + itr.index +1 }</td>

							<td>${user.invoice_No}</td>

							<td>${user.custId}</td>
							<td>${user.custName}</td>
							<td>${user.custMobile}</td>
							<td>${user.custAdd}</td>
							<td>${user.totalDues}</td>
							<td>${user.currentBill}</td>
							<td>${user.billAfterDueDate}</td>
							<td><a class="btn-primary btn btn-block" href="#"
								style="font-size: 1.5vmin;" value="${user.invoice_No}"
								data-modal-id="popup2">Download/View Bill</a></td>

						</tr>
					</c:forEach>

				</tr>
			</table>

			<tag:paginate max="15" offset="${offset}" count="${count}"
				uri="allSubscriber.html?user=${user}" next="&raquo;"
				previous="&laquo;" />
		</div>

		<div id="popup2" class="modal-box" style="margin-top: 2%">

			<a href="#" class="js-modal-close close">�</a>

			<div class="modal-body" style="padding: 0px;">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #288484">
						<button type="button" class="close" data-dismiss="modal"></button>
						<h4 align="center" class="modal-title">
							<b style="color: white" id="inid"></b>
						</h4>
					</div>


					<div id="ContentPlaceHolder1_msgbox">

						<div id="ContentPlaceHolder1_pnlPrint">



							<div id="print_ticket">
								<div class="detail">

									<table style="width: 100%;">
										<tr>
											<td>
												<p>
													<b> <span id="ContentPlaceHolder1_lblname"></span></b>
												</p>
												<p>
													<span id="ContentPlaceHolder1_lbladd1"></span>
												</p>
												<p>
													<span id="ContentPlaceHolder1_lbladd2"></span>
												</p>

											</td>
											<td>
												<table style="width: 100%;">
													<tr>
														<td style="border: ridge; padding: 1px 8px;">Account
															No</td>
														<td style="border: ridge; padding: 1px 8px;"><span
															id="accno"></span></td>
													</tr>
													<tr>
														<td style="border: ridge; padding: 1px 8px;">Bill
															Number</td>
														<td style="border: ridge; padding: 1px 8px;"><span
															id="bill"></span></td>
													</tr>

													<tr>
														<td style="border: ridge; padding: 1px 8px;">Billing
															Date</td>
														<td style="border: ridge; padding: 1px 8px;"><span
															id="bill_d"></span></td>
													</tr>
													<tr>
														<td style="border: ridge; padding: 1px 8px;">Due Date</td>
														<td style="border: ridge; padding: 1px 8px;"><span
															id="due"></span></td>
													</tr>
												</table>

											</td>
										</tr>
									</table>
								</div>


								<div class="col-md-12" style="background-color: #288484">
									<p style="color: white" align="center">Make Online Payment
										and manage your account</p>
								</div>
								<div class="col-md-12">
									<table style="border: ridge">
										<tr>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Previous</b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Last
													Payment</b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Advance</b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Bill
													Amount </b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Internet
													User Id</b></td>

										</tr>
										<tr>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
												id="pre">RS 0</b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
												id="last">RS 0</b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
												id="ad"></b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
												id="bill_a">RS 520</b></td>
											<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
												id="in">NA</b></td>
										</tr>
									</table>
								</div>
								<br />
								<div class="col-md-12">
									<div class="col-md-12">
										<table style="border: ridge">

											<tr>
												<td style="border: ridge; width: 850px; padding: 1px 8px;"><b>Account
														details</b></td>
												<td style="border: ridge; width: 200px; padding: 1px 8px;"><b>Amount</b></td>
											</tr>


											<tr>
												<td align="left" style="border: ridge; padding: 1px 8px;">Base
													Package</td>
												<td style="border: ridge; padding: 1px 8px;" id="basepkg">NA</td>
											</tr>
											<tr>
												<td align="left" style="border: ridge; padding: 1px 8px;">Add
													On Package</td>
												<td style="border: ridge; padding: 1px 8px;" id="addon">NA</td>
											</tr>
											<tr>
												<td align="left" style="border: ridge; padding: 1px 8px;">A
													La Carte</td>
												<td style="border: ridge; padding: 1px 8px;" id="ala">NA</td>
											</tr>
											<tr>
												<td align="left" style="border: ridge; padding: 1px 8px;">Service
													Tax</td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"
													id="st">Rs 0.00</td>
											</tr>
											<tr>
												<td align="left" style="border: ridge; padding: 1px 8px;">Entertainment
													Tax</td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"
													id="et">Rs 0</td>
											</tr>

											<tr>
												<td align="right"
													style="border: ridge; padding: 1px 8px; width: 850px;"><b>Sub
														Total</b></td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"
													id="stt"><b>RS 520</b></td>
											</tr>

											<tr>
												<td align="right"
													style="border: ridge; padding: 1px 8px; width: 850px;"><b>Previous
														Balance</b></td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"
													id="pb"><b>Rs 0</b></td>
											</tr>

											<tr>
												<td align="right"
													style="border: ridge; padding: 1px 8px; width: 850px;"><b>Discount</b></td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
													id="dis">Rs</b></td>
											</tr>


											<tr>
												<td align="right"
													style="border: ridge; padding: 1px 8px; width: 850px;"><b>Total</b></td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
													id="tot">Rs 520</b></td>
											</tr>
											<tr>
												<td align="right"
													style="border: ridge; padding: 1px 8px; width: 850px;"><b>Late
														Payment Charges</b></td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
													id="lpc">Rs 50</b></td>
											</tr>

											<tr>
												<td align="right"
													style="border: ridge; padding: 1px 8px; width: 850px;"><b>Payable
														after due date</b></td>
												<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
													id="lpa">Rs 570</b></td>
											</tr>

										</table>



									</div>

								</div>

							</div>

						</div>



					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-small js-modal-close"
							onclick="return PrintPanel();">Print</a> <a href="#"
							class="btn btn-small js-modal-close">Close</a>

					</div>

				</div>
			</div>

		</div>
		<script type="text/javascript">
			var theForm = document.forms['form1'];
			if (!theForm) {
				theForm = document.form1;
			}
			function __doPostBack(eventTarget, eventArgument) {
				if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
					theForm.__EVENTTARGET.value = eventTarget;
					theForm.__EVENTARGUMENT.value = eventArgument;
					theForm.submit();
				}
			}
		</script> <script type="text/javascript">
					Sys.WebForms.PageRequestManager._initialize(
							'ctl00$ContentPlaceHolder1$ScriptManager1',
							'form1', [ 'tctl00$ContentPlaceHolder1$upd',
									'ContentPlaceHolder1_upd',
									'tctl00$ContentPlaceHolder1$msgbox',
									'ContentPlaceHolder1_msgbox' ], [], [], 90,
							'ctl00');
				</script><!-- / main body -->
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

	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>


</body>
</html>