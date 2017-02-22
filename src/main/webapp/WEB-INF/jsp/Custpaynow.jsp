


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

<link href="assets/css/bootstrap_style.css" rel="stylesheet" />
<link href="assets/css/main.css" rel="stylesheet" />
</head>
<body style="background-color: #eeeeee;">
	<%
		if (session.getAttribute("custLogin") == null) {
			System.out.print("session not found");
			response.sendRedirect("lcologin.html?error=Session is Expired!!!");
		} else {
			System.out.print("session found");
	%>
	
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">My Cable TV </a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="UserDetail.html?id=${id }">My
							Account</a></li>
					<li><a href="Custrecharge.jsp">Complaint </a></li>
					<li><a
						href="CustRecharge.html?id=${id}">Recharge</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.html"><span></span><b>Log Out</b></a></li>
				</ul>
			</div>
		</nav>
		<div>
			<div class="container">
				<div class="col-sm-12">
					<p style="font-size: 20px">
						<!-- 						<b><span class="label label-success">Recharge</span></b> -->
					</p>
				</div>
				<hr />

				<div class="row">
			
					<div class="col-sm-12">
						
						<div class="col-sm-6">
							<div class="col-sm-12">
								<div class="col-sm-4">User ID</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtvcno" type="text"
										value="${vc_no }" readonly="readonly"
										id="ContentPlaceHolder1_txtvcno" class="form-control"
										placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Customer Name</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtBalance" type="text"
										readonly="readonly" id="ContentPlaceHolder1_txtBalance"
										value="${Customer_name }"
										class="form-control" placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Current Package</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtDueDate" type="text"
										value="${pckg }"
										readonly="readonly" id="ContentPlaceHolder1_txtDueDate"
										class="form-control" placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Package Price</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtamount" type="text"
										value="${pckg_price }"
										readonly="readonly" id="ContentPlaceHolder1_txtDueDate"
										class="form-control" placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Recharge Amount</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtcoupon" type="text"
										value="${amount }"
										readonly="readonly" id="ContentPlaceHolder1_txtDueDate"
										class="form-control" placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4"></div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input type="submit" name="ctl00$ContentPlaceHolder1$btn_sbmit"value="Submit" id="ContentPlaceHolder1_btn_sbmit"class="btn btn-primary" />
									<!-- 									<input type="submit" name="ctl00$ContentPlaceHolder1$btn_sbmit"value="Cancel" id="Custrecharge.jsp"class="btn btn-primary" /> -->
									<a class="btn btn-primary" href="CustRecharge.html?id=${id }">Cancel</a>
									<div class="col-sm-8" style="margin-bottom: 10px"></div>
								</div>

							</div>
							<div class="col-sm-6"></div>
						</div>
					</div>
					<hr />
				</div>

			</div>
	
	<%
		}
	%>
</body>
</html>
