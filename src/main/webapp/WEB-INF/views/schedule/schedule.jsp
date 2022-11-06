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
        <link rel="stylesheet" type="text/css" href="/css/scelectable.css" />
         <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
        <link rel="stylesheet" type="text/css" href="/css/header.css"/>

         
        <script src="/js/main.js"></script>
        <script src="/js/ko.js"></script>
       <style>
            a {color: #fff; text-decoration: none; outline: none}
            a:hover, a:active {text-decoration: none; }
          </style>
        <script>
          var toDay = new Date()
          var date = toDay.toISOString().split("T")[0]
          document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
              headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
              },
              initialDate : date,
              navLinks: true, // can click day/week names to navigate views
              selectable: true,
              selectMirror: true,
              select: function(arg) {
                var title = prompt('일정을 적어주세요:');
                
                if (title) {
                  calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                  })
                  let data = {
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                    account : "gogo"
                    
                  }

                  

                  const reqInfo = {
                                    method: 'POST',
                                    headers: {'content-type': 'application/json' },
                                    body: JSON.stringify(data) 
                                  };

                  fetch('/schedule/update', reqInfo)
                      
                }

                calendar.unselect()
              },
              eventClick: function(arg) {
                if (confirm('이 일정을 삭제하시겠습니까?')) {
                    console.log("아이디" + arg.id);

                  arg.event.remove()

                  let data = {
                    no : arg.id
                    
                }

                  

                  const reqInfo = {
                                    method: 'POST',
                                    headers: {'content-type': 'application/json' },
                                    body: JSON.stringify(data) 
                                  };

                  fetch('/schedule/delete', reqInfo)
                }
              },
              editable: true,
              dayMaxEvents: true, // allow "more" link when too many events
              events: function(info, successCallback, failureCallback) {
                            fetch('/schedule/list')
                                .then(res => res.json())
                                .then(list => {

                                  let events = [];

                                  list.forEach((data, index, array) => {

                                      events.push({
                                        id : data.no,
                                        title : data.title,
                                        start : data.start,
                                        end : data.end,
                                        account : data.account,
                                        allDay: data.allDay
                                      })
                                  });
                                  successCallback(events);
                              })
                  }
            });

            calendar.render();
          });

        </script>

    </head>
    <body>

        <div  class="wrap">
            <%@ include file= "../include/header.jsp"%>
            <div class="callen">
                <div class="photo">
                     <img src="/img/maxresdefault.jpg">
               </div>
            </div>
              <div class="calen-on">
              <div id='calendar'>

            </div>
          </div>
            <%@ include file= "../include/footer.jsp" %>
        </div>

    </body>
    </html>
    