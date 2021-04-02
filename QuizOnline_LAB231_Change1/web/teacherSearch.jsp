<%-- 
    Document   : teacherSearch
    Created on : Feb 4, 2021, 12:41:47 AM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Page</title>
        <link rel="stylesheet" href="asset/css/main.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    </head>
    <body>
        <c:if test="${sessionScope.USER.role == 1 and not empty sessionScope.USER}">

            <form action="teacherSearch">
                <nav class="navbar navbar-dark sticky-top bg-primary flex-md-nowrap p-0">
                    <a class="navbar-brand col-sm-3 col-md-2 mr-0">${sessionScope.USER.fullName}</a>
                    <input class="form-control form-control-dark w-50" type="text" placeholder="Search" aria-label="Search" name="txtSearch" value="${param.txtSearch}">
                    <select class="form-select btn btn-info" name="cbCategory">
                        <option value="opQuestion">Question</option>
                        <option value="opSubject">Subject</option>                    
                    </select>
                    <select class="form-select btn btn-info" name="cbStatus">
                        <option value="1">Active</option>
                        <option value="0">de-Active</option>
                    </select>


                    <ul class="navbar-nav px-3">
                        <li class="nav-item text-nowrap">
                            <input class="btn btn-secondary" type="submit" value="Search" />
                        </li>
                    </ul>
                </nav>
            </form>

            <div class="container-fluid">
                <div class="row">
                    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                        <div class="sidebar-sticky">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active" href="logout">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                                        Logout <span class="sr-only">(current)</span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="teacherCreateQuestionJSP">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                                        Create Question
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                        <h2>Dashboard</h2>
                        <hr/>
                        <div class="table-responsive">
                            <table class="table table-striped table-sm table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Subject Name</th>
                                        <th>Question ID </th>
                                        <th>Content question</th>
                                        <th>Content answer</th>
                                        <th>Correct answer</th>
                                        <th>Status</th>
                                        <th>Date Create</th>
                                        <th>Action</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <!-- Result of Subject -->

                                    <c:forEach var="subject" items="${requestScope.SEARCHSUBJECTRESTUL}" varStatus="counter">
                                    <form action="teacherDelete">
                                        <c:if test="${not empty subject}">
                                            <tr class="text-center">
                                                <td>${counter.count}</td>

                                                <td>
                                                    ${subject.subjectDTO.subjectName}
                                                </td>
                                                <td>
                                                    ${subject.questionID}
                                                </td>
                                                <td>                                                   
                                                    ${subject.questionContent}
                                                </td>
                                                <td>
                                                    ${subject.answerOption1}<hr/>
                                                    ${subject.answerOption2}<hr/>
                                                    ${subject.answerOption3}<hr/>
                                                    ${subject.answerOption4} 
                                                </td>
                                                <td>${subject.answerCorrect}</td>
                                                <td>${subject.status}</td>
                                                <td>${subject.dateOfCreate}</td>
                                                <td>                                                                                                   
                                                    <input Onclick="return ConfirmDelete();" class="btn btn-danger" type="submit" value="Delete" name="btAction" />                                                
                                                </td>
                                                <td>
                                                    <c:url var="nextUpdate" value="StoreQuestionServlet">
                                                        <c:param name="txtQuestionID" value="${question.questionID}"/>
                                                    </c:url>
                                                    <a class="btn btn-primary" href="${nextUpdate}">Update</a>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </form>
                                </c:forEach>

                                <!-- Result of Question -->

                                <c:if test="${requestScope.SEARCHQUESTIONRESULT != null}">
                                    <c:forEach var="question" items="${requestScope.SEARCHQUESTIONRESULT}" varStatus="counter">
                                        <form action="teacherDelete">
                                            <c:if test="${not empty question}">
                                                <tr class="text-center">
                                                    <td>${counter.count}</td>

                                                    <td>
                                                        ${question.subjectDTO.subjectName}

                                                    </td>
                                                    <td>
                                                        ${question.questionID}
                                                        <input type="hidden" name="txtQuestionID" value="${question.questionID}" />
                                                    </td>
                                                    <td>                                                   
                                                        ${question.questionContent}
                                                    </td>
                                                    <td>
                                                        ${question.answerOption1}<hr/>
                                                        ${question.answerOption2}<hr/>
                                                        ${question.answerOption3}<hr/>
                                                        ${question.answerOption4} 
                                                    </td>
                                                    <td>${question.answerCorrect}</td>
                                                    <td>${question.status}</td>
                                                    <td>${question.dateOfCreate}</td>
                                                    <td>                                                                                                   
                                                        <input Onclick="return ConfirmDelete();" class="btn btn-danger" type="submit" value="Delete" />                                                
                                                    </td>
                                                    <td>
                                                        <c:url var="nextUpdate" value="StoreQuestionServlet">
                                                            <c:param name="txtQuestionID" value="${question.questionID}"/>
                                                        </c:url>
                                                        <a class="btn btn-primary" href="${nextUpdate}">Update</a>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </form>
                                    </c:forEach>
                                </c:if> 

                                </tbody>
                            </table>
                        </div>

                        <!-- Paging-->
                        <form action="teacherSearch">
                            <div class="row" >
                                <div class="col-sm-1" style="float: right">
                                    <ul class="pagination">
                                        <c:forEach var="sizeSearchADMIN" begin="1" end="${requestScope.SIZEOFSEARCH}">
                                            <li class="page-item">
                                                <c:url var="ManagementQuestion" 
                                                       value="teacherSearch?txtSearch=${param.txtSearch}&cbCategory=${param.cbCategory}&cbStatus=${param.cbStatus}&pageIndex=${sizeSearchADMIN}"/>
                                                <a class="page-link" 
                                                   href="${ManagementQuestion}">${sizeSearchADMIN}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </form>


                    </main>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.USER.role == 2 and not empty sessionScope.USER}">
            Deny access
            <a href="studentChooseSubject">Click here to try again</a>
        </c:if>
        <script>
            function ConfirmDelete() {
                var deleteItem = confirm("Are you sure you want to delete?");
                if (deleteItem)
                    return true;
                else
                    return false;
            }
        </script>

    </body>
</html>