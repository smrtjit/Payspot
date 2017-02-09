
<!DOCTYPE html>

<html>
<head>
<title>New Channels</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />



<script type="text/javascript">
	$(document).ready(function() {
		$('.multiselect').multiselect();
		$('.datepicker').datepicker();
	});
</script>
</head>
<body id="top">
<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');"> 
  <!-- ################################################################################################ -->
  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="index.html">PaySpot</a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="LCOHome.html?user=${user }">Home</a></li>
          <li><a class="drop" href="#">Function</a>
            <ul>
              <li><a href="#">Collection</a></li>
              <li><a href="#">Connection</a></li>
              <li><a href="#">Stock</a></li>
              <li><a href="#">Topup</a></li>
              <li><a href="#">Compalint</a></li>
            </ul>
          </li>
          <li><a class="drop" href="#">Services</a>
            <ul>
              <li><a href="newConnn.html?user=${user }">New Connection</a></li>
              <li><a href="#">New LineMan</a></li>      
              <li><a href="newChannel.html?user=${user}">New Channel</a></li>      
              <li><a href="#">New Stock</a></li>                  
              <li><a href="#">New Complaint</a></li>
            </ul>
          </li>
          <li><a href="#">Profile</a></li>
          <li><a href="#">Log out</a></li>
        </ul>
      </nav>
    </header>
  </div>
	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body --> <!-- ################################################################################################ -->
		<!-- / main body -->
		<nav id="mainav">
			<ul class="clear">
				<li><h4>The Total Numbers of Channels are: 4</h4></li>
				<li style="width: 27%;"></li>
				<li><input type="file" class='form-control' /></li>
				<li class="fl_right"><button class="btn-lg btn-primary"
						style="padding: 4px 8px;">Uplaod Channel List</button></li>
			</ul>
		</nav>
		<hr>
		<table>
			<thead>
				<tr>
					<th style="text-align: center;">Name</th>
					<th style="text-align: center;">MSO Price</th>
					<th style="text-align: center;">LCO Price</th>
					<th style="text-align: center;">Last Update</th>
					<th style="text-align: center;">Edit</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align: center;">Value 1</td>
					<td style="text-align: center;">Value 2</td>
					<td style="text-align: center;">Value 3</td>
					<td style="text-align: center;">Value 4</td>
					<td style="text-align: center;"><a class="btn" href="#">Update</a></td>
				</tr>
				<tr>
					<td style="text-align: center;">Value 5</td>
					<td style="text-align: center;">Value 6</td>
					<td style="text-align: center;">Value 7</td>
					<td style="text-align: center;">Value 4</td>
					<td style="text-align: center;"><a class="btn" href="#">Update</a></td>
				</tr>
				<tr>
					<td style="text-align: center;">Value 9</td>
					<td style="text-align: center;">Value 4</td>
					<td style="text-align: center;">Value 10</td>
					<td style="text-align: center;">Value 11</td>
					<td style="text-align: center;"><a class="btn" href="#">Update</a></td>
				</tr>
				<tr>
					<td style="text-align: center;">Value 13</td>
					<td style="text-align: center;">Value 4</td>
					<td style="text-align: center;">Value 14</td>
					<td style="text-align: center;">Value 15</td>
					<td style="text-align: center;"><a class="btn" href="#">Update</a></td>
				</tr>
			</tbody>
		</table>
		<div class="fl_right">
			<button class="btn-lg btn-primary"
				style="padding: 0px 20px; background-color: white;">
				<img alt="" src="assets/img/add.png">
			</button>
		</div>
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
						<address>Street Name &amp; Number, Town, Postcode/Zip</address></li>
					<li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
					<li><i class="fa fa-fax"></i> +00 (123) 456 7890</li>
					<li><i class="fa fa-envelope-o"></i> info@domain.com</li>
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
				Copyright &copy; 2016 - All Rights Reserved - <a href="#">Domain
					Name</a>
			</p>
			<p class="fl_right">
				Template by <a target="_blank" href="http://www.os-templates.com/"
					title="Free Website Templates">OS Templates</a>
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
