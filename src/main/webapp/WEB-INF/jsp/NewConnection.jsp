<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ taglib prefix="tag1" uri="/WEB-INF/taglibs/customTaglib2.tld"%>
<html>
<head>
<title>New Connection</title>
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

#serviceBox {
	width: 100%;
	margin: 0 auto;
}

.serviceBox1 {
	float: left;
	width: 50%;
}
</style>

<script type="text/javascript">
     			function getData(){
     			//	alert("hello");
	     				$.ajax({  
						            type : 'GET', 
						            url: 'getAddOnPckg.html',
					        	    data: {
						            	"user":  ${user}
						            },
						            dataType: 'json',
						       		cache: false,
									beforeSend: function(xhr) 
					         		{
					                   xhr.setRequestHeader("Accept", "application/json");  
					               xhr.setRequestHeader("Content-Type", "application/json");  
					             },
					  			success: function (json) {
					  			  // alert(json);
					  			 var tr;
					  			        for (var i = 0; i < json.length; i++) {
					  			            tr = $('<tr/>');
					  			            tr.append("<td><input type='checkbox' onclick='calc(this,this.value);'name='addonpckg' value='"+json[i]+"'><label style='margin-left: 51px; margin-top: -37px;'for='checkbox_id'>"+json[i]+"</label></td>");
					  			            $('#addonpckg').append(tr);
					  			        }
					  			 },
							         error: function(e){
							     }
							 });
	     				
	     				$.ajax({  
				            type : 'GET', 
				            url: 'getALCarte.html',
			        	    data: {
				            	"user":  ${user}
				            },
				            dataType: 'json',
				       		cache: false,
							beforeSend: function(xhr) 
			         		{
			                   xhr.setRequestHeader("Accept", "application/json");  
			               xhr.setRequestHeader("Content-Type", "application/json");  
			             },
			  			success: function (json) {
			  			   //alert(json);
			  			 var tr;
			  			        for (var i = 0; i < json.length; i++) {
			  			            tr = $('<tr/>');
			  			          tr.append("<td><input type='checkbox' onclick='calc1(this,this.value);' name='alpckg' value='"+json[i]+"'><label style='margin-left: 51px; margin-top: -37px;'for='checkbox_id'>"+json[i]+"</label></td>");
			  			            $('#alpckg').append(tr);
			  			        }
			  			 },
					         error: function(e){
					     }
					 });
						}
      </script>

<!-- ########################################### For Total Cost ############################################################### -->
<script type="text/javascript">

var addonlist="";
var allist="";

function checkCost(pckgname){
	//alert(pckgname);
	$('input:checkbox').removeAttr('checked');
	addonlist="";
	allist="";
	$.ajax({  
        type : 'GET', 
        url: 'getTotalCostForBase.html',
	    data: {
        	"user":  ${user},
        	"name":  pckgname
        },
        dataType: 'json',
   		cache: false,
		beforeSend: function(xhr) 
 		{
           xhr.setRequestHeader("Accept", "application/json");  
       xhr.setRequestHeader("Content-Type", "application/json");  
     },
		success: function (json) {
		  // alert(json);
		   document.getElementById("pckgprice").value = json;
		
		 },
         error: function(e){
     }
 });
}

function calc(id,pckgname)
{
	//alert("first");
	var price=document.getElementById("pckgprice").value;
	 if (id.checked){
		 addonlist=addonlist+pckgname+",";
		// alert("test:"+addonlist);
  if(price==""){
	  price="NA";
  }
 // alert(pckgname+","+price);
  $.ajax({  
	        type : 'GET', 
	        url: 'getTotalCostForMulti.html',
		    data: {
	        	"user":  ${user},
	        	"name":  pckgname,
	        	"cost":  price
	        },
	        dataType: 'json',
	   		cache: false,
			beforeSend: function(xhr) 
	 		{
	           xhr.setRequestHeader("Accept", "application/json");  
	       xhr.setRequestHeader("Content-Type", "application/json");  
	     },
			success: function (json) {
			  // alert(json);
			   document.getElementById("pckgprice").value = json;
			
			 },
	         error: function(e){
	     }
	 });
	 }else{
		 var tmp=pckgname+",";
		 addonlist=addonlist.replace(tmp,"");
		 $.ajax({  
		        type : 'GET', 
		        url: 'getReduceCostForMulti.html',
			    data: {
		        	"user":  ${user},
		        	"name":  pckgname,
		        	"cost":  price
		        },
		        dataType: 'json',
		   		cache: false,
				beforeSend: function(xhr) 
		 		{
		           xhr.setRequestHeader("Accept", "application/json");  
		       xhr.setRequestHeader("Content-Type", "application/json");  
		     },
				success: function (json) {
				 //  alert(json);
				   document.getElementById("pckgprice").value = json;
				
				 },
		         error: function(e){
		     }
		 });
	 }

}


