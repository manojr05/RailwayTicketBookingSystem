<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
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
            font-size: 2.5em;
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
                <form action="loadAdminMainPage" method="post">
                    <h2>Admin Login</h2>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
                        <input type="number" name="id" required>
                        <label for="">Admin ID</label>
                    </div>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
                          </svg>
                        <input type="password" name="password" required>
                        <label for="">Password</label>
                    </div>
                    
                    <button type="submit">Login</button>
                    
                    <div class="cancel">
                        <a href="loadHomePage">Go Back</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>