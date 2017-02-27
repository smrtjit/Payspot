


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
<style type="text/css">
.subs{
width: 100%;
text-align: right;
color: black;
}
</style>
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
				<a class="navbar-brand" href="#">Payspot </a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="UserDetail.html?id=${id }">My
						Account</a></li>
				<li><a href="Custrecharge.jsp">Complaint </a></li>
				<li><a href="CustRecharge.html?id=${id}">Recharge</a></li>
					<li><a href="custbill.html?id=${id }" >Download Bill</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logOut.html"><span></span><b>Log Out</b></a></li>
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
				<div class="table-responsive">

					<div>
						<table
							class="table table-striped table-bordered table-hover fontsize"
							cellspacing="0" rules="all" border="1"
							id="ContentPlaceHolder1_gvcompHistory"
							style="width: 75%; border-collapse: collapse;">
							<tr>
								<th scope="col"
									style="text-align: center; color: #FFFFFF; width: 50%; background-color: #12a59c;">User
									ID</th>
								<th scope="col"
									style="text-align: center; color: #FFFFFF; background-color: #12a59c;">${id }</th>


							</tr>

							<tr>
								<td style="text-align: center; color: black;">Customer Name</td>
								<td style="text-align: center; color: black;">${Customer_name }</td>

							</tr>
							<tr>
								<td style="text-align: center; color: black;">Package Price</td>
								<td style="text-align: center; color: black;">${pckg_price }</td>

							</tr>
							<tr>
								<td style="text-align: center; color: black;">Recharge
									Amount</td>
								<td style="text-align: center; color: black;">${amount }</td>

							</tr>
							<tr>
								<td style="text-align: center; color: black;" colspan="2"><input
									type="submit" name="ctl00$ContentPlaceHolder1$btn_sbmit"
									value="Submit" id="ContentPlaceHolder1_btn_sbmit"
									class="btn btn-primary" />
									<a class="btn btn-primary" href="CustRecharge.html?id=${id }">Cancel</a>
									</td>
<!-- 								<td style="text-align: center; color: black;"><a -->
<%-- 									class="btn btn-primary" href="CustRecharge.html?id=${id }">Cancel</a></td> --%>

							</tr>

						</table>


					</div>
				</div>

			</div>

		</div>

		<%
			}
		%>
	
</body>
</html>
