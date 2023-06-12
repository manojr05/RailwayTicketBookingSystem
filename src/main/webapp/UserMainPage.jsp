<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
	  /* background */
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;500;600;700&display=swap");

      * {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
      }
      body {
        background-image: url("https://images7.alphacoders.com/120/1207077.jpg");
        background-repeat: no-repeat;
        background-size: cover;
      }
      section {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        min-height: 100vh;
      }
      section .outer {
        background: transparent;
        backdrop-filter: blur(4px);
        border: 1px solid white;
        height: 600px;
        width: 1400px;
      }
      h2 {
        color: white;
        font-weight: 200;
        text-align: center;
        padding: 20px 0;
      }
      .inner{
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 430px;
        column-gap: 80px;
      }
      p{
        color: white;
        font-weight: 300;
        text-align: left;
        font-size: 9vh;
        text-transform: uppercase;
        text-shadow: 1px 2px 1px black;
      }
      p b{
        font-weight: 400;
        color: honeydew;
      }
      .sub h3{
        color: white;
        font-weight: 400;
        text-align: center;
      }
      .sub button{
        height: 50px;
        width: 280px;
        border-radius: 40px;
        margin: 10px;
        font-size: 2vh;
        font-weight: 800;
        transition: 0.2s;
      }
      .sub button:hover{
        font-size:2.2vh;
      }
      .logout button{
        height: 50px;
        width: 180px;
        border-radius: 40px;
        margin: 10px;
        font-size: 3vh;
        font-weight: 400;
        transition: 0.2s;
      }
      .logout button:hover{
        background-color: black;
        color: white;
      }
</style>
</head>
<body>

	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>
	
	<section>
      <div class="outer">
        <h2>Hello <b>${user.getName()}</b>, Welcome to Railways</h2>
        <div class="inner">
            <div class="sub" id="sub1">
                <p>Experience the<br>convenience of <br>seamless <b>train booking</b></p>
            </div>
            <div class="sub" id="sub2">
                <div class="sub">
                    <h3>Wallet : ${user.getInr() }</h3>
                    <a href="loadAddMoneyPage"><button>Popup Wallet</button></a><br>
                    <a href="loadShowAllTicketPage"><button>Show My Tickets</button></a><br>
                    <a href="loadViewAllTrainBookingPage"><button>Show Available Trains</button></a><br>
                    <a href="loadSearchTrainByIdPage"><button>Search Train By Number</button></a>
                </div>
            </div>
        </div>
        <div class="logout">
            <center><a href="logoutUser"><button>Logout</button></a></center>
        </div>
      </div>
    </section>
</body>
</html>