<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>Collection</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />


<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#fdate').datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$('#edate').datepicker({
			dateFormat : 'yy-mm-dd'
		});

	});
</script>
<!-- #######################################################For Dialog####################################################################### -->
<style>
.nofound {
	color: red;
	font-size: 3ex;
	margin-left: 350px;
	widows: 100%;
}

html {
	font-family: "roboto", helvetica;
	position: relative;
	height: 100%;
	font-size: 100%;
	line-height: 1.5;
	color: #444;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
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

.btn-color {
	font-size: 2vmin;
	padding: 0.25em .75em;
	background-color: #428bca;
	border: 1px solid #bbb;
	color: #eeeeee;
	text-decoration: none;
	display: inline;
	border-radius: 4px;
	-webkit-transition: background-color 1s ease;
	-moz-transition: background-color 1s ease;
	transition: background-color 1s ease;
}

.v-center>div {
	display: table-cell;
	vertical-align: middle;
	position: relative;
	top: -10%;
}

.btn {
	font-size: 2vmin;
	padding: 0.25em .75em;
	background-color: #fff;
	border: 1px solid #bbb;
	color: #333;
	text-decoration: none;
	display: inline;
	border-radius: 4px;
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
var value;
$(function(){
var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");
	$('a[data-modal-id]').click(function(e) {
		 value = $(this).attr('value');
		
		 e.preventDefault();
		 $.ajax({  
    	         type : 'GET', 
    	         url: 'bulkDetails.html',
       		      data: {
            		 'invoice': value,
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
             		var keysbyindex = Object.keys(data);
             		//alert(data[keysbyindex[0]].cust_mobile);
             		//alert(data[keysbyindex[1]].TotalAmt_AftDueDate);
             	// alert(Object.values(data)[0]);
             	setBulkData(data);
             	
 	            }
 	           
   	      });
	
    	$("body").append(appendthis);
   		$(".modal-overlay").fadeTo(500, 0.7);
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

function setBulkData( data){
	var keysbyindex = Object.keys(data);
	//alert("hello: "+data[keysbyindex[1]].custName);
	document.getElementById("buklinid").innerHTML =data[keysbyindex[1]].Invoice_No;
	document.getElementById("username").value =data[keysbyindex[1]].custName;
	
	document.getElementById("amt").value =data[keysbyindex[1]].totalDues;
	document.getElementById("servicetax").value =data[keysbyindex[1]].serviceTax;
	document.getElementById("amtt").value =data[keysbyindex[1]].amusementTax;
	document.getElementById("ot").value =data[keysbyindex[1]].cess;
	
	document.getElementById("ramt").value =data[keysbyindex[0]].Paid_Amount;
	document.getElementById("agent").value =data[keysbyindex[0]].Collecting_Agent;
	document.getElementById("rid").value =data[keysbyindex[0]].RefernceId;
	document.getElementById("rmark").value =data[keysbyindex[0]].Remark;
	document.getElementById("invoice").value =data[keysbyindex[1]].Invoice_No;
	
	
}
</script>
<script>
	$(function() {

		var appendthis = ("<div class='modal-overlay js-modal-close'></div>");
		
		$('a[data-modal-link]').click(function(e) {
			
			var invoice = $(this).attr('value');
			$.ajax({  
	            type : 'GET', 
	            url: 'printBill.html',
	            data: {
	            	'invoice': invoice,
	            	'user': ${ user}
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
		            	//alert(e);
		            }
	            
	        });
			//alert(invoice);
			document.getElementById("inid").innerHTML ="Invoice Number: "+invoice;
			e.preventDefault();
			$("body").append(appendthis);
			$(".modal-overlay").fadeTo(500, 0.7);
			//$(".js-modalbox").fadeIn(500);
			var modalBox = $(this).attr('data-modal-link');
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
		var privious_blance=data.lastPaid;
		
		var ftac=data.fta;
		var activationcharges=data.activationCharges;
		var stbMonthlyrental=data.stbMonthlyRental;
		var digitalcapacityrental=data.digitalCapacityRental;
		
		
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
		
		document.getElementById("ftac").innerHTML =ftac;
		document.getElementById("activationcharges").innerHTML =activationcharges;
		document.getElementById("stbMonthlyrental").innerHTML =stbMonthlyrental;
		document.getElementById("digitalcapacityrental").innerHTML =digitalcapacityrental;
		
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
		<div class="row">
			<form action="searchCollectionLCO.html">
				<input type="hidden" name="user" value="${user }" />

				<div class="col-sm-2">
					<div style="margin-bottom: 10px">
						<input name="fdate" type="text" id="fdate" tabindex="1"
							class="form-control" placeholder="From Date" />
					</div>

				</div>

				<div class="col-sm-2">
					<div style="margin-bottom: 10px">

						<input name="edate" type="text" id="edate" tabindex="2"
							class="form-control" placeholder="To Date" />

					</div>
				</div>

				<div class="col-sm-2">
					<div style="margin-bottom: 10px">

						<input name="VC_No" type="text" id="ContentPlaceHolder1_txtvcno"
							tabindex="2" class="form-control" placeholder="Customer Id" />
					</div>
				</div>
				<div class="col-sm-2">
					<div style="margin-bottom: 10px">
						<input name="mobile" type="text"
							id="ContentPlaceHolder1_txtmobile" tabindex="1"
							class="form-control" placeholder="Mobille No." />

					</div>

				</div>
				<div class="col-sm-2">
					<div style="margin-bottom: 10px">
						<input name="agent" type="text" id="ContentPlaceHolder1_txtpkg"
							tabindex="2" class="form-control" placeholder="Agent Id" />
					</div>

				</div>
				<div class="col-sm-2  ">
					<div style="margin-bottom: 10px">
						 <select name="status" placeholder="select type" class="form-control">
								<option value="">Select Status</option>
								<option value="Pending">Pending</option>
								<option value="Approved">Approved</option>
							</select>
					</div>

				</div>
				<div class="col-sm-2 pull-right">
					<div style="margin-bottom: 10px">

						<input type="submit" tabindex="30"
							class="btn-primary btn-color btn-block pull-right" />

					</div>

				</div>
				<div class="nofound">${error}</div>
			</form>

		</div>



		<div class="col-sm-12">
			<hr />
			<div class="titleTd"
				style="width: 25%; margin-bottom: -35px; text-align: center; padding: 10px; font-size: x-large; color: #c4c1e8; background-color: dimgray; border-top-left-radius: 34px; border-top-right-radius: 54px;">AllCollection</div>
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
						Number</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Customer Id</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Name</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Mobile</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Agent ID</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Recharge
						Amount</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Payment
						Mode</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Payment
						Status</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Date_Time</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Approval</th>
				</tr>
				<c:forEach items="${userList}" var="user" varStatus="itr">
					<tr>
						<td>${offset + itr.index +1 }</td>

						<td><a href="#" value="${user.invoice}"
							data-modal-link="popup3">${user.invoice}</a></td>
						<td>${user.cust_Id}</td>
						<td>${user.cust_Name}</td>
						<td>${user.cust_mobile}</td>
						<td>${user.collecting_Agent}</td>
						<td>${user.recharge_Amount}</td>
						<td>${user.payment_Mode}</td>
						<td>${user.payment_Status}</td>
						<td>${user.trndate}</td>


						<td>
							<%-- 								<input type="button" name="${user.invoice}" value="Edit"class="btn-primary btn btn-block"  id="" onclick="myBtn();"/> --%>
							<a class="js-open-modal btn" href="#" value="${user.invoice}"
							data-modal-id="popup2"><img src="assets/img/edit.png"
								onClick=" return false;" /></a>

						</td>

					</tr>
				</c:forEach>
			</table>

			<tag:paginate max="15" offset="${offset}" count="${count}"
				uri="allCollection.html?user=${user}" next="&raquo;"
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
				<h6 class="title" style="font-size: 11px;">Quam aliquam ac</h6>
				<p>Molestie metus non pharetra felis donec volutpat molestie
					ligula imperdiet laoreet dolor scelerisque eu nunc aliquet tortor
					erat ut tempus justo tristique.</p>
				<p>Condimentum vivamus tempus nisi et augue fringilla aliquet
					mauris scelerisque sollicitudin justo non posuere nunc mollis
					facilisis purus imperdiet aliquet nisi consectetur et phasellus.</p>
			</div>
			<div class="one_third">
				<h6 class="title"  style="font-size: 11px;">Morbi ullamcorper</h6>
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
				<h6 class="title"  style="font-size: 11px;">Finibus mauris</h6>
				<ul class="nospace linklist">
					<li>
						<article>
							<h2 class="nospace font-x1">
								<a href="#"  style="font-size: 11px;">Suscipit mauris nunc</a>
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
								<a href="#"  style="font-size: 11px;">Eros magna sed</a>
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

	<div id="popup2" class="modal-box">
		<header style="background-color: #3eb3b3;">
			<a href="#" class="js-modal-close close">×</a>
			<h3 style="color: #ffffff;">
				Invoice Number :<label for="form1" class="" style="color: #ffffff;"
					id="buklinid"> </label>
			</h3>
		</header>
		<div class="modal-body" style="padding-left: 20px">
			<!--    paste here -->
			<form action="ApprovedBulkLCO.html" >

				<input type="hidden" name="user" value="${user }"> 
				<input type="hidden" name="invoice" id="invoice">
				<div>
					<div class="form-inline marginBottom">
						<div class="md-form">
							<label for="form1" class="" style="color: black;">Customer
								Name:</label> <input type="text" style="width: 30%; margin-left: 4%" id="username" readonly="" class="form-control input1"> <label for="form1" class="" style="color: black;">Amount :</label> 
								<input type="text" style="width: 30%;margin-left: 112px;" id="amt" readonly="" class="form-control input1">

						</div>
					</div>
					<br>
					<div class="form-inline marginBottom">
						<div class="md-form">
							<label for="form1" class="" style="color: black;">Service
								TAX :</label> 
								<input type="text" style="width: 30%;margin-left: 62px;" id="servicetax" readonly="" class="form-control input1"> 
								<label for="form1" class="" style="color: black;">Amusement
								TAX:</label> 
								<input type="text" style="width: 30%; margin-left: 6%;" id="amtt" readonly="" class="form-control input1">

						</div>
					</div>
					<br>
					<div class="form-inline marginBottom">
						<div class="md-form">
							<label for="form1" class="" style="color: black;">Other
								TAX :</label> <input type="text" style="width: 30%;margin-left: 74px;" id="ot" readonly="" class="form-control input1"> <label for="form1" class="" style="color: black;">Receive
								Amount :</label> <input type="text" style="width: 30%; margin-left: 6%;" id="ramt" placeholder="Please Enter The Amount" name="RAmt" class="form-control input1">

						</div>
					</div>
					<br>
					<div class="form-inline marginBottom">
						<div class="md-form">
							<label for="form1" class="" style="color: black;">Received
								Via :</label>
								 <input requried="requried" type="text" placeholder="Please Enter The Agent ID" id="agent" readonly="" style="width: 30%;margin-left: 6%;" class="form-control input1"> 
								<label  for="form1" class="" style="color: black;">Reference ID :</label>
								 <input requried="requried" type="text" style="width: 30%; margin-left: 8%;" id="rid" placeholder="Please Enter The Reference ID" name="RId" class="form-control input1">

						</div>
					</div>
					<br>
					<div class="form-inline marginBottom">
						<div class="md-form">
							<label for="form1" class="" style="color: black;">Payment
								Status :</label> <select requried="true" id="state"
								name="state" placeholder="select type" class="form-control"
								style="width: 48%; margin-left: 40px;">
								<option value="0">Select Status</option>
								<option value="Pending">Pending</option>
								<option value="Approved">Approved</option>
							</select>


						</div>
					</div>
					<br>
					<div class="form-inline marginBottom">
						<div class="md-form" style="width: 94%;">
							<label for="form1" class="" style="color: black;">Remark
								:</label>
							<textarea name="Remark" rows="3" cols="100" id="rmark" class="form-control" placeholder="Add Remark" style="overflow: auto; resize: none;">					</textarea>
							<br>
							<div class="col-sm-2  pull-right" style="margin-top: 15px; margin-bottom: 10px;">
								<input type="submit" name="#" value="Submit" id="" tabindex="12" class="btn-danger btn btn-block">
							</div>
						</div>
					</div>
					<br>

				</div>

			</form>

		</div>
	</div>
	<!-- 	##################################################BILL################################################################################# -->
	<div id="popup3" class="modal-box" style="margin-top: 2%">

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
										<td style="border: ridge; width: 210px; padding: 1px 8px;"><b>Free To Air Channel
												</b></td>

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
											id="ftac">NA</b></td>
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
											<td align="left" style="border: ridge; padding: 1px 8px;">Activation Charges</td>
											<td style="border: ridge; padding: 1px 8px;" id="activationcharges">NA</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">STB Monthly
												Rental</td>
											<td style="border: ridge; padding: 1px 8px;" id="stbMonthlyrental">NA</td>
										</tr>
										<tr>
											<td align="left" style="border: ridge; padding: 1px 8px;">Digital Capacity
												Rental</td>
											<td style="border: ridge; padding: 1px 8px;" id="digitalcapacityrental">NA</td>
										</tr>
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
	</body>
</html>