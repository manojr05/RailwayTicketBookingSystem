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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            min-height: 100vh;
            background-image: url("https://images7.alphacoders.com/120/1207077.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        section {
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
        .form-box {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        h2 {
            font-size: 2em;
            color: white;
            text-align: center;
        }
        .inputbox {
            position: relative;
            padding: 10px 0;
            width: 310px;
        }
        .inputbox label {
            position: absolute;
            top: calc(50% + 3px);
            left: 5px;
            transform: translateY(-50%);
            color: white;
            font-size: 1em;
            pointer-events: none;
            transition: .5s;
        }
        input:focus ~ .notop,
        input:valid ~ .notop {
            top: 18%;
        }
        .inputbox input {
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
        .inputbox svg {
            position: absolute;
            right: 8px;
            color: white;
            font-size: 1.2em;
            top:  35px;
        }
        button {
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
       
        .cancel {
            text-align: center;
            margin-top: 20px;
        }
        .cancel a {
            text-decoration: none;
            color: white;
            text-decoration: underline;
        }
        .cancel a:hover {
            font-weight: 600;
        }
        
        h3 {
            color: white;
            font-size: 1em;
            pointer-events: none;
            font-weight: 400;
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
        .inputbox input[type="date"]:hover::-webkit-calendar-picker-indicator {
            display: initial;
        }
        input[type=date]:required:invalid::-webkit-datetime-edit {
            color: transparent;
        }
        input[type=date]:focus::-webkit-datetime-edit {
            color: white !important;
        }
        .fromdrop label{
            margin: 6.5px;
        }
        .todrop label{
            margin: 6.5px;
            padding-top: 10px;
        }
        select{
            width: 100%;
            height: 40px;
            background: transparent;
            border: none;
            border-bottom: 2px solid white;
            color: white;
        }
        .todrop select{
        	margin-bottom: 10px;
        }
        select option:checked{
            color: black;
        }
        select:focus{
            color: black;
        }
        .inputbox .top{
            padding-bottom: 45px;
        }
    </style>
</head>
<body>
	
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
    
    
    <section>
        <div class="form-box">
            <div class="form-value">
			    <x:form action="loadAmountPage" modelAttribute="ticket" method="post">
			        <h2>Booking Form</h2>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                          </svg>
                        <input type="number" name="id" value="<%=user.getId()%>" required readonly>
                        <label class="top" for="">User Id</label>
                    </div>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-train-front" viewBox="0 0 16 16">
                            <path d="M5.621 1.485c1.815-.454 2.943-.454 4.758 0 .784.196 1.743.673 2.527 1.119.688.39 1.094 1.148 1.094 1.979V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V4.583c0-.831.406-1.588 1.094-1.98.784-.445 1.744-.922 2.527-1.118Zm5-.97C8.647.02 7.353.02 5.38.515c-.924.23-1.982.766-2.78 1.22C1.566 2.322 1 3.432 1 4.582V13.5A2.5 2.5 0 0 0 3.5 16h9a2.5 2.5 0 0 0 2.5-2.5V4.583c0-1.15-.565-2.26-1.6-2.849-.797-.453-1.855-.988-2.779-1.22ZM5 13a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm0 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0Zm7 1a1 1 0 1 0-1-1 1 1 0 1 0-2 0 1 1 0 0 0 2 0 1 1 0 0 0 1 1ZM4.5 5a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h3V5h-3Zm4 0v3h3a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 0-.5-.5h-3ZM3 5.5A1.5 1.5 0 0 1 4.5 4h7A1.5 1.5 0 0 1 13 5.5v2A1.5 1.5 0 0 1 11.5 9h-7A1.5 1.5 0 0 1 3 7.5v-2ZM6.5 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3Z"/>
                          </svg>
                        <input type="number" name="id" value="<%=train.getTrainId()%>" readonly required>
                        <label class="top" for="trainId">Train Number</label>
                    </div>

                    <div class="drop">
                        <div class="fromdrop">
                            <label for="from">From</label>
                            <div class="dropbox">
                                <select onchange="updateToStations()" name="source" id="source">
                                    <%for(int i=0;i<train.getStations().length;i++){%>
                                        <option><%=train.getStations()[i]%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="todrop">
                            <label id="to" for="from">To</label>
                            <div class="dropbox">
                                <select name="destination" id="destination">
                                    <%for(int i=0;i<train.getStations().length;i++){%>
                                        <option><%=train.getStations()[i]%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16" id="calendar-icon">
                            <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2V2H0v-.5zm14 1h-1V2a1 1 0 0 0-1-1H4a1 1 0 0 0-1 1v.5H2a2 2 0 0 0-2 2V13a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM2 5h12v7H2V5zm4 0v1h4V5H6zm0 2v1h4V7H6zm0 2v1h4V9H6z"/>
                        </svg>
                        <input type="date" name="dateOfJourneyy" required>
                        <label class="notop" for="date-input">Date of Journey</label>
                    </div>
                    <div class="inputbox">
                        <input type="number" name="numberOfSeats" required>
                        <label class="notop" for="">Number of Seats</label>
                    </div>

                    <button type="submit">Book Train</button>
                    <div class="cancel">
                        <a href="loadUserMainPageOnCancel">Go Back</a>
                    </div>
			    </x:form>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
