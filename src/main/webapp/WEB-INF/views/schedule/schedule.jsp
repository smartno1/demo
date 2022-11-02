<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <!DOCTYPE html>
    <html lang="ko">
    <head>
    <meta charset='utf-8' />
    <link rel='stylesheet' type="text/css" href='/css/scelectable.css' />
          <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
          <link rel="stylesheet" type="text/css" href="/css/header.css"/>
    <script src='/js/main.js'></script>
    <script src="/js/ko.js"></script>
    <script>
    
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
    
        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
         
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
            }
            calendar.unselect()
          },
          eventClick: function(arg) {
            if (confirm('이 일정을 삭제하시겠습니까?')) {
              arg.event.remove()
            }
          },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [
            {title: 'title'
            ,start: 'start'
            ,end: 'end'}]
        });
    
        calendar.render();
      });
    
    </script>
    <style>
    
      body {
        margin: 40px 10px;
        padding: 0;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
        background-color: black;
      }
    
      
    
    </style>
    </head>
    <body>

        <div  class="wrap">
            <%@ include file= "../include/header.jsp" %>
            <div class="callen">
                <div class="photo">
                    <img src="../img/maxresdefault.jpg">
                </div>
               
            </div> 
            <div id='calendar'>

            </div>
            <%@ include file= "../include/footer.jsp" %>
        </div>
    </body>
    </html>
    