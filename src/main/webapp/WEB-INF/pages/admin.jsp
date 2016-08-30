<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="resources/css/messagedivs.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="resources/jquery.slidertron-1.1.js"></script>

<%@page session="true"%>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
<style>
	.msg {
		padding: 15px;
		margin-bottom: 20px;
		border: 1px solid transparent;
		border-radius: 4px;
		color: #31708f;
		background-color: #d9edf7;
		border-color: #bce8f1;
	}
	 
	#login-box {
		width: 300px;
		padding: 20px;
		margin: 100px auto;
		background: #d9edf7;
		-webkit-border-radius: 2px;
		-moz-border-radius: 2px;
		border: 0px solid #000;
	}
</style>
</head>
<body>
	<div id="page">
		<div id="content">
			<div class="box">
				<div id="login-box">	 
					<c:url value="/j_spring_security_logout" var="logoutUrl" />
					<!-- csrt for log out-->
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
		<div id="sidebar">
			<div class="box">
				<h4><spring:message code="eq.calcualtors" /></h4>
				<ul class="list">
					<li class="first"><a href="../equilibrium/bmi.htm"><spring:message code="eq.bmi" /></a></li>
					<li class="last"><a href="../equilibrium/calculatorHeartRate.htm"><spring:message code="eq.heartRate" /></a></li>
					<li class="last"><a href="../equilibrium/idealWeight.htm"><spring:message code="eq.idealWeight" /></a></li>
					<li class="last"><a href="../equilibrium/caloriesBurned.htm"><spring:message code="eq.caloriesBurned" /></a></li>
					<li class="last"><a href="../equilibrium/weightConverter.htm">Weight Converter</a></li>
				</ul>
			</div>
		</div>
		<br class="clearfix" />
	</div>
</body>
</html>