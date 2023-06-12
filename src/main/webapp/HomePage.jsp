<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home Page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
 <style>
	
      /* background */
      @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;500;600;700&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Itim&display=swap');
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

        body::before {
	      content: "";
	      position: fixed;
	      top: 0;
	      left: 0;
	      width: 100%;
	      height: 100%;
	      z-index: -1;
	      background-image: url("https://images7.alphacoders.com/120/1207077.jpg");
	      background-repeat: no-repeat;
	      background-size: cover;
	      filter: blur(5px);
	    }

        /* main body */

        #tagline h1{
          color: white;
          padding-left: 30px;
          padding-top: 180px;
          text-transform: uppercase;
          font-size: 120px;
          font-weight: 300;
          text-shadow: 3px 3px 1px rgba(0, 0, 0, 1);
        }
        #tagline p{
          font-family: 'Poppins', sans-serif;
          color: white;
          padding-left: 40px;
          font-size: 20px;
          font-weight: 300;
          text-shadow: 3px 3px 1px rgba(0, 0, 0, 1);
        }
        .buttons{
          padding-left: 40px;
          padding-top: 30px;
        }

        .buttons button{
          width: 180px;
          height: 60px;
          background: white;
          border: none;
          outline: none;
          cursor: pointer;
          font-size: 1em;
          font-weight: 400;
          transition: 0.2s;
        }

        .buttons button:hover{
          font-size: 28px;
        }

        .buttons a button{
          text-decoration: none;
          font-size: 25px;
          color: black;
          font-weight: 400;
        }

        #a2{
          margin-left: 30px;
        }
</style>
</head>
<body>

	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>
	
	<div id="tagline">
    <h1>Railways!</h1>
    <p>"Experience the convenience of seamless train booking on our website, allowing you to<br>secure your desired train tickets with just a few clicks."</p>
   </div>
   <div class="buttons">
    <a href="loadUserLoginPage"><button id="a1">User</button></a>
    <a href="loadAdminLoginPage"><button id="a2">Admin</button></a>
   </div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>