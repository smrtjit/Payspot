<!DOCTYPE html>

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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</head>
<body id="top">
	<div class="bgded overlay"
		style="background-image: url('images/demo/backgrounds/01.png');">
		<!-- ################################################################################################ -->
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
								<li><a href="newConnn.html?user=${user }">Add
										Subscriber</a></li>
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
			<main class="hoc container clear"> <!-- Your Content -->
			<div id="container" style="margin-top: -62px;">
				<div class="row" style="margin-bottom: -20px;">
					<div class=" col-md-4 col-md-offset-4">
						<table id="ContentPlaceHolder1_rbselect" class="form-control" style="padding-top: 0px;">
							<tr>
								<td><span class="radio-inline"><input
										id="ContentPlaceHolder1_rbselect_0" type="radio"
										checked="checked" name="ctl00$ContentPlaceHolder1$rbselect"
										value="0" /><label
										for="ContentPlaceHolder1_rbselect_0">Account
											Management</label></span></td>
								<td><span class="radio-inline"><input
										id="ContentPlaceHolder1_rbselect_1" type="radio"
										name="ctl00$ContentPlaceHolder1$rbselect" value="1" /><label
										for="ContentPlaceHolder1_rbselect_1">Bulk Recharge</label></span></td>
							</tr>
						</table>
					</div>
				</div>
				<hr />

				<div id="oto">
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
										<form:input path="invoice_id" class="form-control"
											id="findvalue" value="" onchange="" required="required"
											tabindex="1" placeholder="Invoice Number" />

										<script>
								$("#findvalue").keyup( function() {
								    var invoice = $("#findvalue").val();
								   
								     $.ajax({  
							            type : 'GET', 
							            url: 'printBill.html',
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
									var todate= data.Billing_Date;
									var amt=data.Total_Amount;
									var st=data.Service_Tax;
									var at=data.Entertain_Tax;
									
									var cid=data.User_Id;
									var cname=data.User_Name;
									var ot=data.Other_Tax;
									var pkg=data.Package_Name;
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
			</div>
		</div>

		<div id="bulk" style="display: none; margin-top: -23px;">
			<main class="hoc container clear"> <!-- main body -->

			<div class="row" style="margin-top: -65px;">
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
</body>
</html>