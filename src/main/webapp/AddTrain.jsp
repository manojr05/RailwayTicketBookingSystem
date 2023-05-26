<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<h2>Add Train</h2>
	<spring:form method="post" modelAttribute="train" action="addTrain">
		<table>
	        <tr>
	            <td><label for="trainId">Train Number:</label></td>
	            <td><input type="number" name="trainId" placeholder="enter train number"></td>
	        </tr>
	        <tr>
	            <td><label for="trainName">Train Name:</label></td>
	            <td><input type="text" name="trainName" placeholder="enter train name" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="totalSeats">Total Seats:</label></td>
	            <td><input type="number" name="totalSeats" placeholder="enter total available seats"></td>
	        </tr>
	        <tr>
	            <td><label for="stations">Stations:</label></td>
	            <td><textarea rows="10" cols="40" placeholder="enter stations using commas" name="stations"></textarea></td>
	        </tr>
	        <tr>
	            <td><label for="prices">Prices:</label></td>
	            <td><textarea rows="10" cols="40" placeholder="enter prices using commas" name="prices"></textarea></td>
	        </tr>
	        <tr>
	            <td><label for="times">Timings:</label></td>
	            <td><textarea rows="10" cols="40" placeholder="enter times using commas" name="times"></textarea></td>
	        </tr>
	        <tr>
	            <td><label for="days">Days:</label></td>
	            <td><textarea rows="10" cols="40" placeholder="enter days using commas" name="days"></textarea></td>
	        </tr>
	        <tr>
	            <td><button type="submit">Add Train</button></td>
	            <td><button type="reset">Cancel</button></td>
	        </tr>
	    </table>
	</spring:form>
</body>
</html>