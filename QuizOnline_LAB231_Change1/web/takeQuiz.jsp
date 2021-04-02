<%-- 
    Document   : takeQuiz
    Created on : Feb 7, 2021, 9:41:31 PM
    Author     : WIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="asset/css/main.css">
        <link rel="stylesheet" href="asset/js/jquery.twbsPagination.js">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
                                    <h4>Take Quiz</h4><span></span>
                                </div>
                            </div>

                            <div class="rounded bg-gradient-4 text-white shadow p-5 text-center mb-5">
                                <p class="mb-0 font-weight-bold text-uppercase">TIME COUNTER</p>
                                <div id="clockdiv">                       
                                    <div>
                                        <span class="hours"></span>
                                        <div class="smalltext">Hours</div>
                                        <span class="minutes"></span>
                                        <div class="smalltext">Minutes</div>
                                    </div>

                                    <div>
                                        <span class="seconds"></span>
                                        <div class="smalltext">Seconds</div>
                                    </div>
                                </div>
                            </div>


                            <div class="question bg-white p-3 border-bottom">
                                <form action="completeQuiz" >                                 
                                    <input type="hidden" name="txtUsername" value="${sessionScope.USER.username}" />
                                    <c:forEach  var="question" items="${sessionScope.TAKEQUIZLIST}" varStatus="counter">
                                        <div class="contentPage">
                                            <input type="hidden" name="txtSubject" value="${question.subjectDTO.subjectName}"/>
                                            <div class="d-flex flex-row align-items-center question-title">
                                                <h3 class="text-danger">Q.${counter.count}</h3>
                                                <h5 class="mt-1 ml-2">${question.questionContent}</h5>
                                                <input type="hidden" name="txtAnswerCorrect" value="${question.answerCorrect}"/>                                            
                                            </div>
                                            <div class="ans ml-2">
                                                <input class="form-check-input" type="radio" name="radioCorrectAnswer_${question.questionID}" value="${question.answerOption1}">
                                                <label class="form-check-label">
                                                    ${question.answerOption1}
                                                </label>
                                            </div>
                                            <div class="ans ml-2">
                                                <input class="form-check-input" type="radio" name="radioCorrectAnswer_${question.questionID}" value="${question.answerOption2}">
                                                <label class="form-check-label">
                                                    ${question.answerOption2}
                                                </label>
                                            </div>
                                            <div class="ans ml-2">
                                                <input class="form-check-input" type="radio" name="radioCorrectAnswer_${question.questionID}" value="${question.answerOption3}">
                                                <label class="form-check-label">
                                                    ${question.answerOption3}
                                                </label>
                                            </div>
                                            <div class="ans ml-2">
                                                <input class="form-check-input" type="radio" name="radioCorrectAnswer_${question.questionID}" value="${question.answerOption4}">
                                                <label class="form-check-label">
                                                    ${question.answerOption4}
                                                </label>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div style="padding-top: 20px; float: right;">
                                        <input id="submit" class="btn btn-primary" type="submit" value="Submit"/>
                                    </div>
                                    
                                </form>
                                    <ul id="pagination" style="padding-top: 10px;"></ul>
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
    <script>

        $(function () {
            var pageSize = 10; // Hiển thị 10 question trên 1 trang
            showPage = function (page) {
                $(".contentPage").hide();
                $(".contentPage").each(function (n) {
                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                        $(this).show();
                });
            }
            showPage(1);
            ///** Cần truyền giá trị vào đây **///
            var totalRows = 20; // Tổng số sản phẩm hiển thị
            var btnPage = 2; // Số nút bấm hiển thị di chuyển trang
            var iTotalPages = Math.ceil(totalRows / pageSize);

            var obj = $('#pagination').twbsPagination({
                totalPages: iTotalPages,
                visiblePages: btnPage,
                onPageClick: function (event, page) {
                    console.info(page);
                    showPage(page);
                }
            });
            console.info(obj.data());
        });

        function getTimeRemaining(endtime) {
            var t = Date.parse(endtime) - Date.parse(new Date());
            var seconds = Math.floor((t / 1000) % 60);
            var minutes = Math.floor((t / 1000 / 60) % 60);
            var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
            return {
                'total': t,
                'hours': hours,
                'minutes': minutes,
                'seconds': seconds
            };
        }

        function initializeClock(id, endtime) {
            var clock = document.getElementById(id);
            var hoursSpan = clock.querySelector('.hours');
            var minutesSpan = clock.querySelector('.minutes');
            var secondsSpan = clock.querySelector('.seconds');

            function updateClock() {
                var t = getTimeRemaining(endtime);

                hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
                minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
                secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

                if (t.total <= 0) {
                    document.getElementById('submit').click();
                    clearInterval(timeinterval);
                }
            }

            updateClock();
            var timeinterval = setInterval(updateClock, 1000);
        }

        var deadline = new Date(Date.parse(new Date()) + 10 * 60 * 1000);
        initializeClock('clockdiv', deadline);
    </script>
</html>
