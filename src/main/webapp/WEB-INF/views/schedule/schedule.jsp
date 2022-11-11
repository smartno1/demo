<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" type="text/css" href="/css/scelectable.css"/>
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>
    <style>
        a {
            color: #fff;
            text-decoration: none;
            outline: none
        }

        a:hover, a:active {
            text-decoration: none;
        }
    </style>
    <script src="/js/main.js"></script>
    <script src="/js/ko.js"></script>
    <script>
        // 오늘날짜 가져오기


        var toDay = new Date()
        var date = toDay.toISOString().split("T")[0]

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: date, // 오늘날짜로 세팅
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                editable: true,  // 스케쥴 옮기기

                dayMaxEvents: true, // allow "more" link when too many events
                select: function (arg) {
                    if (${empty loginUser}) return;
                    var title = prompt('일정을 적어주세요:');

                    if (title) {
                        calendar.addEvent({
                            title: title,
                            content: "",
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            <%--account:"${loginUser.account}"--%>
                        })
                        let data = {
                            title: title,
                            content: "",
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            account: "${loginUser.account}"
                        }
                        console.info(data);
                        const reqInfo = {
                            method: 'POST',
                            headers: {'content-type': 'application/json'},
                            body: JSON.stringify(data)
                        };

                        fetch('/schedule/update', reqInfo)
                        location.reload();

                    }

                    calendar.unselect()
                },
                eventClick: function (arg) {       // 마우스 클릭시 이벤트
                    console.log(arg);
                    console.log(arg.event.extendedProps);
                    if (!("${loginUser.account}" === arg.event.extendedProps.account)) return;
                    if (confirm('이 일정을 삭제하시겠습니까?')) {
                        // console.log("아이디", arg.event.id);
                        // console.log("arg", arg.event.extendedProps.content);

                        arg.event.remove()

                        let data = {
                            id: arg.event.id

                        }
                        const reqInfo = {
                            method: 'POST',
                            headers: {'content-type': 'application/json'},
                            body: JSON.stringify(data)
                        };

                        fetch('/schedule/delete', reqInfo)
                    }
                },

                eventDrop: function (eventDropInfo){
                    <%--console.log("${loginUser.account}");--%>
                    <%--console.log(eventDropInfo.event.groupId);--%>
                    if(!("${loginUser.account}" == eventDropInfo.event.extendedProps.account)){
                        alert("본인의 스케쥴이 아닙니다.");
                        eventDropInfo.revert();
                        eventDropInfo.editable = false;
                        return;
                    }
                    console.log(eventDropInfo);
                    let data = {
                        id: eventDropInfo.event.id,
                        title: eventDropInfo.event.title,
                        content: eventDropInfo.event.content,
                        start: eventDropInfo.event.start,
                        end: eventDropInfo.event.end,
                        allDay: eventDropInfo.event.allDay,
                        account: eventDropInfo.event.extendedProps.account
                    };

                    console.info(data);
                    const reqInfo = {
                        method: 'POST',
                        headers: {'content-type': 'application/json'},
                        body: JSON.stringify(data)
                    };

                    fetch('/schedule/update', reqInfo)
                },

                eventMouseEnter: function (arg) { // 마우스 가져다 데면 해당 스케쥴 정보를 가져온다.
                    // console.info(arg);
                },
                eventMouseLeave: function (arg) { // 마우스 가져다 데면 해당 스케쥴 정보를 가져온다.
                    // console.info(arg);
                },

                events: function (info, successCallback, failureCallback) {    // 스케쥴정보 데이터 생성
                    fetch('/schedule/list')
                        .then(res => res.json())
                        .then(list => {

                            if (!list) {
                                return;
                            }

                            let events = [];

                            for (let i = 0; i < list.length; i++) {
                                const data = list[i];
                                // console.info(data);
                                events.push({
                                    id: data.id,
                                    title: data.title,
                                    start: data.start,
                                    end: data.end,
                                    account: data.account,
                                    content: data.content,
                                    backgroundColor:data.backgroundColor,
                                    textColor:data.textColor,
                                    borderColor:data.borderColor,
                                    allDay: data.allDay
                                })
                            }
                            successCallback(events);
                        })

                }
            });

            calendar.render();
        });

    </script>

</head>
<body>

<div class="wrap">
    <%@ include file="../include/header.jsp" %>
    <div class="callen">
        <div class="photo">
            <img src="/img/maxresdefault.jpg">
        </div>
    </div>
    <div class="calen-on">
        <div id='calendar'>

        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
</div>

</body>
</html>
    