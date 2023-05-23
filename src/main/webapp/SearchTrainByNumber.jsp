<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
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