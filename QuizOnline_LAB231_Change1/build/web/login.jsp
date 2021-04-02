<%-- 
    Document   : login
    Created on : Jan 23, 2021, 1:23:50 AM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <title>Login Page</title>
    </head>
    <body>
        <c:if test="${empty sessionScope.USER}">
            <h1 class="text-center">Login Page</h1>
            <div style=" width: 360px; margin-left: auto;margin-right: auto; position: relative">
                <form action="login" method="POST" >
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="txtUsername" value="" class="form-control"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="txtPassword" class="form-control" placeholder="Password">
                    </div>
                    <input type="submit" value="Login" class="btn btn-primary" />
                    <a href="createNewAccountErr" class="btn btn-primary">Sign Up</a>
                </form>
            </div>
        </c:if>
        <c:if test="${sessionScope.USER != null}">
            <h3>The system detects that you are accessing, please click blow to continue</h3>
            <c:if test="${sessionScope.USER.role == 1}">
                <a href="teacher">Back</a>
            </c:if>
            <c:if test="${sessionScope.USER.role == 2}">
                <a href="studentChooseSubject">Back</a>
            </c:if>
            <a href="logout">Logout</a>
        </c:if>

    </body>
</html>
