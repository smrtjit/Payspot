<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<!DOCTYPE html>

<html>
<head>
<title>New LineMan</title>
<meta name="viewport" content="width=device-width, initial-scale=1 " />
<meta charset="utf-8">
<meta name="viewport "
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no ">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/circle.css" rel="stylesheet" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />


<link
	href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/css/bootstrap-switch.css'
	rel='stylesheet' type='text/css'>
<link
	href='http://davidstutz.github.io/bootstrap-multiselect/css/bootstrap-multiselect.css'
	rel='stylesheet' type='text/css'>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/js/bootstrap.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js'
	type='text/javascript'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/js/bootstrap-switch.min.js'
	type='text/javascript'></script>
<script
	src='http://davidstutz.github.io/bootstrap-multiselect/js/bootstrap-multiselect.js'
	type='text/javascript'></script>
<style>
.indent-small {
	margin-left: 5px;
}

.form-group.internal {
	margin-bottom: 0;
}

.dialog-panel {
	margin: 10px;
}

.datepicker-dropdown {
	z-index: 200 !important;
}

.panel-body {
	background: #e5e5e5;
	/* Old browsers */
	background: -moz-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%,
		color-stop(0%, #e5e5e5), color-stop(100%, #ffffff));
	/* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
	/* IE10+ */
	background: radial-gradient(ellipse at center, #e5e5e5 0%, #ffffff 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e5e5e5',
		endColorstr='#ffffff', GradientType=1);
	/* IE6-9 fallback on horizontal gradient */
	font: 600 15px "Open Sans", Arial, sans-serif;
}

label.control-label {
	font-weight: 600;
	color: #777;
}
</style>

<script type="text/javascript ">
      $(document).ready(function() {
      $('.multiselect').multiselect();
      $('.datepicker').datepicker();
      });
      </script>

<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</head>
<body id="top ">
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
               <li><a href="billDownload.html?user=${user}">Download Bill</a></li>      
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
	<div class="wrapper row3 ">
		<main class="hoc container clear "> <!-- main body --> <!-- ################################################################################################ -->

		<div class='container' style="margin-top: -128px;">
			<div class='panel panel-primary dialog-panel'
				style="border-color: #333333;">
				<div class='panel-heading'
					style="background-color: #072c31; border-color: #333333;">
					<h4>Create New Line Man</h4>
				</div>
				<div class='panel-body'>
					<form:form action="addLMUser.html" method="get" name="myForm"
						onsubmit="uploadImage();" class='form-horizontal' role='form'
						commandName="LMUSER" autocomplete="off">

						<form:hidden path="identity_proof_image_name" id="id_image" />
						<form:hidden path="add_proof_image_Name" id="add_image" />

						<input type="hidden" name="user" value="${user }" />
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Name</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:input path="firstName" placeholder='First Name'
										name="fname"	required="required" class='form-control'
										 pattern=".{5,}" maxlength="25" onkeypress="return onlyAlphabets(event,this)"  />
										
									</div>
								</div>
								<script type="text/javascript">
								function onlyAlphabets(e, t) {
						            try {
						                if (window.event) {
						                    var charCode = window.event.keyCode;
						                }
						                else if (e) {
						                    var charCode = e.which;
						                }
						                else { return true; }
						                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
						                	 return true;
						                else
						                    return false;
						            }
						            catch (err) {
						                alert(err.Description);
						            }
						        }
								</script>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="middlename" placeholder='Middle Name'
											class='form-control' />
										</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="lastName" placeholder='Last Name'
										name="lname"	required="required" class='form-control'
										 pattern=".{5,}" maxlength="25" onkeypress="return onlyAlphabets(event,this)"  />
										</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Contact Detail</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:input path="mobile" placeholder='Mobile Number' name="mobileno"
											required="required" class='form-control'
											title="MINIMUM SIZE" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											 pattern=".{10,}" maxlength="12" />
									</div>
								</div>
								<div class='col-md-6 indent-small' style="width: 50.5%;">
									<div class='form-group internal'>
										<form:input path="email_id" placeholder='Email ID' name="EMail"
											required="required" class='form-control'
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" />
										<!-- 										<input required="required " class='form-control' id='email_id' -->
										<!-- 											placeholder='Email ID' type='text'> -->
									</div>
								</div>


							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>ID Proof</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:select name="identyproof" required="true"
											path="identity_proof_type" class="form-control">
											<form:option value="">Select Type</form:option>
											<form:options items="${profftype}" />
										</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="identity_proof" placeholder='ID Number'
											required="required" class='form-control'
											title="MINIMUM SIZE" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											 pattern=".{6,}" maxlength="16"  />

									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<input type="file" name="uploadimage" id="myFile"
											required="required" multiple="" size="50"
											onchange="myFunction()" class="form-control"
											placeholder="Upload file">
										<script>
											function myFunction(){
										    var x = document.getElementById("myFile");
										    var x1 = document.getElementById("myFile").value;
										    var tmp=x1.split("\\");
										    var filename=tmp[tmp.length-1];
										    alert(filename);
										    document.getElementById('id_image').value=filename;
										    var formData = new FormData();
										    formData.append('uploadimage', $('input[type=file]')[0].files[0]);
										    var txt = "";
										    if ('files' in x) {
										        if (x.files.length == 0) {
										         } else {
										        	 var file;
										        	  for (var i = 0; i < x.files.length; i++) {
										               file = x.files[i];
										    			
										            }
										        	  
										        }
										    } 
										    else {
										        if (x.value == "") {
										            txt += "Select one or more files.";
										        } else {
										            txt += "The files property is not supported by your browser!";
										            txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead. 
										        }
										    }
										    document.getElementById("demo").innerHTML = txt;
										}
										
										</script>
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Addredd Proof</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:select name="addproftype" required="true"
											path="add_proof_type" class="form-control">
											<form:option value="">Select Type</form:option>
											<form:options items="${profftype}" />
										</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="add_proof" placeholder='ID Number'
											required="required" class='form-control'
											title="MINIMUM SIZE" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											 pattern=".{6,}" maxlength="16"  />
										<!-- 										<input required="required " class='form-control' id='crf_no' -->
										<!-- 											placeholder=' ID Number' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<input type="file" name="uploadimage1" id="myFile1"
											required="required" multiple="" size="50"
											onchange="myFunction1()" class="form-control"
											placeholder="Upload file">
										<script>
											function myFunction1(){
										    var x = document.getElementById("myFile1");
										    var x1 = document.getElementById("myFile1").value;
										    var tmp=x1.split("\\");
										    var filename=tmp[tmp.length-1];
										    document.getElementById('add_image').value=filename;
										    var formData = new FormData();
										    formData.append('uploadimage1', $('input[type=file]')[0].files[0]);
										    var txt = "";
										    if ('files' in x) {
										        if (x.files.length == 0) {
										         } else {
										        	 var file;
										        	  for (var i = 0; i < x.files.length; i++) {
										               file = x.files[i];
										    			
										            }
										        	  
										        }
										    } 
										    else {
										        if (x.value == "") {
										            txt += "Select one or more files.";
										        } else {
										            txt += "The files property is not supported by your browser!";
										            txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead. 
										        }
										    }
										    document.getElementById("demo").innerHTML = txt;
										}
											
										function uploadImage(){
											 var formData = new FormData();
											    formData.append('uploadimage', $('input[type=file]')[0].files[0]);
											 $.ajax({
								                    url : 'imageupload.html?user=1111',
								                    data : formData,
								                    enctype: 'multipart/form-data',
							
								                    processData : false,
								                    contentType : false,
								                    type : 'POST',
								                    success : function(data) {
								                    },
								                    error : function(err) {
								                        alert(err);
								                    }
								                });
											 
											 
											 var formData1 = new FormData();
											 var fileInputElement = document.getElementById("myFile1");
											  formData1.append("uploadimage", fileInputElement.files[0]);
											   // formData1.append('uploadimage', document.getElementById('uploadimage1')[0].files[0]);
											 $.ajax({
								                    url : 'imageupload.html?user=1111',
								                    data : formData1,
								                    enctype: 'multipart/form-data',
							
								                    processData : false,
								                    contentType : false,
								                    type : 'POST',
								                    success : function(data) {
								                    },
								                    error : function(err) {
								                        alert(err);
								                    }
								                });
											
										}	
										</script>
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'>Address</label>
							<div class='col-md-6'>
								<div class='form-group'>
									<div class='col-md-9' style="width: 72%;">

										<form:input path="Address" placeholder='Address'
											required="required" class='form-control' />
									</div>
								</div>

							</div>
						</div>


						<div class='form-group'
							style="margin-left: -200px; margin-top: -15px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'></label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:select path="State" class="form-control" id="mySelect"
											onchange="myFunc()">
											<form:option value="0" label="Select State" />
											<form:option value="Andaman and Nicobar Islands"
												label="Andaman and Nicobar Islands" />
											<form:option value="Andhra Pradesh" label="Andhra Pradesh" />
											<form:option value="Arunachal Pradesh"
												label="Arunachal Pradesh" />
											<form:option value="Assam" label="Assam" />
											<form:option value="Bihar" label="Bihar" />
											<form:option value="Chhattisgarh" label="Chhattisgarh" />
											<form:option value="Chandigarh" label="Chandigarh" />
											<form:option value="Dadra and Nagar Haveli"
												label="Dadra and Nagar Haveli" />
											<form:option value="Daman and Diu" label="Daman and Diu" />
											<form:option value="Delhi" label="Delhi" />
											<form:option value="Goa" label="Goa" />
											<form:option value="Gujarat" label="Gujarat" />
											<form:option value="Haryana" label="Haryana" />
											<form:option value="Himachal Pradesh"
												label="Himachal Pradesh" />
											<form:option value="Jammu & Kashmir" label="Jammu & Kashmir" />
											<form:option value="Jharkhand" label="Jharkhand" />
											<form:option value="Karnataka" label="Karnataka" />
											<form:option value="Kerala" label="Kerala" />
											<form:option value="Madhya Pradesh" label="Madhya Pradesh" />
											<form:option value="Maharashtra" label="Maharashtra" />
											<form:option value="Manipur" label="Manipur" />
											<form:option value="Meghalaya" label="Meghalaya" />
											<form:option value="Mizoram" label="Mizoram" />
											<form:option value="Nagaland" label="Nagaland" />
											<form:option value="Odisha" label="Odisha" />
											<form:option value="Punjab" label="Punjab" />
											<form:option value="Rajasthan" label="Rajasthan" />
											<form:option value="Sikkim" label="Sikkim" />
											<form:option value="Tamil Nadu" label="Tamil Nadu" />
											<form:option value="Telangana" label="Telangana" />
											<form:option value="Tripura" label="Tripura" />
											<form:option value="Uttar Pradesh" label="Uttar Pradesh" />
											<form:option value="Uttarakhand" label="Uttarakhand" />
											<form:option value="West Bengal" label="West Bengal" />
											<form:option value="Lakshadweep" label="Lakshadweep" />
											<form:option value="Puducherry" label="Puducherry" />

										</form:select>
										<script type="text/javascript">
											function myFunc() {
												var selectedValue = $("#mySelect").val();
												 $.ajax({  
											            type : 'GET', 
											            url: 'getCityName.html',
											            data: {
											            	
											            	'cityname': selectedValue,
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
											         				      var html = '';
											         	                  var len = data.length;
											         	                  for(var i=0; i<len; i++){
											         	                       html += '<option value="' + data[i] + '">' + data[i] + '</option>';
											         	                   }
											         	                 $('#city')
											         	                .find('option')
											         	                .remove()
											         	                .end()
											         	                .append('<option value="None">Select City</option>')
											         	                .val('whatever')
											         	            ;
											         	                  $('#city').append(html);
										           						
												          		    },
														            error: function(e){
														            	console.warn(e);
														            	
														            }
											            
											      		  });
											}
										</script>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:select name="cities" required="true" path="city"
											id="city" class="form-control">
											<form:option value="">Select City</form:option>
											<%-- 											<form:options items="${cityList}" /> --%>
										</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="pincode" placeholder='Pin Code'
											required="required" class='form-control'
											title="MINIMUM SIZE" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											 pattern=".{6,}" maxlength="6"  />
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Role & Responsibility</label>
							<div class='col-md-8'>
								<div class='col-md-4' style="width: 38%;">
									<div class='form-group internal'>
										<form:input path="designation" placeholder='Role'
											required="required" class='form-control'
											 pattern=".{5,}" maxlength="25" onkeypress="return onlyAlphabets(event,this)"  />
										<!-- 										<input required="required " class='form-control' id='gst_no' -->
										<!-- 											placeholder='Role' type='text'> -->
									</div>
								</div>

								<div class='col-md-4 indent-small' style="width: 38%;">
									<div class='form-group internal'>
										<form:input path="responsibility" placeholder='Responsibility'
											required="required" class='form-control'
											 pattern=".{5,}" maxlength="25" onkeypress="return onlyAlphabets(event,this)"  />
										<!-- 										<input required="required " class='form-control' id='gst_no' -->
										<!-- 											placeholder='Responsibility' type='text'> -->
									</div>
								</div>

							</div>
						</div>




						<div class='form-group' style="margin-left: -200px;">
							<div class='col-md-offset-4 col-md-3'>
								<button class="btn-lg btn-primary " type="submit "
									style="font-size: 13px;">Save Connection</button>
							</div>
							<div class='col-md-3'>
								<button class='btn-lg btn-danger'
									style='float: right; font-size: 13px;' type='submit'>Cancel</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- ################################################################################################ -->
		<!-- / main body -->
		<div class="clear "></div>
		</main>
	</div>

	<!-- <div class= "wrapper coloured "> -->
	<!--   <div id= "social " class= "hoc clear ">  -->
	<!--     ################################################################################################ -->
	<!--     <div class= "one_half first "> -->
	<!--       <h6 class= "title ">Social Media</h6> -->
	<!--       <ul class= "faico clear "> -->
	<!--         <li><a class= "faicon-facebook " href= "# "><i class= "fa fa-facebook "></i></a></li> -->
	<!--         <li><a class= "faicon-pinterest " href= "# "><i class= "fa fa-pinterest "></i></a></li> -->
	<!--         <li><a class= "faicon-twitter " href= "# "><i class= "fa fa-twitter "></i></a></li> -->
	<!--         <li><a class= "faicon-dribble " href= "# "><i class= "fa fa-dribbble "></i></a></li> -->
	<!--         <li><a class= "faicon-linkedin " href= "# "><i class= "fa fa-linkedin "></i></a></li> -->
	<!--         <li><a class= "faicon-google-plus " href= "# "><i class= "fa fa-google-plus "></i></a></li> -->
	<!--         <li><a class= "faicon-vk " href= "# "><i class= "fa fa-vk "></i></a></li> -->
	<!--         <li><a class= "faicon-youtube " href= "# "><i class= "fa fa-youtube "></i></a></li> -->
	<!--         <li><a class= "faicon-rss " href= "# "><i class= "fa fa-rss "></i></a></li> -->
	<!--       </ul> -->
	<!--     </div> -->
	<!--     <div class= "one_half "> -->
	<!--       <h6 class= "title ">Newsletter sign-up</h6> -->
	<!--       <form class= "clear " method= "post " action= "# "> -->
	<!--         <fieldset> -->
	<!--           <legend>Newsletter:</legend> -->
	<!--           <input type= "text " value= " " placeholder= "Type Email Here&hellip; "> -->
	<!--           <button class= "fa fa-share " type= "submit " title= "Submit "><em>Submit</em></button> -->
	<!--         </fieldset> -->
	<!--       </form> -->
	<!--     </div> -->
	<!-- ################################################################################################ -->
	<!--   </div> -->
	<!-- </div> -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
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

<script type="text/javascript">
   
      // Form validation code will come here.
      function validate()
      {
      
         if( document.myForm.fname.value == "" )
         {
            alert( "Please provide your name!" );
            document.myForm.fname.focus() ;
            return false;
         }

         if( document.myForm.lname.value == "" )
         {
            alert( "Please provide your name!" );
            document.myForm.lname.focus() ;
            return false;
         }
         
         
         if( document.myForm.mobileno.value == "" )
         {
            alert( "Please provide your Email!" );
            document.myForm.mobileno.focus() ;
            return false;
         }
         
         if( document.myForm.EMail.value == "" )
         {
            alert( "Please provide your Email!" );
            document.myForm.EMail.focus() ;
            return false;
         }
         
         if( document.myForm.Zip.value == "" ||
         isNaN( document.myForm.Zip.value ) ||
         document.myForm.Zip.value.length != 5 )
         {
            alert( "Please provide a zip in the format #####." );
            document.myForm.Zip.focus() ;
            return false;
         }
         
         if( document.myForm.Country.value == "-1" )
         {
            alert( "Please provide your country!" );
            return false;
         }
         return( true );
      }
   
</script>
	
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js "></script>
	<script src="layout/scripts/jquery.backtotop.js "></script>
	<script src="layout/scripts/jquery.mobilemenu.js "></script>
</body>
</html>
