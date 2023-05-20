<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.train.repository.TrainRepository"%>
<%@page import="com.train.repository.Train"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	TrainRepository repository = new TrainRepository();
	Train train = (Train) request.getAttribute("train");
	%>

	<spring:form method="post" modelAttribute="train" action="saveEdit">
		<table>
			<tr>
				<td><label for="trainId">Train Number:</label></td>
				<td><input type="number" name="trainId"
					value="${train.getTrainId()}"></td>
			</tr>
			<tr>
				<td><label for="trainName">Train Name:</label></td>
				<td><input type="text" name="trainName"
					value="${train.getTrainName()}" required="required"></td>
			</tr>
			<tr>
				<td><label for="totalSeats">Total Seats:</label></td>
				<td><input type="number" name="totalSeats"
					value="${train.getTotalSeats()}"></td>
			</tr>
			<tr>
				<td><label for="stations">Stations:</label></td>
				<td><textarea rows="10" cols="40" name="stations"><%
						for (String s : train.getStations()) {
							out.print(s + ",");
						}
				%></textarea></td>
			</tr>
			<tr>
				<td><label for="prices">Prices:</label></td>
				<td><textarea rows="10" cols="40" name="prices"><%
		            for (String s : train.getPrices()) {
		            	out.print(s + ",");
		            }
		        %></textarea></td>
			</tr>
			<tr>
				<td><label for="times">Timings:</label></td>
				<td><textarea rows="10" cols="40" name="times"><%
	            	 for (String s : train.getTime()) {
	            	 	out.print(s + ",");
	            	 }
	           	%></textarea></td>
			</tr>
			<tr>
				<td><label for="days">Days:</label></td>
				<td><textarea rows="10" cols="40" name="days"><%
	            	for (String s : train.getDays()) {
	            		out.print(s + ",");
	            	}
	            %></textarea></td>
			</tr>
			<tr>
				<td><button type="submit">Update Train</button></td>
				<td><button type="reset">Cancel</button></td>
			</tr>
		</table>
	</spring:form>
</body>
</html>