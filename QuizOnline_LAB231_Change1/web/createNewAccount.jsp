<%-- 
    Document   : createNewAccount
    Created on : Nov 2, 2020, 12:57:11 PM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <title>Create New Account</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER == null}">
            <h1 class="text-center">Create New Account</h1>
            <form action="createNewAccountServlet" method="POST"
                  style=" width: 360px; margin-left: auto;margin-right: auto">
                <c:set var="errors" value="${requestScope.CREATERACCOUNT}"/>
                <!--Username.jsp-->

                <div class="mb-3">
                    <label class="form-label">Username*</label>
                    <input type="text" name="txtUsername" value="${param.txtUsername}" 
                           class="form-control"/>
                </div>
                <c:if test="${not empty errors.usernameLengthErr}">
                    <div class="mb-3">
                        <font color="red">
                        ${errors.usernameLengthErr}
                        </font>               
                    </div>
                </c:if>

                <!--Password.jsp-->

                <div class="mb-3">
                    <label class="form-label">Password*</label>
                    <input type="password" name="txtPassword" value="${param.txtPassword}" 
                           class="form-control"/>
                </div>
                <c:if test="${not empty errors.passwordLengthErr}">
                    <div class="mb-3">
                        <font color="red">
                        ${errors.passwordLengthErr}
                        </font>
                    </div>
                </c:if>

                <!--Comfirm.jsp-->

                <div class="mb-3">
                    <label class="form-label">Comfirm*</label>
                    <input type="password" name="txtComfirm" value="${param.txtPassword}" 
                           class="form-control"/>
                </div>
                <c:if test="${not empty errors.confirmNotMatched}">
                    <div class="mb-3">
                        <font color="red">
                        ${errors.confirmNotMatched}
                        </font>
                    </div>                
                </c:if>


                <!--FullName.jsp-->

                <div class="mb-3">
                    <label class="form-label">FullName*</label>
                    <input type="text" name="txtFullname" value="${param.txtFullname}" 
                           class="form-control"/>                              
                </div>
                <c:if test="${not empty errors.fullnameLengthErr}">
                    <div class="mb-3">
                        <font color="red">
                        ${errors.fullnameLengthErr}
                        </font>
                    </div>
                </c:if>

                <div class="mb-3">
                    <c:if test="${not empty errors.usernameIsExisted}">
                        <font color ="red">
                        ${errors.usernameIsExisted}
                        </font>
                    </c:if>
                </div>
                <input type="submit" class="btn btn-primary" 
                       value="Submit" name="btAction" />
                <a href="loginJSP" class="btn btn-primary">Back</a>
            </form>
        </c:if>
        <c:if test="${sessionScope.USER != null}">
            <h3>The system detects that you are accessing, please logout</h3>
            <a href="logout">Logout</a>
        </c:if>
    </body>
</html>
