<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>LineMan</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />

<style>
.nofound {
	color: red;
	font-size: 3ex;
	margin-left: 350px;
	widows: 100%;
}


.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
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
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
var value;
$(function(){
var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");
	$('a[data-modal-id]').click(function(e) {
		 value = $(this).attr('value');
		 document.getElementById("eid").innerHTML =value;
		 e.preventDefault();
		 $.ajax({  
    	         type : 'GET', 
    	         url: 'getLMDetial.html',
       		      data: {
            		 'Eid': value,
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
             		document.getElementById("fname").value =data.firstName;
             		document.getElementById("mname").value =data.middlename;
             		document.getElementById("lname").value =data.lastName;
             		document.getElementById("dsg").value =data.designation;
             		document.getElementById("resp").value =data.responsibility;
             		document.getElementById("mob").value =data.mobile;
             		document.getElementById("email_id").value =data.email_id;
             		document.getElementById("address").value =data.Address;
             		document.getElementById("state").value =data.State;
             		document.getElementById("city").value =data.city;
             		document.getElementById("lmid").value =value;
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

</script>

</head>
<body id="top">

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
			</nav>
		</header>
	</div>
	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body -->
		<div class="row">
			<form:form action="searchLMByLCO.html" method="get">
				<input type="hidden" name="user" value="${user }" />


				<div class="col-sm-3">
					<div style="margin-bottom: 10px">
						<input name="username" type="text" id="fdate" tabindex="3"
							class="form-control" placeholder="Employee ID." />
					</div>

				</div>


				<div class="col-sm-3">
					<div style="margin-bottom: 10px">
						<input name="desig" type="text" id="ContentPlaceHolder1_txtmobile"
							tabindex="5" class="form-control" placeholder="Designation" />

					</div>

				</div>


				<div class="col-sm-3">
					<div style="margin-bottom: 10px">
						<input name="mobile" type="text"
							id="ContentPlaceHolder1_txtpackage" tabindex="7"
							class="form-control" placeholder="Mobile No." />

					</div>

				</div>


				<div class="col-sm-3">
					<div style="margin-bottom: 10px">

						<input type="submit"
							name="ctl00$ContentPlaceHolder1$btn_submit_request"
							style="border-radius: 8px; padding: 4px;" value="Search"
							id="ContentPlaceHolder1_btn_submit_request" tabindex="30"
							class="btn-primary btn-color btn-block pull-left" />


					</div>

				</div>
				<div class="nofound">${error}</div>
			</form:form>

		</div>



		<div class="col-sm-12">
			<hr />
			<div class="titleTd"
				style="width: 25%; margin-bottom: -35px; text-align: center; padding: 10px; font-size: x-large; color: #c4c1e8; background-color: dimgray; border-top-left-radius: 34px; border-top-right-radius: 54px;">All
				Line Man</div>
			<div style="width: 40%; margin-left: 890px;" class="col-sm-12">
				<div style="margin-bottom: 0px">
					<p>
						Total Count : <span id="ContentPlaceHolder1_lblcount"
							style="font-weight: bold;">${count}</span>
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
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Employee
						ID</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Name</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Email</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Mobile</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Address</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">City</th>
					<th scope="col" style="color: #FFFFFF; background-color: #12a59c;">Action</th>

				</tr>

				<c:forEach items="${userList}" var="user" varStatus="itr">
					<tr>
						<td style="width: 5%;">${offset + itr.index +1 }</td>
						<td>${user.username}</td>
						<td>${user.firstName}${user.lastName}</td>
						<td>${user.email_id}</td>
						<td>${user.mobile}</td>
						<td>${user.address}</td>
						<td>${user.city}</td>
						<td><a class="js-open-modal btn" href="#"
							value="${user.username}" data-modal-id="popup2"><img
								src="assets/img/edit.png" /></a></td>
					</tr>
				</c:forEach>
			</table>

			<tag:paginate max="15" offset="${offset}" count="${count}"
				uri="allSubscriber.html?user=${user}" next="&raquo;"
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
			<!-- ################################################################################################ -->
		</footer>
	</div>

	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div id="popup2" class="modal-box">
		<header style="background-color: #3eb3b3;">
			<a href="#" class="js-modal-close close">×</a>
			<h3 style="color: #ffffff;">
				Employee ID:<label for="form1" style="margin-top: -6px;color: #ffffff;margin-left: 35px;" id="eid"></label>
			</h3>
		</header>
		<div class="modal-body" style="padding-left: 0; padding: 0px;">
			<div class='panel panel-primary dialog-panel'>
				<div class='panel-body'>
					<form:form action="updateLM.html?user=${user}" method="post" modelAttribute="userForm" class='form-horizontal' role='form'>
							<input type="hidden" name="user" value="${user}"/>
							<input type="hidden" name="lmID" id="lmid"/>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Name</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">First
											Name</label> 
											<form:input path="firstName" requried="requried " class='form-control'
											id='fname'/>
											
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Middle
											Name</label> <form:input path="middlename" requried="requried " class='form-control'
											id='mname'/>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Last
											Name</label> <form:input path="lastName" requried="requried " class='form-control'
											id='lname' />
									</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'></label>
							<div class='col-md-8'>
								<div class='col-md-4' style="width: 38%;">
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Designation</label>
										<form:input path="designation" requried="requried" class='form-control' id='dsg'/>
									</div>
								</div>

								<div class='col-md-4 indent-small' style="width: 38%;">
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Responsibility</label>
										<form:input path="responsibility" requried="requried" class='form-control' id='resp' />
									</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'></label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Mobile</label>
										<form:input path="mobile" requried="requried " class='form-control'
											id='mob'/>
									</div>
								</div>
								<div class='col-md-6 indent-small' style="width: 50.5%;">
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Email</label>
										<form:input path="email_id" requried="requried " class='form-control' id='email_id'/>
									</div>
								</div>


							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'>Address</label>
							<div class='col-md-6'>
								<div class='form-group'>
									<div class='col-md-9' style="width: 72%;">
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">Add</label>
										<form:input path="Address" requried="requried" class='form-control' id='address'/>
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'></label>
							<div class='col-md-8'>
								<div class='col-md-4' style="width: 38%;">
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">State</label>
										<form:input path="State" requried="requried" class='form-control' id='state' />
									</div>
								</div>

								<div class='col-md-4 indent-small' style="width: 38%;">
									<div class='form-group internal'>
										<label for="name"
											style="margin-bottom: 0px; font-size: 14px; font-weight: 400;">City</label>
										<form:input path="city" requried="requried" class='form-control' id='city' />
									</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">

							<div class='col-md-8'>
								<div class='col-md-4' style="width: 38%;">
									<div class='form-group internal'>
										<input value="Submit!" type="submit" 
											class="btn-primary btn-color btn-block"
											style="margin-left: 186%;">
									</div>
								</div>



							</div>
						</div>


					</form:form>
				</div>
			</div>

		</div>
	</div>


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
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js"></script>
	<script src="layout/scripts/jquery.backtotop.js"></script>
	<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>