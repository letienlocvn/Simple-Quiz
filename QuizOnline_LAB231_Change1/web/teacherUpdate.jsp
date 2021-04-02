<%-- 
    Document   : teacherUpdate
    Created on : Feb 4, 2021, 12:43:13 AM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="asset/css/main.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <link href="../assets/css/material-dashboard.min.css?v=2.1.2" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.role == 1 and not empty sessionScope.USER}">
            <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand">${sessionScope.USER.fullName}<div class="ripple-container"></div></a>
                    </div>
                    <div class="navbar-wrapper">
                        <a class="navbar-brand btn btn-primary" href="teacher">Back Home<div class="ripple-container"></div></a>
                    </div>
                </div>
            </nav>
            <div class="container-fluid">
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header card-header-primary">
                                        <h4 class="card-title">Update Question</h4>
                                        <p class="card-category">Complete your question</p>
                                    </div>
                                    <div class="card-body">
                                        <form action="teacherUpdate">
                                            <c:set var="errors" value="${requestScope.CREATER}"/>
                                            <c:forEach var="question" items="${requestScope.LISTQUESTIONBYID}">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group bmd-form-group">
                                                            <label class="bmd-label-floating">Subject</label>
                                                            <div class="dropdown">
                                                                <input type="hidden" name="txtQuestionID" value="${param.txtQuestionID}" />
                                                                <select name="cbbox" class="btn btn-primary">
                                                                    <c:forEach var="subject" items="${sessionScope.LISTSUBJECT}">
                                                                        <option value="${subject.subjectID}">
                                                                            ${subject.subjectName}
                                                                        </option>                                                                    
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group bmd-form-group">
                                                            <label class="bmd-label-floating">Status</label>
                                                            <div class="dropdown">
                                                                <select name="cbboxStatus" class="btn btn-primary">
                                                                    <c:if test="${question.status == true}">
                                                                        <option value="${question.status = true}">True</option>
                                                                        <option value="${question.status = false}">False</option>
                                                                    </c:if>
                                                                    <c:if test="${question.status == false}">
                                                                        <option value="${question.status = false}">False</option>
                                                                        <option value="${question.status = true}">True</option>
                                                                    </c:if>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Information about Product</label>
                                                            <div class="form-group bmd-form-group">
                                                                <label class="bmd-label-floating">Content Question</label>
                                                                <textarea class="form-control" rows="5" 
                                                                          name="txtQuestionContent" minlength="0" maxlength="200">${question.questionContent}</textarea>
                                                            </div>
                                                            <c:if test="${not empty errors.questionContentErr}">
                                                                <font color="red">
                                                                ${errors.questionContentErr}
                                                                </font>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <!-- Answer 1-->
                                                    <div class="col-md-3">
                                                        <div class="form-group bmd-form-group">
                                                            <label class="bmd-label-floating">Content option 1</label>
                                                            <input type="text" class="form-control" name="txtAnswerOne" min="0" value="${question.answerOption1}">

                                                        </div>
                                                        <c:if test="${not empty errors.answerOption1Err}">
                                                            <font color="red">
                                                            ${errors.answerOption1Err}
                                                            </font>
                                                        </c:if>
                                                    </div>
                                                    <!-- Answer 2-->
                                                    <div class="col-md-3">
                                                        <div class="form-group bmd-form-group">
                                                            <label class="bmd-label-floating">Content option 2</label>
                                                            <input type="text" class="form-control" name="txtAnswerTwo" min="0" value="${question.answerOption2}">
                                                        </div>
                                                        <c:if test="${not empty errors.answerOption2Err}">
                                                            <font color="red">
                                                            ${errors.answerOption2Err}
                                                            </font>
                                                        </c:if>
                                                    </div>
                                                    <!-- Answer 3-->
                                                    <div class="col-md-3">
                                                        <div class="form-group bmd-form-group">
                                                            <label class="bmd-label-floating">Content option 3</label>
                                                            <input type="text" class="form-control" name="txtAnswerThree" 
                                                                   maxlength="200" minlength="0" value="${question.answerOption3}"/>
                                                        </div>

                                                        <c:if test="${not empty errors.answerOption3Err}">
                                                            <font color="red">
                                                            ${errors.answerOption3Err}
                                                            </font>
                                                        </c:if>
                                                    </div>
                                                    <!-- Answer 4-->
                                                    <div class="col-md-3">
                                                        <div class="form-group bmd-form-group">
                                                            <label class="bmd-label-floating">Content option 4</label>
                                                            <input type="text" class="form-control" name="txtAnswerFour" 
                                                                   maxlength="200" minlength="0" value="${question.answerOption4}"/>

                                                        </div>
                                                        <c:if test="${not empty errors.answerOption4Err}">
                                                            <font color="red">
                                                            ${errors.answerOption4Err}
                                                            </font>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <!--Radio button-->
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="radioCorrectAnswer" id="exampleRadios1" value="option1" 
                                                           <c:if test="${question.answerCorrect == question.answerOption1}">
                                                               checked="checked"
                                                           </c:if>>
                                                    <label class="form-check-label" for="exampleRadios1">
                                                        Option 1 Correct
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="radioCorrectAnswer" id="exampleRadios2" value="option2" 
                                                           <c:if test="${question.answerCorrect == question.answerOption2}">
                                                               checked="checked"
                                                           </c:if>>
                                                    <label class="form-check-label" for="exampleRadios2">
                                                        Option 2 Correct
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="radioCorrectAnswer" id="exampleRadios3" value="option3" 
                                                           <c:if test="${question.answerCorrect == question.answerOption3}">
                                                               checked="checked"
                                                           </c:if>>
                                                    <label class="form-check-label" for="exampleRadios3">
                                                        Option 3 Correct
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="radioCorrectAnswer" id="exampleRadios4" value="option4" 
                                                           <c:if test="${question.answerCorrect == question.answerOption4}">
                                                               checked="checked"
                                                           </c:if>>
                                                    <label class="form-check-label" for="exampleRadios4">
                                                        Option 4 Correct
                                                    </label>
                                                </div>
                                            </c:forEach>


                                            <input type="submit" value="Update" class="btn btn-primary pull-right"/>
                                            <input type="reset" class="btn btn-primary" value="Reset"/>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.USER.role == 2 and not empty sessionScope.USER}">
            Deny access
            <a href="studentChooseSubject">Click here to try again</a>
        </c:if>
    </body>
</html>
