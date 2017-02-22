


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="description"
	content="Pushy is an off-canvas navigation menu for your website." />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/jquery-1.10.2.js"></script>
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/circle.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<style type="text/css">
.p1 {
	font-style: initial;
	/*font-weight: bold;*/
	font-size: 15px;
}

.error {
	padding: 8px;
	margin: 16px;
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}
</style>

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
            url: 'customerBill.html',
            data: {
            	
            	'user': ${id}
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
		document.getElementById("inid").innerHTML ="Invoice Number: "+billNo ;
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
<body style="background-color: #eeeeee;">


	<%
		if (session.getAttribute("custLogin") == null) {
			System.out.print("session not found");
			response.sendRedirect("userlogin.html?error=Session is Expired!!!");
		} else {
			System.out.print("session found");
	%>



	<script type="text/javascript">
		//<![CDATA[
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
		//]]>
	</script>


	<div class="aspNetHidden">

		<input type="hidden" name="__VIEWSTATEGENERATOR"
			id="__VIEWSTATEGENERATOR" value="039A0BBB" /> <input type="hidden"
			name="__EVENTVALIDATION" id="__EVENTVALIDATION"
			value="LzspmvwDIGcSv02CIj51kwtgdyg5WYeQBCxLkw7RX575QaleazCRiVVNWRNqkNoKcZ0dJVDzcll6UXHxDGugZcy+rTEDbklwwWNQwl9A7ifT+ATXrVegCeN6i3kcZN0NvusubuIrN+LqRjq3rwk8j/4GY7S3EqE+e9fyll9pqCmwjLmxY52lQMy5xtW9ph/A" />
	</div>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">My Cable TV </a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="UserDetail.html?id=${id }">My
						Account</a></li>
				<li><a href="CustComplaint.html?vc_no=${vc_no }&id=${id}">Complaint</a></li>
				<li><a href="CustRecharge.html?id=${id }">Recharge</a></li>
				<li><a href="#" value="${user.invoice_No}"
					data-modal-id="popup2">Download Bill</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="logout.html"><span></span><b>Log Out</b></a></li>
			</ul>
		</div>
	</nav>

	<div>

		<div class="container">
			<div class="col-sm-4">
				<p style="font-size: 20px">
					<b><span class="label label-success"
						style="margin-left: -15px; padding: 1.2em 4.6em 1.3em; background-color: #12a59c;">My
							Account</span></b>
				</p>
			</div>
			<div class="col-sm-12">
				<p style="font-size: 20px">
					<b><span class="label label-success"
						style="margin-left: -14px; padding: 1.2em 11.6em 1.3em; background-color: #96c1bf; border-top-left-radius: 78px; border-bottom-left-radius: 85px; border-bottom-right-radius: 79px; border-top-right-radius: 73px;">
							${id}</span></b>
				</p>
			</div>
			<hr />
			<div class="row">
				<div class="col-sm-25">
					<div class="col-sm-0"></div>
					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">CRF Number</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text" value="${vc_no}"
								class="form-control" placeholder="">
						</div>
					</div>

					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Current Package</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text"
								value="${Package_name}" class="form-control" placeholder="">
						</div>
					</div>
				</div>
				<div class="col-sm-25">
					<div class="col-sm-0"></div>
					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">STB Number</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text" value="${stb_no}"
								class="form-control" placeholder="">
						</div>
					</div>

					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Account Balance</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text"
								value="${Account_balance}" class="form-control" placeholder="">
						</div>
					</div>
				</div>

				<div class="col-sm-25">
					<div class="col-sm-0"></div>
					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Name</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text"
								value="${UserName}" class="form-control" placeholder="">
						</div>
					</div>

					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Last Payment</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text"
								value="${Last_payment} " class="form-control" placeholder="">
						</div>
					</div>
				</div>
				<div class="col-sm-25">
					<div class="col-sm-0"></div>
					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Mobile</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text" value="${mobile}"
								class="form-control" placeholder="">
						</div>
					</div>

					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Recharge Ammount</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text" value=""
								class="form-control" placeholder="">
						</div>
					</div>
				</div>
				<div class="col-sm-25">
					<div class="col-sm-0"></div>
					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Email ID</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text" value="${email}"
								class="form-control" placeholder="">
						</div>
					</div>

					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Recharge Date</p>
						</div>
						<div class="col-sm-8">

							<input name="" readonly="readonly" type="text"
								value="${Last_recharge_date}" class="form-control"
								placeholder="">
						</div>
					</div>
				</div>
				<div class="col-sm-25">
					<div class="col-sm-0"></div>
					<div class=" col-sm-6">
						<div class="col-sm-4" style="margin-bottom: 18px">
							<p class="p1">Address</p>
						</div>
						<div class="col-sm-8">

							<textarea style="resize: none; background-color: #e0e0e0;"
								readonly="" name="" rows="3" cols="90" value="">${add}</textarea>
						</div>
					</div>


				</div>




			</div>

		</div>
		<div class="row">
			<div class="col-sm-12" style="margin-left: 91px;">
				<div class="col-sm-4 jumbotron">
					<img src="assets/img/discount1.jpg"
						class="img-rounded img-responsive" style="border: 1px solid #888;" />
				</div>
				<div class="col-sm-4 jumbotron">
					<img src="assets/img/discount2.jpg"
						class="img-rounded img-responsive" style="border: 1px solid #888;" />
				</div>
				<div class="col-sm-4 jumbotron">
					<img src="assets/img/discount3.jpg"
						class="img-rounded img-responsive" style="border: 1px solid #888;" />
				</div>
			</div>
		</div>
	</div>

	</div>
	</form>
	<div id="popup2" class="modal-box" style="margin-top: 2%">

		<a href="#" class="js-modal-close close">×</a>

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
					<script type="text/javascript">
		 function PrintPanel() {
	            var panel = document.getElementById("popup2");
	            var printWindow = window.open('', '', 'height=400,width=850');
	            printWindow.document.write('<html><head><title>Generate Bill</title>');
	            printWindow.document.write('</head><body >');
	            printWindow.document.write(panel.innerHTML);
	            printWindow.document.write('</body></html>');
	            printWindow.document.close();
	            setTimeout(function () {
	                printWindow.print();
	            }, 500);
	            return false;
	        }</script>


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
		</script>
	<script type="text/javascript">
					Sys.WebForms.PageRequestManager._initialize(
							'ctl00$ContentPlaceHolder1$ScriptManager1',
							'form1', [ 'tctl00$ContentPlaceHolder1$upd',
									'ContentPlaceHolder1_upd',
									'tctl00$ContentPlaceHolder1$msgbox',
									'ContentPlaceHolder1_msgbox' ], [], [], 90,
							'ctl00');
				</script>

	<%
		}
	%>
</body>
</html>
