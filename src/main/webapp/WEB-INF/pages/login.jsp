<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en" data-ng-app="ForEx">
<head>
 <meta charset="UTF-8">
 <title>Frequency</title>
 <!-- Latest compiled and minified CSS & JS -->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" media="screen" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
 <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
 <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>

 <script>
	$(function () {
		$('#datetimepicker1').datetimepicker();
	});
</script>
 
	<style>
	.error {
		padding: 15px;
		margin-bottom: 20px;
		border: 1px solid transparent;
		border-radius: 4px;
		color: #a94442;
		background-color: #f2dede;
		border-color: #ebccd1;
	}
	.msg {
		padding: 15px;
		margin-bottom: 20px;
		border: 1px solid transparent;
		border-radius: 4px;
		color: #a94442;
		background-color: #DFF2BF;
		border-color: #ebccd1;
	}
	</style>
</head>

<body>
 <div class="container">
  <div class="page-header">
    <h1>Frequency<span class="glyphicon glyphicon-stats"></span></h1>
  </div>
 </div>
</body>

	<div id="wrapper" class="container">
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<c:url var="loginUrl" value="/j_spring_security_check" />
		
		<form action="${loginUrl}" method="post" class="form-horizontal">
			<fieldset>
				<h4>Check your finance</h4>

				<div class="form-group">
					<label class="col-md-4 control-label" for="username">Username</label>
					<div class="col-md-4">
						<input id="username" name="username" type="text"
							placeholder="Username" class="form-control input-md" required="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="password">Password</label>
					<div class="col-md-4">
						<input id="password" name="password" 
							placeholder="Password" class="form-control input-md" required="" type="password">
							<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-4">
						<button id="submit" name="submit" class="btn btn-primary">Login</button>
					</div>
				</div>
			</fieldset>
		</form>

 		<form:form class="form-horizontal" id="registration" action="register.htm" method="POST" modelAttribute="User">
			<fieldset>
				<h4>Don't fall back! Register</h4>

				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Email</label>
					<div class="col-md-4">
						<form:input path="email" value="${User.email}" id="email" placeholder="Email" class="form-control input-md" required="required"/>
						<font color="red"><form:errors path="email"/></font>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="username">Username</label>
					<div class="col-md-4">
						<form:input path="username" value="${User.username}" id="username" placeholder="Username" class="form-control input-md" required="required"/>
						<font color="red"><form:errors path="username"/></font>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Password</label>
					<div class="col-md-4">
						<form:input path="password" value="${User.password}" id="password" type="password" placeholder="Password" class="form-control input-md" required="required"/>
						<font color="red"><form:errors path="password"/></font>
					</div>
				</div>

				<div class="form-group">
				   <label class="col-md-4 control-label" for="dateOfBirth">Date of birth</label>
					<div class="col-xs-4 date">
						<div class="input-group input-append date" id='datetimepicker1'>
							<form:input path="dateOfBirth" class="form-control" value="${User.dateOfBirth}" placeholder="Date of birth"/>
							<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<font color="red"><form:errors path="dateOfBirth"/></font>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="street">Street</label>
					<div class="col-md-4">
						<form:input id="street" path="street" value="${User.street}" placeholder="Street" class="form-control input-md" required="required"/>
						<font color="red"><form:errors path="street"/></font>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="city">City</label>
					<div class="col-md-4">
						<form:input id="city" path="city" value="${User.city}" placeholder="City" class="form-control input-md" required="required"/>
						<font color="red"><form:errors path="city"/></font>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="zipCode">Zip Code</label>
					<div class="col-md-4">
						<form:input id="zipCode" path="zipCode" value="${User.zipCode}" placeholder="Zip Code" class="form-control input-md" required="required"/>
						<font color="red"><form:errors path="zipCode"/></font>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="country">Country</label>
					<div class="col-md-4">
						<form:select path="country" class="form-control">
							<form:options items="${countries}" value="${User.country}" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-4">
						<button id="submit" name="submit" class="btn btn-primary">Create account</button>
					</div>
				</div>
			</fieldset>
		</form:form>
	</div>
</body>
</html>
