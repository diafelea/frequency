<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" />
<!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800|Open+Sans+Condensed:300,700" rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<div id="logo" class="container">
	<h1><span class="icon icon-lock icon-size"></span><a href="#">Freq<span>uency</span></a></h1>
	<p>Your personal financial <a href="http://templated.co" rel="nofollow">CONSULTANT</a></p>
	
</div>

<div class="container row-fluid" id="wrapper">
	<ul id="menu">
		<li class="current_page_item"><a href="#" accesskey="1" title="">Welcome</a></li>
	</ul>
	
	
<c:url var="loginUrl" value="/login" />
<form action="${loginUrl}" method="post" class="form-horizontal" >
<fieldset>

<!-- Form Name -->
<h2>Check your finance</h2>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="username">Username</label>  
  <div class="col-md-4">
  <input id="username" name="username" type="text" placeholder="Username" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="password">Password</label>  
  <div class="col-md-4">
  <input id="password" name="password" type="text" placeholder="Password" class="form-control input-md" required="">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <a href="#" onclick="$(this).closest('form').submit()" class="button">Login</a>
    <!--<button id="submit" name="submit" class="btn btn-primary">SUBMIT</button>-->
  </div>
</div>

</fieldset>
</form>

	
	
	
	<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<h2>New? Register</h2>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fn">Email</label>  
  <div class="col-md-4">
  <input id="fn" name="fn" type="text" placeholder="Email" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ln">Date of birth</label>  
  <div class="col-md-4">
  <input id="ln" name="ln" type="text" placeholder="Date of birth" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="cmpny">Street</label>  
  <div class="col-md-4">
  <input id="cmpny" name="cmpny" type="text" placeholder="Street" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="city">City</label>  
  <div class="col-md-4">
  <input id="city" name="city" type="text" placeholder="city" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="zip">Zip Code</label>  
  <div class="col-md-4">
  <input id="zip" name="zip" type="text" placeholder="Zip Code" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ctry">Country</label>  
  <div class="col-md-4">
  <input id="ctry" name="ctry" type="text" placeholder="Country" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <a href="#" class="button">Create account</a>
    <!--<button id="submit" name="submit" class="btn btn-primary">SUBMIT</button>-->
  </div>
</div>

</fieldset>
</form>

   


</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>
</body>
</html>
