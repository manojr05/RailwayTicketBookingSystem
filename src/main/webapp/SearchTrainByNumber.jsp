<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Train</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>

	<h2>Search Train</h2>
	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>

	<form action="loadSearchedTrainById" method="post">
		<table>
	        <tr>
	            <td><label for="trainId">User Id:</label></td>
	            <td><input type="number" name="trainId" placeholder="enter the train id" required="required"></td>
	        </tr>
	         <tr>
	            <td><button type="submit">Search</button></td>
	            <td><button type="reset" onclick="window.location.href='loadUserMainPageOnCancel'">Cancel</button></td>
	        </tr>
	   </table>
	 </form>
</body>
</html>