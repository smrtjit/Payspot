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

<style>
select {
	/*    margin: 50px; */
	margin-bottom: 10px;
	border: 1px solid #111;
	background: transparent;
	width: 150px;
	padding: 5px 25px 5px 5px;
	font-size: 13px;
	border: 1px solid #ccc;
	height: 30px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: url(http://www.stackoverflow.com/favicon.ico) 96%/15%
		no-repeat #eee;
	border: 1px solid #111;
}
/*target Internet Explorer 9 and Internet Explorer 10:*/
@media screen and (min-width:0\0) {
	select {
		background: none;
		padding: 5px;
	}
}

.nofound {
	color: red;
	font-size: 3ex;
	margin-left: 350px;
	widows: 100%;
}

/* ////////////////////////////////////////////////////////////////////////////////////// */
.v-center {
	height: 100vh;
	width: 100%;
	display: table;
	position: relative;
	text-align: center;
}

.v-center>div {
	display: table-cell;
	vertical-align: middle;
	position: relative;
	top: -10%;
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

/* @media ( min-width : 32em) { */
/* 	.modal-box { */
/* 		width: 30%; */
/* 	} */
/* } */
.v-center {
	height: 100vh;
	width: 100%;
	display: table;
	position: relative;
	text-align: center;
}

.v-center>div {
	display: table-cell;
	vertical-align: middle;
	position: relative;
	top: -10%;
}

.btn:hover {
	background-color: #ddd;
	-webkit-transition: background-color 1s ease;
	-moz-transition: background-color 1s ease;
	transition: background-color 1s ease;
}

.btn-small {
	padding: .75em 1em;
	font-size: 0.8em;
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
		width: 40%;
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

.modal-box .modal-body {
	padding: 2em 1.5em;
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
<script type="text/javascript">
	$(document).ready(function() {
		$('.multiselect').multiselect();
		$('.datepicker').datepicker();
	});
</script>
<script>
var  pckgid=null;
				$(function(){

					var appendthis =  ("<div class='modal-overlay js-modal-close'></div>");

						$('a[data-modal-id]').click(function(e) {
							var url = $(this).attr('value');
// 							document.getElementById("demo").innerHTML ="Complaint Number: "+url;
							 
							 var fields = url.split('#');
							 var packname =  fields[0];;
							 var pak_type = fields[1];
							 var  no_of_channel= fields[2];
							 var  pak_price= fields[3];
							   pckgid= fields[4];
							 $.ajax({  
						            type : 'GET', 
						            url: 'getChannelList.html',
					         data: {
						            	
						            	"user":  ${user},
						            	"pckgId": pckgid,
						            	
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
					  			            tr.append("<td>" + json[i] + "</td>");
					  			            tr.append("<td> <input type='button' value='Remove' onclick='deleteRowTable(this)'/> </td>");
					  			            $('#chnListTable').append(tr);
					  			        }
					  			   
					  			 
					            },
							         error: function(e){
							     }
							 });
							
							document.getElementById('pkgname').innerHTML=packname;
							document.getElementById('pkgprice').value=pak_price;
									
													
							
						e.preventDefault();
  						  $("body").append(appendthis);
   						 $(".modal-overlay").fadeTo(500, 0.7);
   						 //$(".js-modalbox").fadeIn(500);
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
				
				
				function deleteRowTable(r) {
				    var i = r.parentNode.parentNode.rowIndex;
				    document.getElementById("chnListTable").deleteRow(i);
				}
				
				
				function addRowTable(data){
					var flag="true";
					$('#chnListTable tr td:nth-child(1)').each( function() {
					       // alert($(this).text());
					        if($(this).text()==data){
					        	flag="false";
					        }
					    });
					//alert(data+","+flag);
					if(flag=="true"){
					tr = $('<tr/>');
			            tr.append("<td>" + data + "</td>");
			            tr.append("<td> <input type='button' value='Remove' onclick='deleteRowTable(this)'/> </td>");
			            $('#chnListTable').append(tr);
				}else{
					alert("This Channel is Already Present in The Package List");
				}
				}
				
				
				
				function updatePackage(){
					var flag="false";
				    var allChn="";
					$('#chnListTable tr td:nth-child(1)').each( function() {
					        //alert($(this).text());
					        allChn=allChn+ $(this).text()+",";
					    });
						var tmp = allChn.split(",");
						 //alert("tmp: "+tmp);
						 var fList="";
						 for (i = 0; i < tmp.length; i++) {
							 fList= fList+tmp[i]+",";
							}
						 
						 fList=fList.substring(0,fList.length-2);
						 
					//var id=document.getElementById("pkgname").getAttribute('value');;
					var price=document.getElementById("pkgprice").value;
					
					 if(price==""){
						alert("please Provide the Package Price");
					}else if(fList==""){
						alert("The Channel List must contain minimum 1 Channle");
					}else{
						flag="true";
					}
					 if(flag=="true"){
						 //alert("id: "+pckgid+","+price+"flag: "+flag);
						 $.ajax({  
					            type : 'GET', 
					            url: 'updatePckg.html',
				         data: {
					            	
					            	"user":  ${user},
					            	"pckg": pckgid,
					            	"price": price,
					            	"chnlist": fList
				         },
					            dataType: 'json',
					       		cache: false,
								beforeSend: function(xhr) 
				         {
				                   xhr.setRequestHeader("Accept", "application/json");  
				               xhr.setRequestHeader("Content-Type", "application/json");  
				             },
				  			success: function (data) {
				  			   alert(data);
				  			 location.reload();
				            },
						         error: function(e){
						     }
						 });
					 }
					
				}
				</script>

<!-- ##########################################For Dynamic Table############################################################################ -->
<SCRIPT language="javascript">
	function addRow(tableID,valData) {
		if(valData=="NONE"){
			alert("Please Select the Channel from the List");
		}else{
			var flag="true";
			$('#dataTable tr td:nth-child(3)').each( function() {
			       // alert($(this).text());
			        if($(this).text()==valData){
			        	flag="false";
			        }
			    });
			if(flag=="true"){
				var table = document.getElementById(tableID);

				var rowCount = table.rows.length;
				var row = table.insertRow(rowCount);

				var cell1 = row.insertCell(0);
				var element1 = document.createElement("input");
				
				element1.type = "checkbox";
				element1.name = "chkbox[]";
				cell1.appendChild(element1);

				var cell2 = row.insertCell(1);
				cell2.innerHTML = rowCount + 1;

				var cell3 = row.insertCell(2);
				var divTag = document.createElement("div"); 
				divTag.innerHTML = valData;
//		 		var element2 = document.createElement("input");
//		 		element2.type = "text";
//		 		element2.setAttribute("value", valData);
//		 		element2.name = "txtbox[]";
				cell3.appendChild(divTag);
			}else{
				alert("This Channel is Already in List!!!")
			}
			
		}
		

	}

	function deleteRow(tableID) {
		//alert("hello");
		try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for (var i = 0; i < rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if (null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}

			}
		} catch (e) {
			alert(e);
		}
	}
	
	function SubmitAllData(){
		var allChn="";
// 		$("#dataTable tr").each(function( i ) {
// 			allChn=allChn+ $(this).text()+",";
// 			 // alert("".concat("row: ", i, ", col: ", 3, ", value: ", $(this).text()));
// 			});
		
		$('#dataTable tr td:nth-child(3)').each( function() {
	       // alert($(this).text());
	        allChn=allChn+ $(this).text()+",";
	    });
		 var res = allChn.split(",");
		 var tmp=res.splice(1, res.length);
		 var fList="";
		 for (i = 0; i < tmp.length; i++) {
			 fList= fList+tmp[i]+",";
			}
		 fList=fList.substring(0,fList.length-2);
		// alert("fList:: "+fList);
		 var e = document.getElementById("type");
		 var ty = e.options[e.selectedIndex].value;
		 var chn=document.getElementById('name').value;
		 var price=document.getElementById('cost').value
		 var flag="false";
		 if(ty=="Select Type"){
			 alert("Please Select the Type First!!!");
		 }else{
			 if(chn==""){
				 alert("Please Enter the Package Name!!!");
			 }else{
				 if(price==""){
					 alert("Please Enter the Package Price!!!");
				 }else{
					 if (!(/^[0-9]{1,10}$/.test(+price))) {
							alert("The Price must be Numeric");
							
						}else{
							if(fList==""){
								 alert("Please Select the Channel List for New Package!!!"); 
							 }else{
								 flag="true";
							 }
						}
					 
				 }
			 }
		 }
		 if(flag=="true"){
			 $.ajax({  
		            type : 'GET', 
		            url: 'addNewPckg.html',
	         data: {
		            	
		            	"user":  ${user},
		            	"pckg": chn,
		            	"type":ty,
		            	"price": price,
		            	"chnlist": fList
	         },
		            dataType: 'json',
		       		cache: false,
					beforeSend: function(xhr) 
	         {
	                   xhr.setRequestHeader("Accept", "application/json");  
	               xhr.setRequestHeader("Content-Type", "application/json");  
	             },
	  			success: function (data) {
	  			   alert(data);
	  			 location.reload();
	            },
			         error: function(e){
			     }
			 });
		 }
		

	}
</SCRIPT>
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
	<div class="wrapper row3">
		<main class="hoc container clear">
		<nav id="mainav1">
			<ul class="clear">

				<li class="fl_right"><button type="button"
						class="btn-lg btn-primary" data-toggle="modal"
						data-target="#channelmodel" style="padding: 4px 8px;">Add
						New Package</button></li>
				<li class="fl_left">
					<h4>The Total Numbers of Channels are: ${count}</h4>
				</li>

				<div class="modal fade" id="channelmodel" role="dialog">
					<div class="modal-dialog modal-lg" style="margin-top: 170px;">
						<div class="modal-content" style="margin: -124px;">
							<div class="modal-header"
								style="background-color: #3eb3b3; color: white;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add New Package</h4>
							</div>
							<div class="modal-body"
								style="margin: 70px; margin-top: 120px; margin-bottom: -29px;">
								<form:form method="get" modelAttribute="PckgInfo">
									<div class="first-column">
										<!-- Your first column here -->


										<div class="form-group"
											style="margin-left: -207px; margin-top: -120px;">
											<label class="control-label col-md-2 col-md-offset-2">Package
												Type</label>
											<div class="col-md-4">
												<div class="col-md-10">
													<div class="form-group internal">
														<form:select path="PckgType" class="form-control"
															id="type">
															<form:options items="${type}" />
														</form:select>

													</div>
												</div>
											</div>
										</div>
										<div class="form-group" style="margin-left: -208px;">
											<label class="control-label col-md-2 col-md-offset-2"
												for="id_title">Package Name</label>
											<div class="col-md-4">
												<div class="col-md-10">
													<div class="form-group internal">
														<input requried="requried " class="form-control" id="name"
															placeholder="Package Name" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="form-group" style="margin-left: -209px;">
											<label class="control-label col-md-2 col-md-offset-2"
												for="id_title">Package Price</label>
											<div class="col-md-4">
												<div class="col-md-10">
													<div class="form-group internal">
														<input requried="requried " class="form-control" id="cost"
															placeholder="Package Price" type="text">
													</div>
												</div>
											</div>
										</div>
										<div class="form-group" style="margin-left: -210px;">
											<label class="control-label col-md-2 col-md-offset-2"
												for="id_title">Channel</label>
											<div class="col-md-4">
												<div class="col-md-10">
													<div class="form-group internal">
														<form:select path="NoOfChannels" class="form-control"
															onchange="addRow('dataTable',this.value);">
															<form:option value="NONE" label="Select Channel" />
															<form:options items="${ChnList}" />
														</form:select>
													</div>
												</div>
											</div>
										</div>
								</form:form>
							</div>

							<div class="second-column">
								<div class="verticalLine" style="margin-left: 800px;">
									<div class="form-group"
										style="margin-left: 45px; margin-right: -65px; margin-top: -200px; overflow: scroll; height: 220px;">

										<button onclick="deleteRow('dataTable')" class="btn"
											style="margin-bottom: 10px;">Delete Row</button>

										<TABLE id="dataTable">
											<TR>
												<TD style="width: 10%">Select</TD>
												<TD style="width: 10%">1</TD>
												<TD>Channel Name</TD>

											</TR>
										</TABLE>


									</div>
								</div>

							</div>
							<input type="button" value="Submit" class="form-control"
								style="width: 40%; background-color: darkgray; color: white; margin-left: 7%;"
								onclick="SubmitAllData();">

						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
	</div>


	</ul>
	</nav>
	<hr>
	<table>
		<thead>
			<tr>
				<th
					style="text-align: center; width: 8%; color: #FFFFFF; background-color: #12a59c;">SNo.</th>
				<th
					style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Name</th>
				<th
					style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Package
					Type</th>
				<th
					style="text-align: center; color: #FFFFFF; background-color: #12a59c;">No.
					of Channels</th>
				<th
					style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Package
					Price</th>
				<th
					style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Edit</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${PckgList}" var="list" varStatus="itr">

				<tr>
					<td style="text-align: center;">${offset + itr.index +1 }</td>
					<td style="text-align: center;"><a href="#"
						value="${list.pckgName}#${list.pckgType}#${list.noOfChannels}#${list.price}#${list.pckgID}"
						data-modal-id="popup2">${list.pckgName}</a></td>
					<td style="text-align: center;">${list.pckgType}</td>
					<td style="text-align: center;">${list.noOfChannels}</td>
					<td style="text-align: center;">${list.price}</td>

					<td style="text-align: center;"><button
							onclick="deletefunction('${list.pckgID}');" class="btn">Delete</button></td>

				</tr>

			</c:forEach>


		</tbody>
	</table>
	<!-- 	Popup Model -->

	<div id="popup2" class="modal-box">
		<header style="background-color: #3eb3b3;">
			<a href="#" class="js-modal-close close">×</a>
			<h3 id="pkgname" />


		</header>
	

			<div class="container" style="margin-bottom: -95px;margin-top: 30px;">
<div class="form-inline marginBottom" style="margin-top: -98px;">
					<div class="md-form" style="margin-bottom: 20px;">
						<label for="form1" class="" style="color: black;">Package
							Price:</label> <input type="text" style="width: 70%; margin-left: 4%"
							id="pkgprice" class="form-control input1">

					</div>
				</div>
				<div class="form-inline marginBottom">
					<form:form method="get" modelAttribute="PckgInfo">
						<div class="md-form" style="margin-bottom: 20px;">
							<label for="form1" class="" style="color: black;">Add
								Channel </label>
							<form:select path="NoOfChannels"
								style="width: 70%; margin-left: 6%" id="pkgprice"
								onchange="addRowTable(this.value);" class="form-control input1">
								<form:option value="NONE" label="Select Channel" />
								<form:options items="${ChnList}" />
							</form:select>
						</div>
					</form:form>
				</div>
				<div style='overflow: scroll; height: 170px;'>
					<table style="width: 94%" id="chnListTable">
						<thead>
							<tr>
								<th
									style="text-align: center; width: 80%; color: #FFFFFF; background-color: #12a59c;">Channel
									Name</th>
								<th
									style="text-align: center; color: #FFFFFF; background-color: #12a59c;">Remove</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<script>
								$("#submit").click( function() {
									var pkname = $("#pkgname").text();
								    var msprice = $("#msoprice").val();
								    var lcprice = $("#lcoprice").val();
								    var channel_id = $("#chnlid").val();
								   	var st =  $('select[name=selector]').val();
								   
								    $.ajax({  
							            type : 'GET', 
							            url: 'updateChannel.html',
							            data: {
							            	'pkgname': pkname,
							            	'msoprice': msprice,
							            	'lcoprice': lcprice,
							            	'chnl_id': channel_id,
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
							         					 alert(data);
							         					location.reload();
						           						
								          		    },
										            error: function(e){
										            	console.warn(e);
										            	 alert(e);
										            }
							            
							      		  });
								   
								});
								
									 	 
						  </script>


			</div>

		<button onclick="updatePackage();" class="btn" style="margin-left: 43%; margin-bottom: 18px;">Update</button>
	</div>



	<!-- < Popup Model End -->
	<script type="text/javascript">
		function deletefunction(id){
			var r = confirm("Do you Really want to Delete the Package from the Database!");
		    if (r == true){

				  $.ajax({  
			            type : 'GET', 
			            url: 'deletePackage.html',
			            data: {
			            	'pak_id': id,
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
			         					 alert(data);
			         					location.reload();
		           						
				          		    },
						            error: function(e){
						            	console.warn(e);
						            	 alert(e);
						            }
			            
			      		  });
		    }else{
		    	
		    }
			   
			
		}		 
		
		
		</script>
	<tag:paginate max="15" offset="${offset}" count="${count}"
		uri="newPackage.html?user=${user}" next="&raquo;" previous="&laquo;" />
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
	<a id="backtotop " href="#top "><i class="fa fa-chevron-up "></i></a>
	<!-- JAVASCRIPTS -->
	<script src="layout/scripts/jquery.min.js "></script>
	<script src="layout/scripts/jquery.backtotop.js "></script>
	<script src="layout/scripts/jquery.mobilemenu.js "></script>
</body>
</html>
