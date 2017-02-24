<!DOCTYPE html>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Payspot</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />



</head>
<body id="top">

	<div class="wrapper row1">
		<header id="header" class="hoc clear">
			<!-- ################################################################################################ -->
			<div id="logo" class="fl_left">
				<h1>
					<a href="LMDashboard.html?user=${user }">PaySpot</a>
				</h1>
			</div>
			<nav id="mainav" class="fl_right">
				<ul class="clear">
					<li><a href="LMnewConnn.html?user=${user }">Connection</a></li>

					<li><a class="drop" href="#">complaint</a>
						<ul>
							<li><a href="addComplaintLm.html?user=${user }">Add
									Complaint</a></li>
							<li><a href="LMallComp.html?user=${user }">All Complaint</a></li>
						</ul></li>
					<li><a href="lmtopUp.html?user=${user }">Topup</a></li>
					<li><a href="lmDetail.html?user=${user }">Profile</a></li>
					<li><a href="logOut.html?user=${user}"
						style="margin-right: -90px;">Log out</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body -->
		<div class="center btmspace-50">
			<div id="comp">


				<div class="row">
					<form action="addnewcomplaintbylm.html"
						onsubmit="return checkData()">
						<input type="hidden" name="user" value="${user }" />
						<div class="col-sm-3">
							<div style="margin-bottom: 40px">
								<input id="userid" type="text" value="" onchange="" tabindex="1"
									name=cust_id class="form-control" placeholder="Customer ID" />
								<script>
								$("#userid").keyup( function() {
								    var cust_id = $("#userid").val();
								    document.getElementById("findbymobile").value ="";			   
								    $.ajax({  
							            type : 'GET', 
							            url: 'findbycusId.html',
							            data: {
							            	'cust_id': cust_id,
							            	'user':  ${ user}
							             },
							            dataType: 'json',
							       		cache: false,
										beforeSend: function(xhr) 
							                        {
											debugger;
							                            xhr.setRequestHeader("Accept", "application/json");  
							                            xhr.setRequestHeader("Content-Type", "application/json");  
							                        },
							         				success: function (data) {
							         					 setData( data);
							           						
								            },
								            error: function(e){
								            	
								            }
							            
							        });
								   
								});
								function setData( data){
									
									var fname=data.FirstName;
									var lname=data.LastName;
									var name=fname+" "+lname;
									var Mobile=data.Mobile;
									var Email=data.EmailId;
									var address=data.Address;
									var crf=data.CRFNo;
									var stbno=data.STBNo;
									var connstatus=data.SubStatus;
									var amountblance=data.AccountBalance;
									
									document.getElementById("name").value =name;
									document.getElementById("Mobile").value =Mobile;
									document.getElementById("Email").value =Email;
									document.getElementById("address").value =address;
									document.getElementById("crf").value =crf;
									document.getElementById("stbno").value =stbno;
									document.getElementById("connstatus").value =connstatus;
									document.getElementById("amountblance").defaultValue =amountblance;
									
									
								}
											 	 
						  </script>
							</div>




						</div>
						<div class="col-sm-1" style="padding-left: 50px">
							<div>
								<p style="margin-left: px">
								<h5>OR</h5>
								</p>

							</div>

						</div>
						<div class="col-sm-3">
							<div style="margin-bottom: 40px">
								<input id="findbymobile" type="text" value="" onchange=""
									tabindex="1" name="mobile" class="form-control"
									placeholder="Mobile Number" />
								<script>
								$("#findbymobile").keyup( function() {
								    var mobile_no = $("#findbymobile").val();
								    document.getElementById("userid").value ="";		
								    $.ajax({  
							            type : 'GET', 
							            url: 'findByMobile.html',
							            data: {
							            	'mobile': mobile_no,
							            	'user':  ${ user}
							            },
							            dataType: 'json',
							       		cache: false,
										beforeSend: function(xhr) 
							                        { 
							                            xhr.setRequestHeader("Accept", "application/json");  
							                            xhr.setRequestHeader("Content-Type", "application/json");  
							                        },
							         				success: function (data) {
							         					 setData( data);
						           						
								            },
								            error: function(e){
								            	
								            }
							            
							        });
								   
								});
								
											 	 
						  </script>


							</div>
						</div>

						<div class="col-sm-3">
							<div style="margin-bottom: 40px">
								<select name="type" id="type" tabindex="11" class="form-control"
									placeholder="Responsibility">
									<option value="0">Complaint Type</option>
									<option value="No Signal">No Signal</option>
									<option value="Not Working">Not Working</option>
									<option value="STB Problem">STB Problem</option>
									<option value="Bad Singnal">Bad Singnal</option>
									<option value="Channel Not Available">Channel Not
										Available</option>

								</select>

							</div>
						</div>

						<div class="col-sm-10">
							<textarea rows="3" cols="100" class="form-control" name="report"
								placeholder="Add Remark"
								style="width: 103%; overflow: auto; resize: none;" required>
					</textarea>

						</div>
						<br>
						<div class="col-sm-2" style="padding-left: 20px">
							<div style="margin-bottom: 10px">
								<br> <br> <input type="submit" value="Lock Complaint"
									tabindex="12" class="btn-primary btn btn-block"
									style="margin-left: 28%;" />

							</div>

						</div>
					</form>

				</div>
				<script type="text/javascript">
				function checkData() {
					var t=document.getElementById("type").value;
					var vc=document.getElementById("userid").value;
					var mob=document.getElementById("findbymobile").value;
					
					if(vc==""){
						if(mob==""){
							alert("Please Select The Mobile Number or VC Number!!!");
							return false;
						}
						else
							
							if(t==0){
								alert("Please Select The Type First!!!");
								return false;
							}else{
								return true;
							}
					}else{
						if(t==0){
								alert("Please Select The Type First!!!");
								return false;
							}else{
								return true;
							}
					}
					
					
					
				}
				</script>
				<hr />

				<div class="container">
					<div class="row">

						<div class="col-sm-6">
							<div style="margin-bottom: 20px">
								<input name="name" type="text" id="name" disabled="disabled"
									tabindex="2" class="aspNetDisabled form-control"
									placeholder="Customer Name" />

							</div>
						</div>

						<div class="col-sm-6">
							<div style="margin-bottom: 20px">
								<input name="address" type="text" id="address"
									disabled="disabled" tabindex="2"
									class="aspNetDisabled form-control"
									placeholder="Customer Address" />

							</div>
						</div>

						<div class="col-sm-6">
							<div style="margin-bottom: 20px">

								<input name="Mobile" type="text" id="Mobile" disabled="disabled"
									tabindex="3" class="aspNetDisabled form-control"
									placeholder="Customer Mobile No." />

							</div>
						</div>

						<div class="col-sm-6">
							<div style="margin-bottom: 20px">

								<input name="Email" type="text" id="Email" disabled="disabled"
									tabindex="3" class="aspNetDisabled form-control"
									placeholder="Customer Email-ID" />

							</div>
						</div>

						<div class="col-sm-6">
							<div style="margin-bottom: 20px">

								<input name="crf" type="text" id="crf" disabled="disabled"
									tabindex="3" class="aspNetDisabled form-control"
									placeholder="Customer CRF No." />

							</div>
						</div>

						<div class="col-sm-6">
							<div style="margin-bottom: 20px">

								<input name="stbno" type="text" id="stbno" disabled="disabled"
									tabindex="3" class="aspNetDisabled form-control"
									placeholder="Customer STB No," />

							</div>
						</div>


						<div class="col-sm-6">
							<div style="margin-bottom: 20px">

								<input name="connstatus" type="text" id="connstatus"
									disabled="disabled" tabindex="3"
									class="aspNetDisabled form-control"
									placeholder="Connection Status" />

							</div>
						</div>



						<div class="col-sm-6">
							<div style="margin-bottom: 20px">

								<input name="amountblance" type="text" id="amountblance"
									disabled="disabled" tabindex="3"
									class="aspNetDisabled form-control"
									placeholder="Account Balance" />

							</div>
						</div>



						<div class="col-sm-12" style="height: 1px"></div>

					</div>
				</div>

			</div>




			<link
				href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.16/themes/humanity/jquery-ui.css"
				rel="stylesheet" type="text/css" />
			<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
			<script src="assets/js/jquery-1.10.2.js"></script>
			<script src="assets/js/bootstrap.js"></script>
			<script src="assets/js/bootstrap.min.js"></script>
			<script src="assets/js/pushy.js"></script>


			<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
			
		</div>




		<!-- ################################################################################################ -->
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