function calc1(id,pckgname)
{
	//alert("first");
	var price=document.getElementById("pckgprice").value;
	 if (id.checked){
		 allist=allist+pckgname+",";
  if(price==""){
	  price="NA";
  }
 // alert(pckgname+","+price);
  $.ajax({  
	        type : 'GET', 
	        url: 'getTotalCostForMulti.html',
		    data: {
	        	"user":  ${user},
	        	"name":  pckgname,
	        	"cost":  price
	        },
	        dataType: 'json',
	   		cache: false,
			beforeSend: function(xhr) 
	 		{
	           xhr.setRequestHeader("Accept", "application/json");  
	       xhr.setRequestHeader("Content-Type", "application/json");  
	     },
			success: function (json) {
			  // alert(json);
			   document.getElementById("pckgprice").value = json;
			
			 },
	         error: function(e){
	     }
	 });
	 }else{
		 var tmp=pckgname+",";
		 allist=allist.replace(tmp,"");
			 $.ajax({  
		        type : 'GET', 
		        url: 'getReduceCostForMulti.html',
			    data: {
		        	"user":  ${user},
		        	"name":  pckgname,
		        	"cost":  price
		        },
		        dataType: 'json',
		   		cache: false,
				beforeSend: function(xhr) 
		 		{
		           xhr.setRequestHeader("Accept", "application/json");  
		       xhr.setRequestHeader("Content-Type", "application/json");  
		     },
				success: function (json) {
				 //  alert(json);
				   document.getElementById("pckgprice").value = json;
				
				 },
		         error: function(e){
		     }
		 });
	 }
 
	
}

function setvalue(){
	//alert(addonlist);
	addonlist=addonlist.substring(0,addonlist.length-1);
	allist=allist.substring(0,allist.length-1);
	document.getElementById("addlist").value = addonlist;
	document.getElementById("alll").value = allist;
	uploadImageLocation();
}

