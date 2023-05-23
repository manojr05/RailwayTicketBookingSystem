<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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