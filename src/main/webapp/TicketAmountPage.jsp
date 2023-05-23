<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>

	<h1>Total Amount is: ${ticket.getAmount() }</h1>
	<a href="bookTicket"><button>Book Ticket</button></a>
</body>
</html>