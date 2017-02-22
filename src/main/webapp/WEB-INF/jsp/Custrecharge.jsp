


<!DOCTYPE html>
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
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/jquery-1.10.2.js"></script>
<link href="assets/css/bootstrap.css" rel="stylesheet" />

</head>
<body style="background-color: #eeeeee;" onload="tabledata()">
	<script type="text/javascript">
		function tabledata() {

			var ala_carte = '${alacarte}';
			var add_pack = '${addonpack}';
			var str_array = null;
			var str_array1 = null;
			var tr = null;
			str_array = ala_carte.split(',');
			str_array1 = add_pack.split(',');
			for (var i = 0; i < str_array.length; i++) {

				str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/,
						"");
				tr = $('<tr/>');
				tr
						.append("<td style='color: black;'>" + str_array[i]
								+ "</td>");
				$('#a_cart').append(tr);

			}

			for (var i = 0; i < str_array1.length; i++) {
				str_array1[i] = str_array1[i].replace(/^\s*/, "").replace(
						/\s*$/, "");
				tr = $('<tr/>');
				tr.append("<td style='color: black;'>" + str_array1[i]
						+ "</td>");
				$('#a_pack').append(tr);

			}
			alert(myname);

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
		<%-- 	id=<%= request.getParameter("id") %> --%>
		<%-- 	&vc_no=<%= request.getParameter("vc_no") %>& --%>
		<%-- 	Customer_name=<%= request.getParameter("UserName") %>& --%>
		<%-- 	pckg=<%= request.getParameter("Package_name") %>& --%>
		<%-- 	pckg_price=<%= request.getParameter("Package_cost") %> --%>
		<input type="hidden" name="id" value="${id}" /> <input type="hidden"
			name="vc_no" value="${vc_no}" /> <input type="hidden"
			name="Customer_name" value="${UserName}" /> <input type="hidden"
			name="pckg" value="${Package_name}" /> <input type="hidden"
			name="pckg_price" value="${Package_cost}" />


		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">My Cable TV </a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="UserDetail.html?id=${id }">My
							Account</a></li>
					<li><a href="CustComplaint.html?vc_no=${vc_no }&id=${id}">Complaint
					</a></li>
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
					<div class="col-sm-25">
						<div class="col-sm-0"></div>
						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">User ID</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text" value="${vc_no }"
									class="form-control" placeholder="">
							</div>
						</div>

						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">Current Balance</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text"
									value="${Account_balance }" value="" class="form-control"
									placeholder="">
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
									value="${UserName }" class="form-control" placeholder="">
							</div>
						</div>

						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">Package Cost</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text"
									value="${Package_cost }" value="" class="form-control"
									placeholder="">
							</div>
						</div>
					</div>
					<div class="col-sm-25">
						<div class="col-sm-0"></div>
						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">Default Package</p>
							</div>
							<div class="col-sm-8">

								<input name="" type="text" class="form-control"
									value="${basepackage }" placeholder="" readonly="readonly">
							</div>
						</div>

						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">Due Date</p>
							</div>
							<div class="col-sm-8">

								<input name="" readonly="readonly" type="text"
									value="${Last_recharge_date }" value="" class="form-control"
									placeholder="">
							</div>
						</div>
					</div>
					<div class="col-sm-25">
						<div class="col-sm-0"></div>
						<div class=" col-sm-6">
							<div class="col-sm-4" style="margin-bottom: 18px">
								<p class="p1">Recharge Ammount</p>
							</div>
							<div class="col-sm-8">

								<input name="amount" type="text" class="form-control"
									placeholder="" required="">
							</div>
						</div>


					</div>
					</hr>
					<div class="col-sm-12">

						<div class="col-sm-6">



							<div class="col-sm-12">
								<div class="col-sm-4"></div>
								<div class="col-sm-8" style="margin-bottom: 10px">
									<input type="submit" name="payNow" value="Pay Now"
										id="ContentPlaceHolder1_btn_sbmit" class="btn btn-primary" />
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
				<div style='width: 58%; margin-left: 23%; height: 230px;'>
					<div class='col-md-6 indent-small'>
						<div class="form-group internal" style="width: 208%;">


							<table
								class="table table-striped table-bordered table-hover fontsize"
								cellspacing="0" rules="all" border="1" id="a_pack"
								style="width: 52%; border-collapse: collapse;">
								<tr>
									<th scope="col"
										style="color: #FFFFFF; background-color: #12a59c;">Add On
										Package</th>


								</tr>

							</table>
							<tag:paginate max="15" offset="6" count="5"
								uri="CustRecharge.html?user=${id}" next="&raquo;"
								previous="&laquo;" />
						</div>
					</div>
					<div class='col-md-6 indent-small'>

						<div class='form-group internal' style="width: 104%;">

							<table
								class="table table-striped table-bordered table-hover fontsize"
								cellspacing="0" rules="all" border="1" id="a_cart"
								style="width: 100%; border-collapse: collapse;">
								<tr>
									<th scope="col"
										style="color: #FFFFFF; background-color: #12a59c;">A La
										Carte</th>

								</tr>

							</table>
							<tag:paginate max="15" offset="6" count="5"
								uri="CustRecharge.html?user=${id}" next="&raquo;"
								previous="&laquo;" />

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
