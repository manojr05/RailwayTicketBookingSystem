<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;500;600;700&display=swap');
        *{
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }
        body{
          background-image: url("https://images7.alphacoders.com/120/1207077.jpg");
          background-repeat: no-repeat;
          background-size: cover;
          
        }
        section{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
        }
        .form-box{
            position: relative;
            width: 400px;
            height: 450px;
            background: transparent;
            border: 2px solid white;
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 20px;
        }
        h2{
            font-size: 2em;
            color: white;
            text-align: center;
        }
       .inputbox{
        position: relative;
        padding: 20px 0;
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
        top: 20%;
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
        top:  40px;
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
       input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
         -webkit-appearance: none;
         margin: 0;
        }
   
        input[type="number"] {
            -moz-appearance: textfield
        }
    </style>
</head>
<body>
	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>
	
	<section>
        <div class="form-box">
            <div class="form-value">
                <form action="loadResetPasswordFinalPage" method="post">
                    <h2>Forgot Password</h2>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
                        <input type="number" name="userId" required>
                        <label for="">UserID</label>
                    </div>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
						  <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
						</svg>
                        <input type="number" name="phoneNo" required>
                        <label for="">Phone Number</label>
                    </div>
                    
                    <button type="submit">Submit</button>
                    
                    <div class="cancel">
                        <a href="loadUserLoginPage">Go Back</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>