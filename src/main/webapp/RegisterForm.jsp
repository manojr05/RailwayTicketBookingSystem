<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<script type="text/javascript">
	function validatePassword() {
	    var password1 = document.getElementById("password1").value;
	    var password2 = document.getElementById("password2").value;
	    if (password1 != password2) {
	        alert("Passwords do not match.");
	        return false;
	    }
	    return true;
	}
</script>
</head>
<body>
	<h1>Registration Form</h1>
	<spring:form onsubmit="return validatePassword();" method="post" modelAttribute="user" action="saveUser">
		<table>
	        <tr>
	            <td><label for="name">Full Name:</label></td>
	            <td><input type="text" name="name" placeholder="enter your full name" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="mobile">Number:</label></td>
	            <td><input type="number" name="phoneNo" pattern="[0-9]{10}" title="Must enter a valid Phone Number" placeholder="enter your mobile number"></td>
	        </tr>
	        <tr>
	            <td><label for="dob"></label>E-Mail:</td>
	            <td><input type="email" name="email" placeholder="enter your email" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="dob"></label>Date of Birth:</td>
	            <td><input type="date" name="date" placeholder="enter your dob" required="required"></td>
	        </tr>
	        <tr>
		        <td><label for="gender">Gender:</label></td>
		        <td>
			        <input type="radio" name="gender" required="required" value="male">Male
			        <input type="radio" name="gender" value="female">Female
		        </td>
        	</tr>
        	<tr>
	            <td><label for="password1">Create Password:</label></td>
	            <td><input type="password" name="password1" id="password1" placeholder="create password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="password2">Confirm Password:</label></td>
	            <td><input type="password" name="password2" id="password2" placeholder="confirm password" required="required"></td>
	        </tr>
	        <tr>
	            <td><button type="submit">Submit</button></td>
	            <td><button type="reset">Cancel</button></td>
	        </tr>
	    </table>
	</spring:form>
</body>
</html>
