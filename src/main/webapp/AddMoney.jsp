<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Money</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<a:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</a:if>
	
	<h3>Add Money</h3>
	<form action="addMoney" method="post">
		<table>
	        <tr>
	            <td><label for="inr">Money in INR:</label></td>
	            <td><input type="number" name="inr" placeholder="enter your user amount in INR" required="required"></td>
	        </tr>
	         <tr>
	            <td><button type="submit">Add Money</button></td>
	            <td><button type="reset" onclick="window.location.href='loadUserMainPageOnCancel'">Cancel</button></td>
	        </tr>
	   </table>
	 </form>
</body>
</html>