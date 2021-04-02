<%-- 
    Document   : viewHistoryDetails
    Created on : Feb 17, 2021, 8:57:16 PM
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
        <title>Take Quiz Page</title>
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
                                    <h4>Details History</h4><span></span>
                                </div>
                            </div>
                            <div class="question bg-white p-3 border-bottom">
                                <c:forEach var="question" items="${requestScope.LISTQUIZHISTORY}" varStatus="counter">
                                    <div class="d-flex flex-row align-items-center question-title">
                                        <h3 class="text-danger">Q.${counter.count}</h3>
                                        <h5 class="mt-1 ml-2">${question.questionDTO.questionContent}</h5>
                                    </div>
                                    <div class="ans ml-2 disabled">
                                        <input class="form-check-input disabled" type="radio" 
                                               name="radioCorrectAnswer_${question.questionDTO.questionID}" value="${question.questionDTO.answerOption1}" disabled 
                                               <c:if test="${question.questionDTO.answerCorrect == question.questionDTO.answerOption1}">
                                                   checked="checked"
                                               </c:if>>
                                        <label class="form-check-label disabled">
                                            ${question.questionDTO.answerOption1}
                                        </label>
                                    </div>
                                    <div class="ans ml-2 ">
                                        <input class="form-check-input disabled" type="radio" 
                                               name="radioCorrectAnswer_${question.questionDTO.questionID}" value="${question.questionDTO.answerOption2}" disabled
                                               <c:if test="${question.questionDTO.answerCorrect == question.questionDTO.answerOption2}">
                                                   checked="checked"
                                               </c:if>>
                                        <label class="form-check-label disabled">
                                            ${question.questionDTO.answerOption2}
                                        </label>
                                    </div>
                                    <div class="ans ml-2 ">
                                        <input class="form-check-input disabled" type="radio" 
                                               name="radioCorrectAnswer_${question.questionDTO.questionID}" value="${question.questionDTO.answerOption3}" disabled
                                               <c:if test="${question.questionDTO.answerCorrect == question.questionDTO.answerOption3}">
                                                   checked="checked"
                                               </c:if>>
                                        <label class="form-check-label">
                                            ${question.questionDTO.answerOption3}
                                        </label>
                                    </div>
                                    <div class="ans ml-2 disabled">
                                        <input class="form-check-input disabled" type="radio" 
                                               name="radioCorrectAnswer_${question.questionDTO.questionID}" value="${question.questionDTO.answerOption4}" disabled
                                               <c:if test="${question.questionDTO.answerCorrect == question.questionDTO.answerOption4}">
                                                   checked="checked"
                                               </c:if>>
                                        <label class="form-check-label">
                                            ${question.questionDTO.answerOption4}
                                        </label>
                                    </div>                                        
                                    <div class="ans ml-2 text-info">
                                        You Choose: <c:out value="${question.chooseAnswer}"/>
                                    </div>    
                                </c:forEach>
                                <a class="btn btn-primary" href="viewHistory?txtUsername=${sessionScope.USER.username}">Back</a>
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
