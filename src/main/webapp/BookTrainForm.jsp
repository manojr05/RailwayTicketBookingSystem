<%@page import="com.train.repository.Train"%>
<%@page import="com.user.repository.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Train Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script>
    function updateToStations() {
        var fromSelect = document.getElementById("source");
        var toSelect = document.getElementById("destination");
        var selectedFrom = fromSelect.value;

        // Clear the "To" stations dropdown
        toSelect.innerHTML = "";

        // Add options to "To" stations based on selected "From" station
        for (var i = fromSelect.selectedIndex + 1; i < fromSelect.options.length; i++) {
            var option = document.createElement("option");
            option.text = fromSelect.options[i].text;
            option.value = fromSelect.options[i].value;
            toSelect.add(option);
        }
    }
</script>
</head>
<body>

	<h2>Train Booking Form</h2>
	
	<a:if test="${not empty alert}">
  		<script>alert('${alert}')</script>
	</a:if>

    <%
    
    User user;
    if(request.getAttribute("user")==null){
    	user=(User)session.getAttribute("user");
    }else{
	    user = (User) request.getAttribute("user");
    }
    
    Train train;
    if(request.getAttribute("train")==null){
    	train=(Train)session.getAttribute("trainToBeBooked");
    }else{
    	train = (Train) request.getAttribute("train");
    }
    %>
    <x:form action="loadAmountPage" modelAttribute="ticket" method="post">
        <table>
            <tr>
                <td><label for="id">User ID:</label></td>
                <td><input type="number" name="id" value="<%=user.getId()%>" required="required" readonly="readonly"></td>
            </tr>
            <tr>
                <td><label for="trainId">Train ID:</label></td>
                <td><input type="number" name="id" value="<%=train.getTrainId()%>" required="required" readonly="readonly"></td>
            </tr>
            <tr>
                <td><label for="source">From:</label></td>
                <td>
                    <select id="source" name="source" onchange="updateToStations()">
                        <%for(int i=0;i<train.getStations().length;i++){%>
                            <option><%=train.getStations()[i]%></option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="destination">To:</label></td>
                <td>
                    <select id="destination" name="destination">
                        <%for(int i=0;i<train.getStations().length;i++){%>
                            <option><%=train.getStations()[i]%></option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="dateOfJourneyy">Date of Journey:</label></td>
                <td><input type="date" name="dateOfJourneyy" required="required"></td>
            </tr>
            <tr>
                <td><label for="numberOfSeats">Number of Seats:</label></td>
                <td><input type="number" name="numberOfSeats" required="required" onchange="calculateAmount()"></td>
            </tr>
            <tr>
                <td><button type="submit">Book Train</button></td>
                <td><button onclick="window.location.href='loadUserMainPageOnCancel'">Cancel</button></td>
            </tr>
        </table>
    </x:form>
</body>
</html>
