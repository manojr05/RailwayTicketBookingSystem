<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
</head>
<body>

	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>
	
	<h1>Welcome to Railways</h1>
	<h3>Wallet: ${user.getInr() }</h3>
	<a href="loadAddMoneyPage"><button>Add Money</button></a><br>
	<a href="loadViewAllTrainBookingPage"><button>Book Train</button></a><br>
	<a href="logoutUser"><button>Logout</button></a>
</body>
</html>