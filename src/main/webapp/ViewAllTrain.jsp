<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Train's</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
    th, td {
      border: 1px solid black;
      padding: 8px;
    }
    td,th {
      text-align: center;
    }
  </style>
</head>
<body>
	
	<h2>All Train's</h2>
	<h1>${message }</h1>
	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>

	<table border="1">
		<tr>
			<th>Train Number</th>
			<th>Train Name</th>
			<th>Total Seats</th>
			<th>Stations</th>
			<th>Prices</th>
			<th>Timings</th>
			<th>Days</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		
		<x:forEach var="a" items="${list}">
			<tr>
				<td>${a.getTrainId() }</td>
				<td>${a.getTrainName() }</td>
				<td>${a.getTotalSeats() }</td>
				<td>${Arrays.toString(a.getStations()) }</td>
				<td>${Arrays.toString(a.getPrices()) }</td>
				<td>${Arrays.toString(a.getTime()) }</td>
				<td>${Arrays.toString(a.getDays()) }</td>
				<td><a href="loadEditTrain?id=${a.getTrainId()}"><button>Edit</button></a></td>
				<td><a href="deleteTrain?id=${a.getTrainId()}"><button>Delete</button></a></td>
			</tr>
		</x:forEach>
	</table>
	<br>
	<a href="loadAdminMainPageOnBack"><button type="submit">Home</button></a>
</body>
</html>