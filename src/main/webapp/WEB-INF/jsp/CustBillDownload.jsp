<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="description"
	content="Pushy is an off-canvas navigation menu for your website." />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<script src="assets/js/jquery-1.10.2.js"></script>
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/circle.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">


<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<style type="text/css">
.p1 {
	font-style: initial;
	/*font-weight: bold;*/
	font-size: 15px;
}
.subs{
width: 100%;
text-align: right;
color: black;
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
//			alert(invoice);
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
	var current_b=data.currentBill;
	var billDate=data.sDate;
	var dueDate=data.eDate;
	var pending_due=data.totalDues;
	var opening_bal=data.openingBal;
	var last_pay=data.lastPaid;
	var custbasepckg=data.custBasePckg;
	var custaddpckg=data.custAddPckg;
	var custalpckg=data.custALPckg;
	var servicetax=data.serviceTax;
	var cesstax=data.cess;
	var amusementtax=data.amusementTax;
	var bilafterduedate=data.billAfterDueDate;
	var latepecharge=bilafterduedate-pending_due;
	
	var privious_blance=opening_bal-last_pay;
	
	
	document.getElementById("accno").innerHTML =accNumber;
	document.getElementById("pending_dues").innerHTML =pending_due;
	document.getElementById("pending_bal").innerHTML =pending_due;
	document.getElementById("bill_no").innerHTML =billNo;
	document.getElementById("bill_d").innerHTML =billDate;
	document.getElementById("opening_blance").innerHTML =opening_bal;
	document.getElementById("current_bill").innerHTML =current_b;
	document.getElementById("sub_total").innerHTML =current_b;
	document.getElementById("dueDate").innerHTML =dueDate;
	document.getElementById("last_pay").innerHTML =last_pay;
	document.getElementById("privious_blance").innerHTML =privious_blance;
	document.getElementById("custbasepckg").innerHTML =custbasepckg;
	document.getElementById("custaddpckg").innerHTML =custaddpckg;
	document.getElementById("custalpckg").innerHTML =custalpckg;
	document.getElementById("servicetax").innerHTML =servicetax;
	document.getElementById("cesstax").innerHTML =cesstax;
	document.getElementById("amusementtax").innerHTML =amusementtax;
	
	document.getElementById("latepecharge").innerHTML =latepecharge;
	document.getElementById("bilafterduedate").innerHTML =bilafterduedate;
	
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

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Payspot </a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="UserDetail.html?id=${id }">My
						Account</a></li>
				<li><a href="CustComplaint.html?vc_no=${vc_no }&id=${id}">Complaint</a></li>
				<li><a href="CustRecharge.html?id=${id }">Recharge</a></li>
				<li><a href="custbill.html?id=${id }">Download Bill</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="logout.html"><span></span><b>Log Out</b></a></li>
			</ul>
		</div>
	</nav>
	<br>


	<div class="container">
		<div class="subs">
			Subscriber ID: ${id }
			</div>
		<hr style="width: 100%;     margin-top: 0px;  margin-bottom: 1%;">
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

		<table class="table table-striped table-bordered table-hover fontsize"
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
						<td style="width: 5%; color: grey;">${offset + itr.index +1 }</td>

						<td style="color: grey;">${user.invoice_No}</td>

						<td style="color: grey;">${user.custId}</td>
						<td style="color: grey;">${user.custName}</td>
						<td style="color: grey;">${user.custMobile}</td>
						<td style="color: grey;">${user.custAdd}</td>
						<td style="color: grey;">${user.totalDues}</td>
						<td style="color: grey;">${user.currentBill}</td>
						<td style="color: grey;">${user.billAfterDueDate}</td>
						<td style="text-align: center;"><a class="js-open-modal btn"
							href="#" style="font-size: 1.5vmin; padding: 0.5em 0.75em;"
							value="${user.invoice_No}" data-modal-id="popup2">Download/View
								Bill</a></td>

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
														id="bill_no"></span></td>
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
														id="dueDate"></span></td>
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
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Opening Balance</b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Last
												Payment</b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Current Bill</b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Total Dues </b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Internet
												User Id</b></td>

									</tr>
									<tr>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
											id="opening_blance">RS 0</b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
											id="last_pay">RS 0</b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
											id="current_bill"></b></td>
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b
											id="pending_dues">RS 520</b></td>
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
											<td style="border: ridge; padding: 1px 8px;" id="custbasepckg">NA</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">Add
												On Package</td>
											<td style="border: ridge; padding: 1px 8px;" id="custaddpckg">NA</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">A
												La Carte</td>
											<td style="border: ridge; padding: 1px 8px;" id="custalpckg">NA</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">Service
												Tax</td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"
												id="servicetax">Rs 0.00</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">Entertainment
												Tax</td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"
												id="amusementtax">Rs 0</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">Cess
												Tax</td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"
												id="cesstax">Rs 0</td>
										</tr>

										<tr>
											<td align="right"
												style="border: ridge; padding: 1px 8px; width: 850px;"><b>Sub
													Total</b></td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"
												id="sub_total"><b>RS 520</b></td>
										</tr>

										<tr>
											<td align="right"
												style="border: ridge; padding: 1px 8px; width: 850px;"><b>Previous
													Balance</b></td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"
												id="privious_blance"><b>Rs 0</b></td>
										</tr>


										<tr>
											<td align="right"
												style="border: ridge; padding: 1px 8px; width: 850px;"><b>Total</b></td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
												id="pending_bal">Rs 520</b></td>
										</tr>
										<tr>
											<td align="right"
												style="border: ridge; padding: 1px 8px; width: 850px;"><b>Late
													Payment Charges</b></td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
												id="latepecharge">Rs 50</b></td>
										</tr>

										<tr>
											<td align="right"
												style="border: ridge; padding: 1px 8px; width: 850px;"><b>Payable
													after due date</b></td>
											<td style="border: ridge; padding: 1px 8px; width: 200px;"><b
												id="bilafterduedate">Rs 570</b></td>
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

	<%
		}
	%>
</body>
</html>
