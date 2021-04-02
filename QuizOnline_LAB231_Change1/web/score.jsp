<%-- 
    Document   : score
    Created on : Feb 16, 2021, 2:59:27 PM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score Page</title>
        <link rel="stylesheet" href="asset/css/main.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    </head>
    <style>
        label.radio {
            cursor: pointer
        }

        label.radio input {
            position: absolute;
            top: 0;
            left: 0;
            visibility: hidden;
            pointer-events: none
        }

        label.radio span {
            padding: 4px 0px;
            border: 1px solid red;
            display: inline-block;
            color: red;
            width: 100px;
            text-align: center;
            border-radius: 3px;
            margin-top: 7px;
            text-transform: uppercase
        }

        label.radio input:checked+span {
            border-color: red;
            background-color: red;
            color: #fff
        }

        .ans {
            margin-left: 36px !important
        }

        .btn:focus {
            outline: 0 !important;
            box-shadow: none !important
        }

        .btn:active {
            outline: 0 !important;
            box-shadow: none !important
        }
    </style>
    <body>
        <c:if test="${sessionScope.USER.role == 2 and not empty sessionScope.USER}">
            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-10 col-lg-10">
                        <div class="border">

                            <div class="question bg-white p-3 border-bottom">
                                <div class="d-flex flex-row justify-content-between align-items-center mcq">
                                    <h2>Result: 
                                        <c:forEach var="subject" items="${sessionScope.TAKEQUIZLIST}" begin="1" end="1">
                                            ${subject.subjectDTO.subjectName}
                                        </c:forEach>
                                    </h2>
                                </div>
                            </div>
                            <div class="question bg-white p-3 border-bottom">
                                <div class="d-flex flex-row align-items-center question-title">
                                    <h3 class="mt-1 ml-1">${sessionScope.USER.fullName}</h3>
                                </div>
                                <div class="d-flex flex-row align-items-center question-title">
                                    <h3 class="text-success">Your correct answer: 
                                        <c:if  test="${not empty requestScope.SCORE}">
                                            <c:out value="${requestScope.SCORE}"/>đ
                                        </c:if>
                                        <c:if  test="${empty requestScope.SCORE}">
                                            0đ
                                        </c:if>
                                    </h3>
                                </div>
                                <form action="studentChooseSubject">
                                    <input type="submit" value="Back"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.USER.role == 1 and not empty sessionScope.USER}">
            Deny access <a href="teacher">Back</a>
        </c:if>

    </body>
</html>
