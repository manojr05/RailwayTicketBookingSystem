<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<h1>Reset Password</h1>
	
	<form action="loadResetPasswordFinalPage" method="post">
		<table>
	        <tr>
	            <td><label for="userId">User Id:</label></td>
	            <td><input type="number" name="userId" placeholder="enter your user id" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="phoneNo">Phone Number:</label></td>
	            <td><input type="number" name="phoneNo" placeholder="enter your phone number" required="required"></td>
	        </tr>
	         <tr>
	            <td><button type="submit">Submit</button></td>
	            <td><button type="reset">Cancel</button></td>
	        </tr>
	   </table>
	 </form>
</body>
</html>