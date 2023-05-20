<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
</head>
<body>
	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>
	<h1>User Login</h1>
	<form action="loadUserMainPage" method="post">
		<table>
	        <tr>
	            <td><label for="userId">User Id:</label></td>
	            <td><input type="number" name="userId" placeholder="enter your user id" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="password">Password:</label></td>
	            <td><input type="password" name="password" placeholder="enter your password" required="required"></td>
	        </tr>
	         <tr>
	            <td><button type="submit">Login</button></td>
	            <td><button type="reset">Cancel</button></td>
	        </tr>
	   </table>
	 </form>
	 <a href="loadResetPasswordPage">Forgot Password?</a>
	 
</body>
</html>