<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" media="screen" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
 <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
 <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>

<%@page session="true"%>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}

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
	color: #088A29;
	background-color: #f2dede;
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

<sec:authentication var="user" property="principal" />
<sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
	<div class="row">
		<div class="col-xs-5 col-sm-5 col-md-5 col-md-offset-3">
		 <div class="panel panel-default" data-ng-controller="ConvertCtrl">
		  <div class="panel-body">
			 <div id="content">
					<div class="box">
						<div id="login-box">	 
						    <c:if test="${not empty error}">
								<div class="error">${error}</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="msg">${msg}</div>
							</c:if>
							<c:url value="/j_spring_security_logout" var="logoutUrl" />
							
							<form action="${logoutUrl}" method="post" id="logoutForm">
							  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<h5>
									Welcome : ${pageContext.request.userPrincipal.name} | <a href="javascript:formSubmit()"> Logout</a>
								</h5>
							</c:if>
						</div>	
					</div>
					<br class="clearfix" />
				</div>
			 
		  <form:form id="currencyConverter" action="convert.htm" method="POST" modelAttribute="CurrencyConverter">
		     <form:hidden path="id" />
			 <c:set var="now" value="<%=new java.util.Date()%>" />
		      <legend>Currency Converter</legend>
		      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		      
		       <div class="form-group">
		        <label for="">Currency I Have:</label>
				<form:select path="fromCurrency" class="form-control">
				    <option selected>EUR</option>
					<form:options items="${currencies}" value="${CurrencyConverter.fromCurrency}" />
				</form:select>
		       </div> 
		      </div>
		      
		      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		       <div class="form-group">
		        <label for="">Currency I Want:</label>
		        <form:select path="toCurrency" class="form-control">
					<option selected>USD</option>
					<form:options items="${currencies}" value="${CurrencyConverter.toCurrency}"/>
				</form:select>
		       </div> 
		      </div>
		      
		      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		       <div class="form-group">
		       		<label for="">Amount:</label>
					<form:input path="amountToConvert" value="${CurrencyConverter.amountToConvert}" class="form-control" placeholder="I have this much to change" required="required" id="btngrp-search1" />
		       		<font color="red"><form:errors path="amountToConvert"/></font>
		       </div> 
		      </div>
		      
		      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		       <div class="form-group">
		       		<label for="">Amount:</label>
		        	<form:input path="convertedAmount" value="${CurrencyConverter.convertedAmount}" class="form-control" placeholder="I want to buy smth at this price" id="btngrp-search1" />
		       		<font color="red"><form:errors path="convertedAmount"/></font>
		       </div> 
		      </div>
			  
			  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			  </div>
			  
			  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			   <div class="form-group">
			     <label for="">Date:</label>
		                <div class='input-group date' id='datetimepicker1'>
		                    <form:input path="date" class="form-control" value="${CurrencyConverter.date}"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
		            </div>
			   </div> 
			   
			  <div>
			   <div class="form-group">
				<button id="submit" name="submit" class="btn btn-primary">Convert</button>
				</div>
			  </div> 
		     </form:form>
			
			<div id="content">
				<legend>History</legend>
				<div class="col-md-12" >
			 
				<table class="table table-hover">
					<thead>
						<tr>
				       		<th>From currency</th>
				       		<th>To currency</th>
				       		<th>Amount</th>
				       		<th>Result</th>
				       		<th>Date</th>
						</tr>
				   </thead>
				   <tbody>
				   	  <c:forEach var="result" items="${results}" varStatus="counter">
						  <tr>
							 <td>${result.fromCurrency}</td>
							 <td>${result.toCurrency}</td>
							 <td>${result.amountToConvert}</td>
							 <td>${result.convertedAmount}</td>
							 <td>${result.date}</td>
						  </tr>
					  </c:forEach>
					</tbody>
			     </table>
			  </div>
			</div>
		</div>
	 </div> 
   </div>
</div>
</sec:authorize>
</html>