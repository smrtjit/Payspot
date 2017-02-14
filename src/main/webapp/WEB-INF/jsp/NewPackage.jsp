<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>New Package</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />

<!-- for model -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.first-column {
	width: 100%;
	float: left;
}

.second-column {
	width: 114%;
	float: right;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.multiselect').multiselect();
		$('.datepicker').datepicker();
	});
</script>
</head>
<body id="top">
   <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="LCOHome.html?user=${user }">PaySpot</a></h1>
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
             
            </ul>
          </li>
          <li><a class="drop" href="#">Repository</a>
            <ul>
             <li><a href="allLM.html?user=${user }">Line Man</a></li>
               <li><a href="stock.html?user=${user }">Stock</a></li>
              <li><a href="newPackage.html?user=${user }">Packages</a></li>                  
              <li><a href="newChannel.html?user=${user}">Channels</a></li>
              
            </ul>
          </li>
          <li><a href="lcoDetail.html?user=${user }">Profile</a></li>
          <li><a href="logOut.html?user=${user}" style="margin-right: -90px;">Log out</a></li>
        </ul>
      </nav>
    </header>
  </div>
	<div class="wrapper row3">
		<main class="hoc container clear">
		<nav id="mainav">
			<ul class="clear">

				<li class="fl_right"><button type="button"
						class="btn-lg btn-primary" data-toggle="modal"
						data-target="#channelmodel" style="padding: 4px 8px;">Add
						New Package</button></li>

				<div class="modal fade" id="channelmodel" role="dialog">
					<div class="modal-dialog modal-lg"
						style=" margin-top: 170px;">
						<div class="modal-content" style="margin: -124px;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>
							<div class="modal-body" style="margin: 70px;     margin-top: 120px;">
								<div class="first-column">
									<!-- Your first column here -->


									<div class="form-group"
										style="margin-left: -200px;    margin-top: -120px;">
										<label class="control-label col-md-2 col-md-offset-2">Package Type</label>
										<div class="col-md-8">
											<div class="col-md-5">
												<div class="form-group internal">
													<select required class="form-control">
														<option value="None">Select Type</option>
														<option value="Basic">Basic</option>
														<option value="Add On">Add On</option>
														<option value="A-La-Carte">A-La-Carte</option>
														
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: -200px;">
										<label class="control-label col-md-2 col-md-offset-2"
											for="id_title">Package Name</label>
										<div class="col-md-8">
											<div class="col-md-5">
												<div class="form-group internal">
													<input requried="requried " class="form-control"
														id="gst_no" placeholder="Package Price" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: -200px;">
										<label class="control-label col-md-2 col-md-offset-2"
											for="id_title">Package Price</label>
										<div class="col-md-8">
											<div class="col-md-5">
												<div class="form-group internal">
													<input requried="requried " class="form-control"
														id="gst_no" placeholder="Package Price" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group" style="margin-left: -200px;">
										<label class="control-label col-md-2 col-md-offset-2"
											for="id_title">Channel</label>
										<div class="col-md-8">
											<div class="col-md-5">
												<div class="form-group internal">
													<select requried="requried " class="form-control "
														id="ch_name ">
														<option>Select Type</option>
														<option>Ms</option>
														<option>Mrs</option>
														<option>Miss</option>
														<option>Dr</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="second-column">
								<div class="verticalLine" style="margin-left: 800px;"> 
									<div class="form-group"	style="margin-left: 45px;margin-right: -65px;margin-top: -200px;">
									
										<table>
										<thead>
											<tr>
												<th style="text-align: center;">Channel Name</th>
												<th style="text-align: center;">Remove</th>
											
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="text-align: center; padding-top: 4px;">Value 1</td>
												<td style="text-align: center; padding-top: 3px; padding-left: 46px"><button type="button" class="btn-lg btn-primary" style="padding: 2px 5px;margin-left: 29px;font-size: 15px;">Remove</button></td>
											</tr>
											<tr>
												<td style="text-align: center; padding-top: 4px;">Value 1</td>
												<td style="text-align: center; padding-top: 3px; padding-left: 46px"><button type="button" class="btn-lg btn-primary" style="padding: 2px 5px;margin-left: 29px;font-size: 15px;">Remove</button></td>
											</tr>
										</tbody>
									</table>
										
									</div>
									</div>
									
								</div>

							</div>
							<div class="modal-footer">
								
							</div>
						</div>
					</div>
				</div>


		</ul>
		</nav>
		<hr>
		<table>
			<thead>
				<tr>
				<th style="text-align: center;width:8%; color: #FFFFFF;background-color: #12a59c;">SNo.</th>
					<th style="text-align: center;color: #FFFFFF;background-color: #12a59c;">Name</th>
					<th style="text-align: center;color: #FFFFFF;background-color: #12a59c;">Package Type</th>
					<th style="text-align: center;color: #FFFFFF;background-color: #12a59c;">No. of Channels</th>
					<th style="text-align: center;color: #FFFFFF;background-color: #12a59c;">Package Price</th>
					<th style="text-align: center;color: #FFFFFF;background-color: #12a59c;">Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${PckgList}" var="list" varStatus="itr">

						<tr>
							<td style="text-align: center;">${offset + itr.index +1 }</td>
							<td style="text-align: center;">${list.pckgName}</td>
							<td style="text-align: center;">${list.pckgType}</td>
							<td style="text-align: center;">${list.noOfChannels}</td>
							<td style="text-align: center;">${list.price}</td>
							
							<td style="text-align: center;"><a class="btn" href="#">Update</a></td>

						</tr>

					</c:forEach>
				
			</tbody>
		</table>
		<tag:paginate max="15" offset="${offset}" count="${count}"
				uri="newPackage.html?user=${user}" next="&raquo;" previous="&laquo;" />
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
		<a id="backtotop " href="#top "><i class="fa fa-chevron-up "></i></a>
		<!-- JAVASCRIPTS -->
		<script src="layout/scripts/jquery.min.js "></script>
		<script src="layout/scripts/jquery.backtotop.js "></script>
		<script src="layout/scripts/jquery.mobilemenu.js "></script>
</body>
</html>
