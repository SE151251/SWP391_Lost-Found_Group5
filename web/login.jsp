<%-- 
    Document   : login
    Created on : Jun 4, 2022, 11:34:31 AM
    Author     : LENOVO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  <html>
<head>
  <title>Login</title>
</head>
<body>
  <h1>login</h1>
  <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/SWP39_LostAndFound/login-google&response_type=code
    &client_id=287706363103-nelsjcm2sdr3ruldha94fink89tk87tg.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>  
   <%String err = (String) request.getAttribute("errormessage"); %>
   <br/>
   <%    if(err != null){ %> <font color="red" > <%= err %></font><% } %>
</body>
</html> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/bf63641c4c.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="css/styleLogin.css" rel="stylesheet" type="text/css">
    <title>Login</title>
</head>
    </head>
    <body>
    
    <div class="container-fuild hero-image">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">            
                    <div class="hero-text">
                      <h3 style="color: #FF3300; font-size: 40px; font-weight: bold"> FPT Lost and Found</h3>
                      <a style="font-size: 30px; font-weight: 500" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/SWP39_LostAndFound/login-google&response_type=code
    &client_id=287706363103-nelsjcm2sdr3ruldha94fink89tk87tg.apps.googleusercontent.com&approval_prompt=force">Login with google</a><br>
                      <span> <i class="fa-brands fa-google"></i></span>
                      <br/><font style="font-size: 20px" color="red" ><c:out value="${errormessage}"/> </font>
                    </div>    
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
    </body>
    </html> --%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/bf63641c4c.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="css/styleLogin.css" rel="stylesheet" type="text/css">
    <title>Login</title>
</head>
    </head>
    <body>
    
    <div class="container-fuild hero-image">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 ">            
                    <div class="hero-text">
                      <h3 class="title"> FPT Lost and Found</h3>
                      <a class="btn btn-primary" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/SWP39_LostAndFound/login-google&response_type=code
    &client_id=287706363103-nelsjcm2sdr3ruldha94fink89tk87tg.apps.googleusercontent.com&approval_prompt=force"><span><i class="fa-brands fa-google text-white btn-logo"></i>Login</span></a><br>
                      <br/>
                      <c:if test="${not empty errormessage}">
                      <font style="padding: 2px; font-size: 20px; font-weight: bold; background-color: white" color="red" ><c:out value="${errormessage}"/> </font>          
                      </c:if>
                      </div>
                
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
    </body>
    </html>
    
