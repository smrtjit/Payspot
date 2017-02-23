<!DOCTYPE html>

<html>
<head>
<title>Payspot</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
        <h1><a href="LMDashboard.html?user=${user }">PaySpot</a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
            <li><a href="LMnewConnn.html?user=${user }">Connection</a></li>
            
          <li><a class="drop" href="#">complaint</a>
            <ul>
         	  <li><a href="addComplaintLm.html?user=${user }">Add Complaint</a></li>
              <li><a href="LMallComp.html?user=${user }">All Complaint</a></li>    
             </ul>
          </li>
          <li><a href="lmtopUp.html?user=${user }">Topup</a></li>
          <li><a href="lmDetail.html?user=${user }">Profile</a></li>
          <li><a href="logOut.html?user=${user}" style="margin-right: -90px;">Log out</a></li>
        </ul>
      </nav>
    </header>
  </div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <div class="center btmspace-50">
	<div id="comp" >


					<div class="row">

						<div class="col-sm-2">
							<div style="margin-bottom: 10px">
								<input name="vc_no" type="text" id="txtLeave" tabindex="1" class="form-control" placeholder="VC Number" />

							</div>

						</div>
						<div class="col-sm-1">
							<div style="margin-bottom: 10px">
								<p style="margin-left: 20px">OR</p>

							</div>

						</div>
						<div class="col-sm-2">
							<div style="margin-bottom: 10px">

								<input name="mobile" type="text"
									id="ContentPlaceHolder1_txtmobileno" tabindex="2"
									class="form-control" placeholder="Mobile Number" />

							</div>
						</div>

						<div class="col-sm-2">
							<div style="margin-bottom: 20px">
								<select name="ctl00$ContentPlaceHolder1$ddlcomplaint"
									id="ContentPlaceHolder1_ddlcomplaint" tabindex="11"
									class="form-control" placeholder="Responsibility">
									<option value="Select">Complaint Type</option>
									<option value="No Signal">No Signal</option>
									<option value="Not Working">Not Working</option>
									<option value="STB Problem">STB Problem</option>
									<option value="Bad Singnal">Bad Singnal</option>
									<option value="Channel Not Available">Channel Not
										Available</option>

								</select>

							</div>
						</div>

						<div class="col-sm-2">
							<textarea name="ctl00$ContentPlaceHolder1$txtrmark" rows="2"
								cols="20" id="ContentPlaceHolder1_txtrmark" class="form-control"
								placeholder="Add Remark">
</textarea>

						</div>
						<div class="col-sm-2">
							<div style="margin-bottom: 10px">

								<input type="submit"
									name="ctl00$ContentPlaceHolder1$btn_addUser"
									value="Lock Complaint" id="ContentPlaceHolder1_btn_addUser"
									tabindex="12" class="btn-primary btn btn-block" />

							</div>
						</div>
					</div>

					<hr />

					<div class="container">
						<div class="row">

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">
									<input name="ctl00$ContentPlaceHolder1$txtcustname" type="text"
										id="ContentPlaceHolder1_txtcustname" disabled="disabled"
										tabindex="2" class="aspNetDisabled form-control"
										placeholder="Customer Name" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">
									<input name="ctl00$ContentPlaceHolder1$txtcustadd" type="text"
										id="ContentPlaceHolder1_txtcustadd" disabled="disabled"
										tabindex="2" class="aspNetDisabled form-control"
										placeholder="Customer Address" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustmobilenumber"
										type="text" id="ContentPlaceHolder1_txtcustmobilenumber"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control"
										placeholder="Customer Mobile No." />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustEmailid"
										type="text" id="ContentPlaceHolder1_txtcustEmailid"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control"
										placeholder="Customer Email-ID" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustvcno" type="text"
										id="ContentPlaceHolder1_txtcustvcno" disabled="disabled"
										tabindex="3" class="aspNetDisabled form-control"
										placeholder="Customer VC No." />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustsbtno"
										type="text" id="ContentPlaceHolder1_txtcustsbtno"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control"
										placeholder="Customer STB No," />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustwarantydate"
										type="text" id="ContentPlaceHolder1_txtcustwarantydate"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control"
										placeholder="VC Warranty Date" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustconnection"
										type="text" id="ContentPlaceHolder1_txtcustconnection"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control"
										placeholder="Connection Status" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustpackege"
										type="text" id="ContentPlaceHolder1_txtcustpackege"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control" placeholder="Package Name" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustbal" type="text"
										id="ContentPlaceHolder1_txtcustbal" disabled="disabled"
										tabindex="3" class="aspNetDisabled form-control"
										placeholder="Account Balance" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtcustlastpay"
										type="text" id="ContentPlaceHolder1_txtcustlastpay"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control" placeholder="Last Payment" />

								</div>
							</div>

							<div class="col-sm-6">
								<div style="margin-bottom: 20px">

									<input name="ctl00$ContentPlaceHolder1$txtlastrechargedate"
										type="text" id="ContentPlaceHolder1_txtlastrechargedate"
										disabled="disabled" tabindex="3"
										class="aspNetDisabled form-control"
										placeholder="Last Recharge Date" />

								</div>
							</div>
							<div class="col-sm-6"></div>




							<div class="col-sm-12" style="height: 1px"></div>

						</div>
					</div>

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
      <p>Molestie metus non pharetra felis donec volutpat molestie ligula imperdiet laoreet dolor scelerisque eu nunc aliquet tortor erat ut tempus justo tristique.</p>
      <p>Condimentum vivamus tempus nisi et augue fringilla aliquet mauris scelerisque sollicitudin justo non posuere nunc mollis facilisis purus imperdiet aliquet nisi consectetur et phasellus.</p>
    </div>
    <div class="one_third">
      <h6 class="title">Morbi ullamcorper</h6>
      <ul class="nospace linklist contact">
        <li><i class="fa fa-map-marker"></i>
          <address>
          E-6 &amp; Kailash Coloney, <br>                
          110042
          </address>
        </li>
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
            <h2 class="nospace font-x1"><a href="#">Suscipit mauris nunc</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
            <p class="nospace">Euismod leo pulvinar a aenean vehicula varius eros convallis sagittis integer&hellip;</p>
          </article>
        </li>
        <li>
          <article>
            <h2 class="nospace font-x1"><a href="#">Eros magna sed</a></h2>
            <time class="font-xs block btmspace-10" datetime="2045-04-05">Thursday, 5<sup>th</sup> April 2045</time>
            <p class="nospace">Posuere donec posuere elit condimentum aliquet eget eu elit sed eget massa&hellip;</p>
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
    <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">Payspot.in</a></p>
  
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