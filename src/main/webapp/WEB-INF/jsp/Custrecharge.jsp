


<!DOCTYPE html>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<style type="text/css">
.subs{
width: 100%;
text-align: right;
color: black;
}
</style>
</head>
<body style="background-color: #eeeeee;" onload="tabledata()">
	<script type="text/javascript">
		function tabledata() {

			var ala_carte = '${alacarte}';
			//	var add_pack = '${addonpack}';
			var base_pack = '${basepackage}';
			var base_packprice = '${basepackageprice}';

			var aad_pack = '${add_pck}';
			var add_price = '${add_prce}';

			var a_pack = aad_pack.split(",");
			var a_price = add_price.split(",");
			for (var i = 0; i < a_pack.length; i++) {

				tr = $('<tr/>');
				tr.append("<td style='color: black;'>" + a_pack[i]
						+ "</td><td style='color: black;'>" + a_price[i]
						+ "</td>");
				$('#a_cart').append(tr);
			}

			var ala_pack = '${ala_pack}';
			var ala_price = '${ala_price}';

			var al_pack = ala_pack.split(",");
			var al_price = ala_price.split(",");
			for (var i = 0; i < al_pack.length; i++) {

				tr = $('<tr/>');
				tr.append("<td style='color: black;'>" + al_pack[i]
						+ "</td><td style='color: black;'>" + al_price[i]
						+ "</td>");

				$('#a_pack').append(tr);
			}

			var tr = null;
			tr = $('<tr/>');
			tr.append("<td style='color: black;'>" + base_pack
					+ "</td><td style='color: black;'>" + base_packprice
					+ "</td>");
			$('#basepack').append(tr);

		}
	</script>
	<%
		if (session.getAttribute("custLogin") == null) {
			System.out.print("session not found");
			response.sendRedirect("userlogin.html?error=Session is Expired!!!");
		} else {
			System.out.print("session found");
	%>
	<form method="get" action="payNow.html" id="form1">
		<input type="hidden" name="id" value="${id}" /> <input type="hidden"
			name="vc_no" value="${vc_no}" /> <input type="hidden"
			name="Customer_name" value="${UserName}" /> <input type="hidden"
			name="pckg" value="${Package_name}" /> <input type="hidden"
			name="pckg_price" value="${Package_cost}" />


		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Payspot</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="UserDetail.html?id=${id }">My
							Account</a></li>
					<li><a href="CustComplaint.html?vc_no=${vc_no }&id=${id}">Complaint
					</a></li>
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

					<div class="col-sm-30">
						<div class="col-sm-0"></div>
						<div class=" col-sm-4">
							<div class="col-sm-3" style="margin-bottom: 18px">
								<p class="p1">User ID</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text" value="${id }"
									class="form-control" placeholder="">
							</div>
						</div>

						<div class=" col-sm-4">
							<div class="col-sm-3" style="margin-bottom: 18px">
								<p class="p1">Name</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text"
									value="${UserName }" class="form-control" placeholder="">
							</div>
						</div>
						<div class=" col-sm-4">
							<div class="col-sm-3" style="margin-bottom: 18px">
								<p class="p1">Due Date</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text"
									value="${Last_recharge_date }" class="form-control"
									placeholder="">
							</div>
						</div>
					</div>




				</div>
				<hr style="    border-top: 1px solid #dc3434;"/>
			</div>

			<div class="row">
				<div
					style='overflow: scroll; width: 37%; margin-left: 11.6%; height: 350px;'>

					<table
						class="table table-striped table-bordered table-hover fontsize"
						cellspacing="0" rules="all" border="1" id="basepack"
						style="width: 100%; border-collapse: collapse;">
						<tr>
							<th scope="col"
								style="color: #FFFFFF; background-color: #12a59c;">Base
								Package</th>
							<th scope="col"
								style="color: #FFFFFF; background-color: #12a59c;">Package
								Price</th>


						</tr>

					</table>


					<table
						class="table table-striped table-bordered table-hover fontsize"
						cellspacing="0" rules="all" border="1" id="a_pack"
						style="width: 100%; border-collapse: collapse;">
						<tr>
							<th scope="col"
								style="color: #FFFFFF; width: 50%; background-color: #12a59c;">Add
								On Package</th>
							<th scope="col"
								style="color: #FFFFFF; background-color: #12a59c;">Package
								Price</th>


						</tr>

					</table>

					<table
						class="table table-striped table-bordered table-hover fontsize"
						cellspacing="0" rules="all" border="1" id="a_cart"
						style="width: 100%; border-collapse: collapse;">
						<tr>
							<th scope="col"
								style="color: #FFFFFF; width: 50%; background-color: #12a59c;">A
								La Carte</th>
							<th scope="col"
								style="color: #FFFFFF; background-color: #12a59c;">Package
								Price</th>

						</tr>

					</table>


				</div>
				<div style="margin-left: 54%; margin-top: -24%;">
					<div>
						<p style="width: 30%;">Total Cost</p>
					</div>
					<div>



						<input name="" readonly="readonly" type="text"
							value="${Package_cost }" class="form-control" placeholder=""
							style="width: 50%;">
					</div>
				</div>


				<div style="margin-left: 54%; margin-top: 2%;">
					<div>
						<p class="p1" style="WIDTH: 30%;">Recharge Amount</p>
					</div>
					<div c="">

						<input name="amount" type="text" class="form-control"
							placeholder="Enter Amount Here" required="" style="WIDTH: 50%;
							title="MINIMUM SIZE" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											 pattern=".{2,}" maxlength="4"">
					</div>
				</div>
				<div>
					<div></div>
					<div style="margin-top: 8%; margin-left: -38%;">
						<input type="submit" name="payNow" value="Pay Now" id=""
							class="btn btn-primary"
							style="margin-left: 67%; margin-top: 2%; width: 14%;">
					</div>
				</div>



			</div>
	</form>
	<%
		}
	%>
</body>
</html>
