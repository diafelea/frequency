<!DOCTYPE html>
<html lang="en" data-ng-app="ForEx">
<head>
<meta charset="UTF-8">
<title>Currency Converter in Angular</title>
<!-- Latest compiled and minified CSS & JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>Frequency</h1>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.30/angular.min.js"></script>
</body>

<div class="row">
	<div class="col-xs-5 col-sm-5 col-md-5 col-md-offset-3">
		<div class="panel panel-default" data-ng-controller="ConvertCtrl">
			<div class="panel-body">
				<form action="" method="POST" role="form">
					<legend>Currency Converter</legend>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for="">From</label> <select ng-model="fromType"
								class="form-control" required data-ng-change="forExConvert()"
								ng-options="k for (k, v) in rates track by v">
								<option value="">--Select--</option>
							</select>

						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for="">To</label> <select ng-model="toType"
								class="form-control" required data-ng-change="forExConvert()"
								ng-options="k for (k, v) in rates track by v">
								<option value="">--Select--</option>
							</select>
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for="">From Value</label> <input type="number"
								class="form-control" placeholder="Enter value"
								data-ng-model="fromValue" data-ng-change="forExConvert()">
						</div>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for="">To Value</label> <input type="text"
								class="form-control" placeholder="Enter value"
								data-ng-model="toValue" data-ng-change="forExConvert()">
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>

<script>
	angular.module('ForEx', []).controller(
			'ConvertCtrl',
			[
					'$scope',
					'$http',
					function($scope, $http) {
						var base = this;
						$scope.rates = {};
						$http.get('http://api.fixer.io/latest?base=ZAR').then(
								function(res) {
									$scope.rates = res.data.rates;
									$scope.toType = $scope.rates.INR;
									$scope.fromType = $scope.rates.USD;
									$scope.fromValue = 1;
									$scope.forExConvert();
								});
						$scope.forExConvert = function() {
							$scope.toValue = $scope.fromValue
									* ($scope.toType * (1 / $scope.fromType));
							$scope.toValue = $scope.toValue;
						};
					} ]);
</script>

</html>


<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" />
<!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800|Open+Sans+Condensed:300,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
	 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.30/angular.min.js"></script>
 <script type="text/javascript" src="C:\personal\projects\bitbucket\frequency\src\main\webapp\app\app.js"></script>
</head>
<body>
<div id="logo" class="container">
	<h1><span class="icon icon-lock icon-size"></span><a href="#">Freq<span>uency</span></a></h1>
	<p>Your personal financial <a href="http://templated.co" rel="nofollow">CONSULTANT</a></p>
</div>
<div id="wrapper" class="container">
	<div id="menu" class="container">
		<ul>
			<li><a href="#" accesskey="1" title="">Homepage</a></li>
			<li class="current_page_item"><a href="#" accesskey="1" title="">Currency Converter</a></li>
			<li><a href="#" accesskey="2" title="">Trends</a></li>
			<li><a href="#" accesskey="3" title="">Solutions for Business</a></li>
			<li><a href="#" accesskey="4" title="">Resources</a></li>
			<li><a href="#" accesskey="5" title="">Contact Us</a></li>
		</ul>
	</div>
	
	
</div>

 <div class="container">
  <div class="page-header">
    <h1>NG ForEx</h1>
  </div>
 </div>


<div class="row">
<div class="col-xs-5 col-sm-5 col-md-5 col-md-offset-3">
 <div class="panel panel-default" data-ng-controller="ConvertCtrl">
  <div class="panel-body">
     <form action="" method="POST" role="form">
      <legend>Currency Converter</legend>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
       <div class="form-group">
        <label for="">From</label>
         <select 
          ng-model="fromType" 
          class="form-control"  
          required  
          data-ng-change="forExConvert()"
          ng-options="k for (k, v) in rates track by v">
          <option value="">--Select--</option>
         </select>
          
       </div> 
      </div>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
       <div class="form-group">
        <label for="">To</label>
        <select 
          ng-model="toType" 
          class="form-control"  
          required  
          data-ng-change="forExConvert()"
          ng-options="k for (k, v) in rates track by v">
          <option value="">--Select--</option>
         </select>
       </div> 
      </div>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
       <div class="form-group">
        <label for="">From Value</label>
        <input type="number" 
        class="form-control"  
        placeholder="Enter value" 
        data-ng-model="fromValue"
        data-ng-change="forExConvert()">
       </div> 
      </div>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
       <div class="form-group">
        <label for="">To Value</label>
        <input type="text" 
        class="form-control"  
        placeholder="Enter value" 
        data-ng-model="toValue"
        data-ng-change="forExConvert()">
       </div> 
      </div>
      
     </form>
  </div>
 </div> 
</div>
</div>
	

<div id="copyright">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
</body>
</html>
 --%>