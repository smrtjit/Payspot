


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

.subs{
width: 100%;
text-align: right;
color: black;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>


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
				<a class="navbar-brand" href="#">Payspot</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="UserDetail.html?id=${id }">My
						Account</a></li>
				<li><a href="CustComplaint.html?vc_no=${vc_no }&id=${id}">Complaint</a></li>
				<li><a href="CustRecharge.html?id=${id }">Recharge</a></li>
				<li><a href="custbill.html?id=${id }" >Download Bill</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="logout.html"><span></span><b>Log Out</b></a></li>
			</ul>
		</div>
	</nav>

	<div>

		<div class="container">
			<div class="subs">
			Subscriber ID: ${id }
			</div>
			
			<hr style="width: 100%; border-top: 1px solid #dc3434;margin-top: 0px;  margin-bottom: 1%;">

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
				<div class="col-sm-25" style="margin-top: 21%;">
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
	


	<%
		}
	%>
</body>
</html>
