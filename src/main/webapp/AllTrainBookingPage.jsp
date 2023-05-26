<%@page import="java.util.ArrayList"%>
<%@page import="com.train.repository.Train"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<h2>Available Train's</h2>
	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>

	<%ArrayList<Train> list=(ArrayList<Train>)request.getAttribute("list"); %>
	
	<table border="1">
		<tr>
			<th>Train Number</th>
			<th>Train Name</th>
			<th>Available Seats</th>
			<th>From Station</th>
			<th>To Station</th>
			<th>Time of Departure</th>
			<th>Time of Arraival</th>
			<th>Available Days</th>
			<th>Book Train</th>
		</tr>

		<%for(Train a:list){ %>
			<tr>
				<td><%=a.getTrainId() %></td>
				<td><%=a.getTrainName() %></td>
				<td><%=a.getTotalSeats() %></td>
				<td><%=a.getStations()[0] %></td>
				<td><%=a.getStations()[a.getStations().length-1] %></td>
				<td><%=a.getTime()[0] %></td>
				<td><%=a.getTime()[a.getTime().length-1] %></td>
				<td><%=Arrays.toString(a.getDays()) %></td>
				<td><a href="loadBookTrainForm?id=<%=a.getTrainId()%>"><button>Book</button></a></td>
			</tr>
		<%}%>
	</table>
	
	<br>
	<a><button onclick="window.location.href='loadUserMainPageOnCancel'">Back</button></a>
</body>
</html>