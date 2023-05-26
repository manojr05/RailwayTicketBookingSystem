<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
	<h2>Chaange Password</h2>

	<form onsubmit="return validatePassword();" method="post" action="createNewPassword">
		<table>
	        <tr>
	            <td><label for="password1">Create new Password:</label></td>
	            <td><input type="password" name="password1" id="password1" placeholder="create password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required"></td>
	        </tr>
	        <tr>
	            <td><label for="password2">Confirm new Password:</label></td>
	            <td><input type="password" name="password2" id="password2" placeholder="confirm password" required="required"></td>
	        </tr>
	         <tr>
	            <td><button type="submit">Reset</button></td>
	            <td><button type="reset" onclick="window.location.href='loadUserLoginPage'">Cancel</button></td>
	        </tr>
	   </table>
	 </form>
</body>
</html>