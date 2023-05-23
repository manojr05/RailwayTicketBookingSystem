<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ticket.repository.Ticket"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<x:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</x:if>

	<%List<Ticket> list=(List<Ticket>)request.getAttribute("list"); %>
	
	<table border="1">
		<tr>
			<th>PNR Number</th>
			<th>Train Number</th>
			<th>Number of Seats</th>
			<th>Date of Journey</th>
			<th>From Station</th>
			<th>To Station</th>
			<th>Status</th>
			<th>Cancel Ticket</th>
		</tr>

		<%for(Ticket a:list){ %>
			<tr>
				<td><%=a.getPnr() %></td>
				<td><%=a.getTrainId() %></td>
				<td><%=a.getNumberOfSeats() %></td>
				<td><%=a.getDateOfJourney()%></td>
				<td><%=a.getSource()%></td>
				<td><%=a.getDestination()%></td>
				<td><%=a.getStatus()%></td>
				<td><a href="cancelTicket?pnr=<%=a.getPnr()%>"><button>Cancel Ticket</button></a></td>
				<td><a href="deleteTicket?pnr=<%=a.getPnr()%>"><button>Delete History</button></a></td>
			</tr>
		<%}%>
	</table>
	<br>
	<a><button onclick="window.location.href='loadUserMainPageOnCancel'">Back</button></a>
	
</body>
</html>