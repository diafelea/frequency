<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</style>

</head>
<body>
 <div class="container">
  <div class="page-header">
    <h1>Frequency</h1>
  </div>
 </div>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.30/angular.min.js"></script>
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

				<!-- Form Name -->
				<h4>Check your finance</h4>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="username">Username</label>
					<div class="col-md-4">
						<input id="username" name="username" type="text"
							placeholder="Username" class="form-control input-md" required="">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">Password</label>
					<div class="col-md-4">
						<input id="password" name="password" 
							placeholder="Password" class="form-control input-md" required="" type="password">
							<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-4">
						<button id="submit" name="submit" class="btn btn-primary">Login</button>
					</div>
				</div>

			</fieldset>
		</form>



 <form:form class="form-horizontal" id="registration" action="register.htm" method="POST" modelAttribute="User">
<form:hidden path="username" />
			<fieldset>

				<!-- Form Name -->
				<h4>Don't fall back! Register</h4>

				<!-- Email-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Email</label>
					<div class="col-md-4">
						<form:input path="email" value="${User.email}" id="email" name="email" type="text" placeholder="Email"
							class="form-control input-md" required="required"/>
					</div>
					<form:errors path="email" element="div"/>
				</div>
				
				<!-- Username-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="username">Username</label>
					<div class="col-md-4">
						<form:input path="username" value="${User.username}" id="username" name="username" type="text" placeholder="Username"
							class="form-control input-md" required="required"/>
					</div>
					<form:errors path="username" element="div"/>
				</div>
				
				<!-- Password-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Password</label>
					<div class="col-md-4">
						<form:input path="password" value="${User.password}" id="password" name="password" type="password" placeholder="Password"
							class="form-control input-md" required="required"/>
					</div>
					<form:errors path="password" element="div"/>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="ln">Date of
						birth</label>
					<div class="col-md-4">
						<input id="ln" name="ln" type="text" placeholder="Date of birth"
							class="form-control input-md" required="required">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="street">Street</label>
					<div class="col-md-4">
						<form:input id="street" path="street" value="${User.street}" name="street" type="text" placeholder="Street"
							class="form-control input-md" required="required"/>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="city">City</label>
					<div class="col-md-4">
						<form:input id="city" path="city" value="${User.city}" name="city" type="text" placeholder="City"
							class="form-control input-md" required="required"/>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="zipCode">Zip Code</label>
					<div class="col-md-4">
						<form:input id="zipCode" path="zipCode" value="${User.zipCode}" name="zipCode" type="text" placeholder="Zip Code"
							class="form-control input-md" required="required"/>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="country">Country</label>
					<div class="col-md-4">
						<form:input id="country" path="country" value="${User.country}" name="country" type="text" placeholder="Country"
							class="form-control input-md" required="required"/>
					</div>
				</div>

				<!-- Button -->
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
