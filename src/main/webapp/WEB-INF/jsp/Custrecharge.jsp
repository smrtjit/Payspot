


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
<link href="assets/css/kolkata.css" rel="stylesheet" />
</head>
<body style="background-color: #eeeeee;">
<%
			if(session.getAttribute("custLogin")==null){
				System.out.print("session not found");
				response.sendRedirect("userlogin.html?error=Session is Expired!!!");
			}else{
				System.out.print("session found");
				%>
	<form method="get" action="payNow.html" id="form1">
<%-- 	id=<%= request.getParameter("id") %> --%>
<%-- 	&vc_no=<%= request.getParameter("vc_no") %>& --%>
<%-- 	Customer_name=<%= request.getParameter("UserName") %>& --%>
<%-- 	pckg=<%= request.getParameter("Package_name") %>& --%>
<%-- 	pckg_price=<%= request.getParameter("Package_cost") %> --%>
	<input type="hidden" name="id" value="${id}"/>
	<input type="hidden" name="vc_no" value="${vc_no}"/>
	<input type="hidden" name="Customer_name" value="${UserName}"/>
	<input type="hidden" name="pckg" value="${Package_name}"/>
	<input type="hidden" name="pckg_price" value="${Package_cost}"/>
	 
		
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">My Cable TV </a>
				</div>
				<ul class="nav navbar-nav">
					 <li class="active"><a href="UserDetail.html?id=${id }">My Account</a></li>
					 <li><a href="CustComplaint.html?vc_no=${vc_no }&id=${id}">Complaint </a></li>
                    <li><a href="CustRecharge.html?id=${id }">Recharge</a></li>
					

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
						<b><span class="label label-success">Recharge</span></b>
					</p>
				</div>
				<hr />
				<div class="row">
					<div class="col-sm-12">

						<div class="col-sm-6">
							<div class="col-sm-12">
								<div class="col-sm-4">VC NO.OR Mobile No</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtvcno" type="text"
										value="${vc_no }" readonly="readonly"
										id="ContentPlaceHolder1_txtvcno" class="form-control"
										placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Current balance</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtBalance" type="text"
										readonly="readonly" id="ContentPlaceHolder1_txtBalance" value="${Account_balance }"
										class="form-control" placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Due Date</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="ctl00$ContentPlaceHolder1$txtDueDate" type="text"
										value="${Last_recharge_date }" readonly="readonly"
										id="ContentPlaceHolder1_txtDueDate" class="form-control"
										placeholder="" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-sm-4">Recharge Amount</div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input name="amount" type="text"
										id="ContentPlaceHolder1_txtamount" class="form-control"
										placeholder="" required="" />
								</div>
							</div>
<!-- 							<div class="col-sm-12"> -->
<!-- 								<div class="col-sm-4">Discount Coupon</div> -->
<!-- 								<div class="col-sm-8" style="margin-bottom: 10px"> -->
<!-- 									<input name="ctl00$ContentPlaceHolder1$txtcoupon" type="text" -->
<!-- 										id="ContentPlaceHolder1_txtcoupon" class="form-control" -->
<!-- 										placeholder="" /> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col-sm-12">
								<div class="col-sm-4"></div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input type="submit" name="payNow"value="Pay Now" id="ContentPlaceHolder1_btn_sbmit"class="btn btn-primary" />
<!-- 										<a class="btn btn-primary" href="">Pay now</a>  -->
								</div>
							</div>
						</div>
						<div class="col-sm-6"></div>
					</div>
				</div>
				<hr />
			</div>
			<div class="row">

				<div class="container" style="background: #fff;">
					<div class="col-sm-4">
						Customer Name <input name="ctl00$ContentPlaceHolder1$txtname"
							type="text" value="${UserName }" readonly="readonly"
							id="ContentPlaceHolder1_txtname" class="form-control"
							placeholder="" />
					</div>
					<div class="col-sm-4">
						Current Package <input name="ctl00$ContentPlaceHolder1$txtcpack"
							type="text" value="${Package_name }" readonly="readonly"
							id="ContentPlaceHolder1_txtcpack" class="form-control"
							placeholder="" />
					</div>
					<div class="col-sm-4">
						Package Price <input name="ctl00$ContentPlaceHolder1$txtPackPrice"
							type="text" value="${Package_cost }" readonly="readonly"
							id="ContentPlaceHolder1_txtPackPrice" class="form-control"
							placeholder="" />
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
