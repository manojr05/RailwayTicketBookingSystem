<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script type="text/javascript">
	function validatePassword() {
	    var password1 = document.getElementById("password1").value;
	    var password2 = document.getElementById("password2").value;
	    if (password1 != password2) {
	        alert("Passwords do not match.");
	        return false;
	    }
	    return true;
	}
</script>
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
<section>
        <div class="form-box">
            <div class="form-value">
                <form onsubmit="return validatePassword();" action="createNewPassword" method="post">
                    <h2>Change Password</h2>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
                          </svg>
                        <input type="password" name="password1" id="password1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                        <label for="">New Password</label>
                    </div>
                    <div class="inputbox">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
                          </svg>
                        <input type="password" name="password2" id="password2" required>
                        <label for="">Re-enter New Password</label>
                    </div>
                    
                    <button type="submit">Reset</button>
                    
                    <div class="cancel">
                        <a href="loadUserLoginPage">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>