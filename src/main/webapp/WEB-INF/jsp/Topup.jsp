<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Payspot</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>



</head>
<body>



	<div class="wrapper row1">
		<header id="header" class="hoc clear"> <!-- ################################################################################################ -->
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
		</nav> </header>
	</div>



	</nav>
	<!-- Site Overlay -->
	<div class="site-overlay"></div>

	<!-- Your Content -->
	<div id="container">
		<div class="row">
			<div class=" col-md-4 col-md-offset-4">
				<table id="ContentPlaceHolder1_rbselect" class="form-control"
					style="margin-top: 23px; height: 40px;">
					<tr style="text-align: center;">
						<td style="padding: -2px 35px;width: 210px;"><span class="radio-inline" align="center"><input
								id="ContentPlaceHolder1_rbselect_0" type="radio"
								name="ctl00$ContentPlaceHolder1$rbselect" value="0" /><label
								for="ContentPlaceHolder1_rbselect_0 " style="color: black;">Account
									Management</label></span></td>
						<td style="padding: -2px 47px;"><span class="radio-inline"><input
								id="ContentPlaceHolder1_rbselect_1" type="radio"
								checked="checked" name="ctl00$ContentPlaceHolder1$rbselect"
								value="1" /><label for="ContentPlaceHolder1_rbselect_1"
								style="color: black;">Bulk Recharge</label></span></td>
					</tr>
				</table>
				</div>
		</div>
		<hr />

		<div id="oto" style="display: none">
			<form:form action="saveBulkByLCO.html" method="get"
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
								<form:input path="" class="form-control" id="findvalue" value=""
									onchange="" required="required" tabindex="1"
									placeholder="Invoice Number" />


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

								<input name="custId" readonly="readonly" type="text" id="custId"
									class="form-control" placeholder="" />
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
								<p class="p1">Package</p>
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

								<input name="amount" readonly="readonly" type="text" id="amount"
									class="form-control" placeholder="" />
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

								<input name="enttax" readonly="readonly" type="text" id="enttax"
									class="form-control" placeholder="" />
							</div>
						</div>
					</div>

					<div class="col-sm-25">
						<div class="col-sm-0"></div>
						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">Other Tax</p>
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
								style="width: 20%;" class="btn btn-primary" /> <a
								class="btn btn-primary" style="width: 20%;"
								href="Custrecharge.jsp">Cancel</a>
						</div>
					</div>
			</form:form>
		</div>
		<!-- 				<div class="col-sm-12" style="height: 1px"></div> -->
	</div>
	</div>
	</div>


	</div>

	<div id="bulk">
		<main class="hoc container clear"> <!-- main body -->

		<div class="row">
			<form action="processExcel.html" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="user" value="${user }" />
				<div class="col-sm-3"></div>
				<div class="col-sm-3">
					<input type="file" name="excelfile" class="form-control"
						onchange="example()" id="filename" /><br>


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


			</div>
			<div class="col-sm-2">

				<input type="button" value="Template"
					class="btn-primary btn btn-block" id="myBtn" />
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body" style="padding: 1px 1px;">
								<img id="myImg" src="assets/img/bulktemplate.png"
									alt="Trolltunga, Norway" width="1000" height="600">
							</div>
						</div>
					</div>
				</div>


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
								<a href="lcoTopUp.html?user=${user}">Clear All</a>
							</div>
						</div>
					</div>

					<form:form method="POST" action="uploadBulkTopup.html"
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
								<th scope="col" style="background-color: rgb(119, 127, 177);">Customer
									ID</th>
								<th scope="col" style="background-color: rgb(119, 127, 177);">VC
									No</th>
								<th scope="col" style="background-color: rgb(119, 127, 177);">Name</th>
								<th scope="col" style="background-color: rgb(119, 127, 177);">Email</th>
								<th scope="col" style="background-color: rgb(119, 127, 177);">Connection
									Status</th>
								<th scope="col" style="background-color: rgb(119, 127, 177);">Create
									Time</th>

							</tr>

							<!-- 								<tr> -->
							<%-- 									<c:forEach items="${userList}" var="user" varStatus="itr"> --%>
							<!-- 										<tr> -->
							<%-- 											<td style="width: 5%;">${offset + itr.index +1 }</td> --%>
							<%-- 											<td><a href="#" value=${user.username --%>
							<%-- 												} --%>
							<%-- 												data-modal-link="popup3">${user.username}</a></td> --%>

							<%-- 											<td>${user.customer_vc_no}</td> --%>
							<%-- 											<td>${user.customer_name}</td> --%>
							<%-- 											<td>${user.customer_email}</td> --%>
							<%-- 											<td>${user.connection_status}</td> --%>
							<%-- 											<td>${user.timestamp}</td> --%>

							<!-- 										</tr> -->
							<%-- 									</c:forEach> --%>

							<!-- 								</tr> -->
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
		function hello() {
			alert("hello");
		}
		$(document).ready(
				function() {

					$('#ContentPlaceHolder1_rbselect').click(
							function() {

								var chk = $('#ContentPlaceHolder1_rbselect')
										.find(":checked").val()

								if (chk == 0) {
									$('#oto').show();
									$('#bulk').hide();
								}
								if (chk == 1) {
									$('#bulk').show();
									$('#oto').hide();

								}
							});
				});

		function radioList() {

			var chk = $('#ContentPlaceHolder1_rbselect').find(":checked").val()

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


	</div>

	<!-- Pushy JS -->

	<script src="assets/js/pushy.min.js"></script>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<link
		href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/themes/humanity/jquery-ui.css"
		rel="stylesheet" type="text/css" />
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	</div>





</body>
</html>
				