</script>
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</head>
<body id="top" onload="getData()">
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
							<li><a href="billDownload.html?user=${user}">Download
									Bill</a></li>
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
	<div class="wrapper row3 ">
		<main class="hoc container clear "> <!-- main body --> <!-- ################################################################################################ -->

		<div class='container' style="margin-top: -128px;">
			<div class='panel panel-primary dialog-panel'>
				<div class='panel-heading'>
					<h5>Create New Connection</h5>
				</div>
				<div class='panel-body'>
					<form:form action="addSubscriber.html" method="post"
						modelAttribute="NewSubscriber" class='form-horizontal' role='form'
						onsubmit="setvalue()">

						<input type="hidden" name="addpckg" id="addlist" />
						<input type="hidden" name="allpckg" id="alll" />

						<input type="hidden" name="user" value="${user }" />
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


						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Name</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:input path="FirstName" placeholder='First Name'
											required="required" pattern=".{4,}" maxlength="25"
											onkeypress="return onlyAlphabets(event,this)"
											class='form-control' />
										<!-- 										<input requried class='form-control' id='id_first_name' -->
										<!-- 											placeholder='First Name' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="MiddleName" placeholder='Middle Name'
											class='form-control' pattern=".{4,}" maxlength="25"
											onkeypress="return onlyAlphabets(event,this)" />
										<!-- 										<input class='form-control' id='id_middle_name' -->
										<!-- 											placeholder='Middle Name' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="LastName" placeholder='Last Name'
											required="required" class='form-control' pattern=".{4,}"
											maxlength="25" onkeypress="return onlyAlphabets(event,this)" />
										<!-- 										<input requried class='form-control' id='id_last_name' -->
										<!-- 											placeholder='Last Name' type='text'> -->
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
										<form:input path="Mobile" placeholder='Mobile Number'
											required="required" class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{10,}" maxlength="12" />
										<!-- 										<input requried="requried " class='form-control' -->
										<!-- 											id='mobile_no' placeholder='Mobile Number' type='text'> -->
									</div>
								</div>
								<div class='col-md-6 indent-small' style="width: 50.5%;">
									<div class='form-group internal'>
										<form:input type="<strong>email</strong>" path="EmailId" placeholder='Email ID'
											required="required" class='form-control'/>
									</div>
								</div>


							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Photo ID</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:select path="PhotoIDType" class="form-control"
											required="true">
											<form:option value="" label="Select Type" />
											<form:option value="PAN Card" label="PAN Card" />
											<form:option value="Adhaar Card" label="Adhaar Card" />
											<form:option value="Passport" label="Passport" />
											<form:option value="Driving License" label="Driving License" />
											<form:option value="Arms Licence" label="Arms Licence" />
											<form:option value="Election Commission ID Card"
												label="Election Commission ID Card" />
										</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="PhotoID" placeholder=' ID Number'
											required="required" class='form-control' title="MINIMUM SIZE"
											pattern=".{6,}" maxlength="20" />
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>

										<form:hidden path="PhotoIDURL" id="add_image" />
										<input type="file" name="uploadimage" id="myFile1"
											required="required" multiple="" size="50"
											onchange="myFunction1()" class="form-control"
											placeholder="Upload file">
										<script>
										var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];    

											function myFunction1(){
										    var x = document.getElementById("myFile1");
										    var x1 = document.getElementById("myFile1").value;
										    var tmp=x1.split("\\");
										    var filename=tmp[tmp.length-1];
										    document.getElementById('add_image').value=filename;
										    var txt = "";
										    if ('files' in x) {
										        if (x.files.length == 0) {
										         } 
										        else {
										        	alert("1");
										        	var blnValid = false;
										        	 var file;
										        	 for (var j = 0; j < _validFileExtensions.length; j++) {
										                    var sCurExtension = _validFileExtensions[j];
										                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
										                        blnValid = true;
										                        break;
										                    }
										                }
										        	 if (!blnValid) {
										                    alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
										                    return false;
										                }
// 										        	  for (var i = 0; i < x.files.length; i++) {
// 										               file = x.files[i];
										    			
// 										            }
										        	  
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
							<label class='control-label col-md-2 col-md-offset-2'>Address</label>
							<div class='col-md-6'>
								<div class='form-group'>
									<div class='col-md-9' style="width: 72%;">
										<form:input path="Address" placeholder='Address'
											required="required" class='form-control' />
										<!-- 										<input requried="requried " class='form-control' id='address' -->
										<!-- 											placeholder='Address' type='text'> -->
									</div>
								</div>
								<div class='form-group internal'>
									<div class='col-md-9' style="width: 72%;">
										<form:input path="LandMark" placeholder='Landmark'
											required="required" class='form-control' />
										<!-- 										<input class='form-control' id='id_phone' -->
										<!-- 											placeholder='Landmark' type='text'> -->
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
										<form:select path="State" class="form-control" id="mySelect"
											required="true" onchange="myFunc()">
											<form:option value="" label="Select State" />
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
										<form:input path="Pincode" placeholder='Pin Code'
											required="required" class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{6,}" maxlength="6" />
										<!-- 										<input requried="requried " class='form-control' -->
										<!-- 											id='id_middle_name' placeholder='Pin Code' type='text'> -->
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>CRF Detail</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:input path="CRFNo" placeholder='CRF Number'
											required="required" class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{3,}" maxlength="16" />
										<!-- 										<input requried="requried " class='form-control' id='gst_no' -->
										<!-- 											placeholder='CRF Number' type='text'> -->
									</div>
								</div>

								<div class='col-md-4 indent-small' style="width: 50.5%;">
									<div class='form-group internal'>
										<%-- 									<form:input path="GSTNo" placeholder='GST Number' --%>
										<%-- 											required="required" class='form-control' /> --%>
										<form:hidden path="CAF_Url" id="caf" />
										<input type="file" name="cafForm" id="cafData"
											required="required" multiple="" size="50" onchange="getURL()"
											class="form-control" placeholder="Upload file">
										<script>
											function getURL(){
										    var x = document.getElementById("cafData");
										    var x1 = document.getElementById("cafData").value;
										    var tmp=x1.split("\\");
										    var filename=tmp[tmp.length-1];
										    document.getElementById('caf').value=filename;
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
										    
										}
											
										function uploadImageLocation(){
											
											 var formData1 = new FormData();
											 var fileInputElement = document.getElementById("myFile1");
											 formData1.append("uploadimage", fileInputElement.files[0]);
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
											 
											 var formData = new FormData();
											 var fileInputElement = document.getElementById("cafData");
											  formData.append("uploadimage", fileInputElement.files[0]);
											   // formData1.append('uploadimage', document.getElementById('uploadimage1')[0].files[0]);
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
											}
										
										</script>
									</div>
								</div>

							</div>
						</div>



						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Connection Detail</label>
							<div class='col-md-8'>
								<div class='col-md-4' style="width: 38%;">
									<div class='form-group internal'>
										<form:select name="addproftype" required="true" path="STBNo"
											class="form-control">
											<form:option value="">Select STB</form:option>
											<form:options items="${STB}" />
										</form:select>
									</div>
								</div>

								<div class='col-md-4 indent-small' style="width: 38%;">
									<div class='form-group internal'>
										<form:input path="GSTNo" placeholder='GST No.' id="pckgCost"
											required="required" class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{4,}" maxlength="16" />
									</div>
								</div>

							</div>
						</div>

						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Package Detail</label>
							<div class='col-md-8'>
								<div class="col-md-5" style="width: 51%;">
									<div class='form-group internal'>
										<form:select name="addproftype" required="true"
											onchange="checkCost(this.value)" path="BasePCKG"
											class="form-control">
											<form:option value="">Select Package</form:option>
											<form:options items="${BASIC}" />
										</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="PCKGPrice" placeholder='Package Cost'
											id='pckgprice' required="required" class='form-control'
											title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{2,}" maxlength="4" />
										<!-- 										<input requried="requried " class='form-control' id='gst_no' -->
										<!-- 											placeholder='Package Cost' type="text "> -->
									</div>
								</div>

							</div>
						</div>


						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_comments'>Add On Packages</label>
							<div class='col-md-6'
								style="width: 51.5%; height: 100px; overflow-y: scroll;">
								<div id="serviceBox">
									<div class="serviceBox1">
										<table id="addonpckg">
											<tr>
												<th>Add On Packages</th>

											</tr>
										</table>
									</div>
									<div class="serviceBox1">
										<table id="alpckg">
											<tr>

												<th>A-La-Carte</th>
											</tr>
										</table>
									</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'>Activation
								Fee</label>
							<div class='col-md-6'>
								<div class='form-group'>
									<div class='col-md-9' style="width: 72%;">
										<form:input path="ActivationCharge"
											placeholder='Activation Charges' required="required"
											class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{2,}" maxlength="4" />
										<!-- 										<input requried="requried " class='form-control' id='address' -->
										<!-- 											placeholder='Activation Charges' type='text'> -->
									</div>
								</div>

							</div>
						</div>
						<div class='form-group' style="margin-left: -200px;">
							<label class='control-label col-md-2 col-md-offset-2'
								for='id_title'>Setup Box Charges</label>
							<div class='col-md-8'>
								<div class='col-md-3'>
									<div class='form-group internal'>
										<form:select path="STB_Rental_Type" class="form-control"
											required="true">
											<form:option value="" label="Select Type" />
											<form:option value="RF" label="Refundable" />
											<form:option value="NRF" label="Non Refundable" />
										</form:select>
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="STB_Full_Rental"
											placeholder='STB Rental Amount' required="required"
											class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{2,}" maxlength="4" />
										<!-- 										<input requried="requried " class='form-control' id='crf_no' -->
										<!-- 											placeholder='STB Rental Amount' type='text'> -->
									</div>
								</div>
								<div class='col-md-3 indent-small'>
									<div class='form-group internal'>
										<form:input path="STB_Monthly_Rental"
											placeholder='STB Monthly Rental Charges' required="required"
											class='form-control' title="MINIMUM SIZE"
											onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											pattern=".{2,}" maxlength="4" />
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
									<!-- 										<button onclick="setvalue()">Cancel</button> -->
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
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js "></script>
	<script src="layout/scripts/jquery.backtotop.js "></script>
	<script src="layout/scripts/jquery.mobilemenu.js "></script>
</body>
</html>
