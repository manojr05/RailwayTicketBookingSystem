<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Money</title>
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
            height: 300px;
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
        margin-top: 10px;
        text-align: center;
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
	<a:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</a:if>
	
	<section>
        <div class="form-box">
            <div class="form-value">
                <form action="addMoney" method="post">
                    <h2>Pop-Up Wallet</h2>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wallet" viewBox="0 0 16 16">
                            <path d="M0 3a2 2 0 0 1 2-2h13.5a.5.5 0 0 1 0 1H15v2a1 1 0 0 1 1 1v8.5a1.5 1.5 0 0 1-1.5 1.5h-12A2.5 2.5 0 0 1 0 12.5V3zm1 1.732V12.5A1.5 1.5 0 0 0 2.5 14h12a.5.5 0 0 0 .5-.5V5H2a1.99 1.99 0 0 1-1-.268zM1 3a1 1 0 0 0 1 1h12V2H2a1 1 0 0 0-1 1z"/>
                          </svg>
                        <input type="number" name="inr" required>
                        <label for="">Amount in INR</label>
                    </div>
                    <button type="submit">Pop-Up</button>
                    <div class="cancel">
                        <a href="loadUserMainPageOnCancel">Go Back</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>