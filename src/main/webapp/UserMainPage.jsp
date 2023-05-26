<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>

	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>
	
	<h1>Welcome to Railways</h1>
	<h3>Wallet: ${user.getInr() }</h3>
	<a href="loadAddMoneyPage"><button>Add Money</button></a><br>
	<a href="loadShowAllTicketPage"><button>Show My Tickets</button></a><br>
	<a href="loadViewAllTrainBookingPage"><button>Show Available Trains</button></a><br>
	<a href="loadSearchTrainByIdPage"><button>Search Train By Train Number</button></a><br>
	<a href="logoutUser"><button>Logout</button></a>
</body>
</html>