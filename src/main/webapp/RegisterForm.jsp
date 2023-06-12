<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
<style>
          @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;500;600;700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body{
            min-height: 100vh;
            background-image: url("https://images7.alphacoders.com/120/1207077.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        section{
            position: relative;
            max-width: 400px;
            width: 100%;
            background: transparent;
            backdrop-filter: blur(10px);
            border: 2px solid white;
            border-radius: 40px;
            padding: 25px;
            border-radius: 8px;
            color: white;
        }
        .form-box{
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        h2{
            font-size: 2em;
            color: white;
            text-align: center;
        }
        .inputbox{
        position: relative;
        padding: 10px 0;
        width: 310px;
       }
       .inputbox label{
        position: absolute;
        top: calc(50% + 3px);
        left: 5px;
        transform: translateY(-50%);
        color: white;
        font-size: 1em;
        pointer-events: none;
        transition: .5s;
       }
       input:focus ~ label,
       input:valid ~ label{
        top: 12%;
       }
       .inputbox input{
        width: 100%;
        height: 50px;
        background: transparent;
        border: none;
        outline: none;
        font-size: 1em;
        padding: 0 25px 0 5px;
        color: white;
        border-bottom: 2px solid white;
        
       }
       .inputbox svg{
        position: absolute;
        right: 8px;
        color: white;
        font-size: 1.2em;
        top:  35px;
       }
       button{
        width: 100%;
        height: 40px;
        border-radius: 40px;
        background: white;
        border: none;
        outline: none;
        cursor: pointer;
        font-size: 1em;
        font-weight: 600;
        margin-top: 15px;
       }
       
       .cancel{
        text-align: center;
        margin-top: 20px;
       }
       .cancel a{
        text-decoration: none;
        color: white;
        text-decoration: underline;
        }
        .cancel a:hover{
            font-weight: 600;
       }
       .gender-box{
        position: relative;
        display: flex;
        margin-top: 18px;
        column-gap: 10px;
       }
       h3{
        color: white;
        font-size: 1em;
        pointer-events: none;
        font-weight: 400;
       }
       .gender{
			margin-left: 10px;
       }
       input[type="number"]::-webkit-inner-spin-button,
       input[type="number"]::-webkit-outer-spin-button {
         -webkit-appearance: none;
         margin: 0;
       }
   
        input[type="number"] {
         -moz-appearance: textfield;
        }
        
        .inputbox input[type="date"]::-webkit-calendar-picker-indicator {
            display: none;
        }
        input[type=date]:required:invalid::-webkit-datetime-edit {
            color: transparent;
        }
        input[type=date]:focus::-webkit-datetime-edit {
            color: white !important;
        }
    </style>
</head>
<body>
	<section>
        <div class="form-box">
            <div class="form-value">
				<spring:form onsubmit="return validatePassword();" method="post" modelAttribute="user" action="saveUser">
					<h2>Register</h2>
			                    <div class="inputbox">
			                        <input type="text" name="name" required>
			                        <label for="">Full Name</label>
			                    </div>
			                    <div class="inputbox">
			                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
			                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
			                        </svg>
			                        <input type="email" name="email" required>
			                        <label for="">E-mail</label>
			                    </div>
			                    
			                    <div class="inputbox">
			                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
									  <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
									</svg>
			                        <input type="number" name="phoneNo" pattern="[6789][0-9]{9}" required>
			                        <label for="">Phone Number</label>
			                    </div>
			                    
			                    <div class="inputbox">
			                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16" id="calendar-icon">
			                          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2V2H0v-.5zm14 1h-1V2a1 1 0 0 0-1-1H4a1 1 0 0 0-1 1v.5H2a2 2 0 0 0-2 2V13a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2zM2 5h12v7H2V5zm4 0v1h4V5H6zm0 2v1h4V7H6zm0 2v1h4V9H6z"/>
			                        </svg>
			                        <input type="date" name="date" required>
			                        <label for="">Date of Birth</label>
			                      </div>
			
			                    <div class="gender-box">
			                    <h3>Gender:</h3>
			                    <div class="gender">
			                        <input type="radio" id="male" value="male" name="gender" required>
			                        <label for="male">Male</label>
			                    </div>
			                    <div class="gender">
			                        <input type="radio" id="female" value="female" name="gender">
			                        <label for="female">Female</label>
			                    </div>
			                   </div>
			                    
			                    <div class="inputbox">
			                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
			                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
			                          </svg>
			                        <input type="password" name="password1" id="password1" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" required>
			                        <label for="">Password</label>
			                    </div>
			                    
			                    <div class="inputbox">
			                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
			                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
			                          </svg>
			                        <input type="password" name="password2" id="password2" required>
			                        <label for="">Re-Enter Password</label>
			                    </div>
			                    
			                    <button type="submit">Register</button>
			                    
			                    <div class="cancel">
			                        <a href="loadHomePage">Cancel</a>
			                    </div>
					</spring:form>
	            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
