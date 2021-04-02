<%-- 
    Document   : student
    Created on : Jan 30, 2021, 4:29:55 PM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="asset/css/main.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <title>Student Page</title>
    </head>
    <style>
        .contain-table{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }
        .contain-table thead tr{
            background-color: #009879;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }
        .contain-table th,
        .contain-table td{
            padding: 12px 15px;
        }
        .contain-table tbody tr{
            border-bottom: 1px solid #dddddd;            
        }
        .contain-table tbody tr:nth-of-type(even){
            background-color: #f3f3f3;
        }
        .contain-table tbody tr:last-of-type{
            border-bottom: 2px solid #009879;
        }
    </style>
    <body>
        <c:if test="${sessionScope.USER.role == 2 and sessionScope.USER != null}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="jumbotron text-center">
                            WELCOME, ${sessionScope.USER.fullName}</h3>
                        <div class="text-right">
                            <form action="logout" style="padding-bottom: 10px;">
                                <input class="btn btn-primary" type="submit" value="Logout" />
                            </form>
                            <form action="viewHistory" style="padding-bottom: 10px;">
                                <input class="btn btn-primary" type="submit" value="View History" />
                                <input type="hidden" name="txtUsername" value="${sessionScope.USER.username}" />
                            </form>
                        </div>
                    </div>    
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <table class="contain-table text-center col-sm-12" border="1">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Name of Subject</th>
                                    <th scope="col">Subject ID</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${sessionScope.STUDENTSUBJECT}" var="subject" varStatus="counter">
                                <c:if test="${not empty subject}">
                                    <tbody>                                    
                                    <form action="AddSubjectServlet">
                                        <td scope="row">
                                            ${counter.count}
                                        </td>
                                        <td>
                                            ${subject.subjectName}
                                        </td>
                                        <td>
                                            ${subject.subjectID}
                                        </td>
                                        <td>
                                            <c:url var="takeQuiz" value="StudentTakeQuizServlet">
                                                <c:param name="txtSubjectID" value="${subject.subjectID}"/>                                            
                                            </c:url>
                                            <a class="btn btn-primary" href="${takeQuiz}">Take Quiz</a>
                                        </td>
                                    </form>
                                    </tbody>
                                </c:if>
                            </c:forEach>
                        </table> 
                    </div>
                </div>

            </div>
        </c:if>

        <c:if test="${sessionScope.USER.role == 1 and not empty sessionScope.USER}">
            Deny access <a href="teacher">Back</a>
        </c:if>
    </body>
</html>
