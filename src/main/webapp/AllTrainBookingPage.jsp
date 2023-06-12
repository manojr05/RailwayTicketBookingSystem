<%@page import="java.util.ArrayList"%>
<%@page import="com.train.repository.Train"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
	   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;500;600;700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body{
            background: url("https://images7.alphacoders.com/120/1207077.jpg") center / cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        table,th,td{
            padding: 0.8rem;
            border-collapse: collapse;
        }
       
        .main{
            width: 82vw;
            height: 90vh;
            background-color: #fff5;
            backdrop-filter: blur(4px);
            box-shadow: 0 0.4rem 0.8rem #0005;
            border-radius: 0.8rem;
            overflow: hidden;
        }
        .tableHeader{
            width: 100%;
            height: 10%;
            background-color: #fff4;
            padding: 0.8rem 1rem;
            color: white;
        }

        .tableHeader h1{
            text-align: center;
        }

        .tableBody{
            width: 95%;
            max-height: calc(89%-1.6rem);
            background-color: #fffb;
            margin: .8rem auto;
            border-radius: 0.6rem;
            overflow: auto;
        }

        .tableBody button{
            width: 100%;
            height: 45px;
            border-radius: 15px;
            border: none;
            outline: none;
            cursor: pointer;
            font-weight: 600;
            border: 2px solid black;
        }

        .tableBody::-webkit-scrollbar{
            width: .5rem;
            height: 0.5rem;
        }
        .tableBody::-webkit-scrollbar-thumb{
            border-radius: 0.5rem;
            background-color: #0004;
            visibility: hidden;
        }
        .tableBody:hover::-webkit-scrollbar-thumb{
            visibility: visible;
        }
        thead th{
            position: sticky;
            top: 0;
            left: 0;
            background-color: #d5d1defe
        }
        tbody tr:nth-child(even){
            background-color: #0000000b;
        }
        tbody tr:hover{
            background-color: #fff6;
        }
        button{
            width: 100px;
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
         #cap{
            text-transform: capitalize;
        }
</style>
</head>
<body>

	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>

	<%ArrayList<Train> list=(ArrayList<Train>)request.getAttribute("list"); %>
	
	   <main class="main">
	    <section class="tableHeader">
	        <h1>Available Train's</h1>
	    </section>
	    <section class="tableBody">
	        <table>
	            <thead>
					<th>Train Number</th>
					<th>Train Name</th>
					<th>Available Seats</th>
					<th>From Station</th>
					<th>To Station</th>
					<th>Time of Departure</th>
					<th>Time of Arraival</th>
					<th>Available Days</th>
					<th>Book Train</th>
				</thead>
	            <%for(Train a:list){ %>
					<tbody>
						<td><%=a.getTrainId() %></td>
						<td><%=a.getTrainName() %></td>
						<td><%=a.getTotalSeats() %></td>
						<td><%=a.getStations()[0] %></td>
						<td><%=a.getStations()[a.getStations().length-1] %></td>
						<td><%=a.getTime()[0] %></td>
						<td><%=a.getTime()[a.getTime().length-1] %></td>
						<td id="cap"><%=Arrays.toString(a.getDays()) %></td>
						<td><a href="loadBookTrainForm?id=<%=a.getTrainId()%>"><button>Book</button></a></td>
					</tbody>
				<%}%>
	        </table>
	    </section>
	   <center><a href="loadUserMainPageOnCancel"><button>Back</button></a></center> 
	</main>
</body>
</html>