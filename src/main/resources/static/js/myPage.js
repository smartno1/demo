
const currentAccount = '${loginUser.account}';
const URL = '/api/v1/my-page'
let type = "board";

//날짜 포맷 변환 함수
function formatDate(datetime,flag) {
    //문자열 날짜 데이터를 날짜객체로 변환
    const dateObj = new Date(datetime);
    // console.log(dateObj);
    //날짜객체를 통해 각 날짜 정보 얻기
    let year = dateObj.getFullYear();
    //1월이 0으로 설정되어있음.
    let month = dateObj.getMonth() + 1;
    let day = dateObj.getDate();
    let hour = dateObj.getHours();
    let minute = dateObj.getMinutes();
    //오전, 오후 시간체크
    let ampm = '';
    if (hour < 12 && hour >= 6) {
        ampm = '오전';
    } else if (hour >= 12 && hour < 21) {
        ampm = '오후';
        if (hour !== 12) {
            hour -= 12;
        }
    } else if (hour >= 21 && hour <= 24) {
        ampm = '밤';
        hour -= 12;
    } else {
        ampm = '새벽';
    }
    //숫자가 1자리일 경우 2자리로 변환
    (month < 10) ? month = '0' + month : month;
    (day < 10) ? day = '0' + day : day;
    (hour < 10) ? hour = '0' + hour : hour;
    (minute < 10) ? minute = '0' + minute : minute;

    if(flag){}
    else{}
    return year + "-" + month + "-" + day;
}

// 댓글 목록 DOM을 생성하는 함수
function makeReplyDOM({
    replyList,
    count,
    maker
}) {

    let tag = " <div class='article_reply' >" +
        "<table>																							" +
        "                           <caption><span class='blind'>댓글 목록</span></caption>                    " +
        "                           <colgroup>                                                             " +
        "                               <col style='width: 600px;'>                                                              " +
        "                               <col style='width: 120px;'>                                         " +
        "                           </colgroup>                                                            " +
        "                           <thead>                                                                " +
        "                               <tr>                                                               " +
        "                                   <th scope='col' >                                   " +
        "                                       댓글                                                         " +
        "                                   </th>                                                          " +
        "                                   <th scope='col'>                                   " +
        "                                       추천수                                                         " +
        "                                   </th>                                                          " +
        "                               </tr>                                                              " +
        "                           </thead>                                                               " +
        "    <tbody>                                                                                        ";


    if (replyList === null || replyList.length === 0) {
        tag += "<tr><td colspan='4' class='blocked_list'>작성한 댓글이 없습니다.</td></tr>";

    } else {
        for (let rep of replyList) {
            tag +=
                "        <tr>                                                                                                   " +
                "            <td class='td_article'>                                                                            " +
                "                <div class='check_box only_box'>                                                               " +
                "                    <div class='FormInputCheck'>                                                               " +
                "                        <input id='check_reply_" + rep.replyNo + "' type='checkbox' class='input_check' value=" + rep.replyNo + ">               " +
                "                        <label for='check_reply_" + rep.replyNo + "class='label'>                                    " +
                "                            <span class='blind'>선택</span>                                                      " +
                "                        </label>                                                                               " +
                "                    </div>                                                                                     " +
                "                </div>                                                                                         " +
                "                <a href='/board/content/" + rep.boardNo + "'" +
                "                    target='_blank' class='reply-list'>                                                        " +
                "                    <li class='inner_list'><strong class='article'>" + rep.replyText + "</strong>                 " +
                "                    </li>                                                                                     " +
                "                    <li class='reply_date'>                                                                 " +
                formatDate(rep.replyDate) +
                "                    </li>                                                                                     " +
                "                    <li class='reply_title'>                                                                " +
                rep.boardTitle +
                "                        <span class='cmt'>[<em>" + rep.boardReplyCnt + "</em>]</span>                              " +
                "                    </li>                                                                                     " +
                "                </a>                                                                                           " +
                "            </td>                                                                                              " +
                "            </td>                                                                                      " +
                "            <td class='td_like'>                                                                               " +
                                rep.likeCnt +
                "            </td>                                                                                              " +
                "        </tr>                                                                                                  ";

        }
        tag += "</tbody>" +
            "</table>" +
            "</div>" ;



    }

    // 댓글 목록에 생성된 DOM 추가
    document.getElementById("member_profile").innerHTML = tag;


    // 페이지 렌더링
    makePageDOM(maker);



}
// 게시글 목록 DOM을 생성하는 함수
function makeBoardDOM({
    boardList,
    count,
    maker
}) {

    let tag = " <div class='article_board' >" +
        "<table>																								" +
        "    <caption><span class='blind'>게시물 목록</span></caption>                                               " +
        "    <colgroup>                                                                                         " +
        "        <col>                                                                                          " +
        "        <col style='width: 120px;'>                                                                    " +
        "        <col style='width: 120px;'>                                                                     " +
        "        <col style='width: 120px;'>                                                                     " +
        "    </colgroup>                                                                                        " +
        "    <thead>                                                                                            " +
        "        <tr>                                                                                           " +
        "            <th scope='col'>                                                                           " +
        "                제목                                                                                     " +
        "            </th>                                                                                      " +
        "            <!---->                                                                                    " +
        "            <th scope='col'>                                                                           " +
        "                작성일                                                                                    " +
        "            </th>                                                                                      " +
        "            <th scope='col'>                                                                           " +
        "                조회수                                                                                     " +
        "            </th>                                                                                      " +
        "            <th scope='col'>                                                                           " +
        "                추천수                                                                                     " +
        "            </th>                                                                                      " +
        "            <!---->                                                                                    " +
        "        </tr>                                                                                          " +
        "    </thead>                                                                                           " +
        "    <tbody>                                                                                            ";

    if (boardList === null || boardList.length === 0) {
        tag += "<tr><td colspan='4' class='blocked_list'>작성 한 게시글이 없습니다.</td></tr>";
        document.getElementById("post_btns").style.display = "hidden";

    } else {
        for (let boa of boardList) {
            tag += "        <tr>                                                                                           " +
                "            <td class='td_article'>                                                                    " +
                "                <div class='check_box only_box'>                                                       " +
                "                    <div class='FormInputCheck'>                                                       " +
                "                        <input id='check_article_" + boa.boardNo + "' type='checkbox'class='input_check' value=" + boa.boardNo + ">        " +
                "                            <label for='check_article_" + boa.boardNo + "' class='label'>                        " +
                "                                <span class='blind'>선택</span></label></div>                            " +
                "                </div>                                                                                 " +
                "                <div class='board-number'>                                                             " +
                "                    <div class='inner_number'>                                                         " +
                boa.boardNo +
                "                    </div>                                                                             " +
                "                </div>                                                                                 " +
                "                <div class='board-list'>                                                               " +
                "                    <div class='inner_list'>                                                           " +
                "                        <a href='/board/content/" + boa.boardNo + "' target='_blank' class='article'>                     " +
                boa.shortTitle +
                "                        </a>                                                                           " +
                "                        <a href='/board/content/" + boa.boardNo + "' target='_blank' class='cmt'>       " +
                "                            [<em>" + boa.replyCount + "</em>]                                            " +
                "                        </a>                                                                           " +
                "                                                                                                       " +
                "                    </div>                                                                             " +
                "                </div>                                                                                 " +
                "            </td>                                                                                      " +
                "            <td class='td_date'>                                                                       " +
                formatDate(boa.regDate) +
                "            </td>                                                                                      " +
                "            <td class='td_view'>                                                                       " +
                boa.viewCnt +
                "            </td>                                                                                      " +
                "            <td class='td_like'>                                                                       " +
                boa.likeCnt +
                "            </td>                                                                                      " +
                "        </tr>                                                                                          ";


        }
        tag += "</tbody>" +
            "</table>" +
            "</div>";

            document.getElementById("post_btns").style.display = "block";


    }

    // 목록에 생성된 게시판 DOM 추가
    document.getElementById("member_profile").innerHTML = tag;

    


    // 페이지 렌더링
    makePageDOM(maker);

    checkkAll();



}

function makePageDOM(pageInfo) {
    let tag = "";
    const begin = pageInfo.beginPage;
    const end = pageInfo.endPage;
    //이전 버튼 만들기
    if (pageInfo.prev) {
        tag += "<li class='page-item'><a class='page-link page-active' href='" + (begin - 1) +
            "'>이전</a></li>";
    }
    //페이지 번호 리스트 만들기
    for (let i = begin; i <= end; i++) {
        let active = '';
        if (pageInfo.page.pageNum === i) {
            active = 'p-active';
        }

        tag += "<li class='page-item " + active + "'><a class='page-link page-custom' href='" + i +
            "'>" + i + "</a></li>";
    }
    //다음 버튼 만들기
    if (pageInfo.next) {
        tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
            "'>다음</a></li>";
    }

    // 페이지태그 렌더링
    const $pageUl = document.querySelector('.pagination');
    $pageUl.innerHTML = tag;

    // ul에 마지막페이지 번호 저장.
    $pageUl.dataset.fp = pageInfo.finalPage;


}

function makePageButtonClickEvent() {
    // 페이지 버튼 클릭이벤트 처리
    const $pageUl = document.querySelector('.pagination');
    $pageUl.onclick = e => {
        if (!e.target.matches('.page-item a')) return;

        e.preventDefault();
        // 누른 페이지 번호 가져오기
        const pageNum = e.target.getAttribute('href');
        // console.log(pageNum);

        // 페이지 번호에 맞는 목록 비동기 요청
        if (type === "reply") showReplies(pageNum);
        else if (type === "board") showBoardList(pageNum);
    };
}

function openRemoveEvent() {


    const $delBtn = document.getElementById("delBtn");
    $delBtn.onclick = e => makeDelHandler(e);

}

function makeDelHandler(e) {

    console.log("makeDelHandler 실행")
    
    e.preventDefault();
    if (!e.target.matches('#delBtn')){return;}
     

        

        $checkList = document.querySelectorAll(".input_check")
        
        var delArray = [];
        let msgList=[];


        if (!confirm('진짜로 삭제합니까??')) return;

        if ($checkList != null) {

            $checkList.forEach(function (array) {
                console.log(array)


                if (array.checked) delArray.push(array.value);

            });

            for (let dNo of delArray) {
                
                msgList.push(processRemove(dNo));

            }
            if (!msgList.includes("del-fail")) {
                alert('삭제 성공!!');
                console.log(type)
                if (type === "reply") showReplies();
                else if (type === "board") showBoardList();
            } else {
                alert('삭제 실패!!');
                console.log(type)
                if (type === "reply") showReplies();
                else if (type === "board") showBoardList();
            }


        } else {
            alert("체크한 목록이 없습니다.");
            return;
        }

    


}

function processRemove(dNo) {

    let msgList = [];
    if (type === "reply") {
        fetch("/api/v1/replies/" + dNo, {
            method: 'DELETE'
        })
            .then(res => res.text())
            .then(msg => {
                msgList.push(msg);
                return msgList;

            });
    } else if (type === "board") {

        fetch("/board/" + dNo, {
            method: 'DELETE'
        })
            .then(res => res.text())
            .then(msg => {
                msgList.push(msg);
                return msgList;

            });

    }
}



// 댓글 목록을 서버로부터 비동기요청으로 불러오는 함수
function showReplies(pageNum = 1) {

    fetch(URL + '/reply' + '?pageNum=' + pageNum + '&amount=6')
        .then(res => res.json())
        .then(replyMap => {
            // console.log(replyMap.replyList);
            makeReplyDOM(replyMap);
        });
}

// 게시글 목록을 서버로부터 비동기요청으로 불러오는 함수
function showBoardList(pageNum = 1) {

    console.log("showBoardLis 호출")

    fetch(URL + '/board' + '?pageNum=' + pageNum)
        .then(res => res.json())
        .then(boardMap => {
            // console.log(boardMap.bardList);
            makeBoardDOM(boardMap);
        });
}





function MemberReplies() {

    // 초기 화면 렌더링시 댓글 1페이지 렌더링
    showReplies();

    // 댓글 페이지 버튼 클릭이벤트 처리
    makePageButtonClickEvent();


    // 삭제 이벤트
    openRemoveEvent();

}

function MemberBoardList() {

    console.log("MemberBoardLis 호출")

    // 초기 화면 렌더링시 댓글 1페이지 렌더링
    showBoardList();


    // 댓글 페이지 버튼 클릭이벤트 처리
    makePageButtonClickEvent();

    // 삭제 이벤트
    openRemoveEvent();


}
function MemberProfile(){


    
    
}

function MemberEvent() {

    $nav = document.getElementById("myPageNav");
   
    $nav.onclick = e => {

        e.preventDefault();

        var unActive = type;

        if (e.target.matches('.board')) {
            
            type = "board";
            
        } else if (e.target.matches('.reply')) {
            
            type = "reply";
            
        } else if (e.target.matches('.profile')) {
            
            type = "profile";
           
        }else{
            return;
        }

        processMenuEvent(unActive);




    }

}




function processMenuEvent(unActive){

    var active = type;

    $deactivateTag = document.querySelector("."+unActive);
    $deactivateTag.classList.remove('active');
    
    $activeTag = document.querySelector("."+active);
    $activeTag.classList.add('active');



    if(type==="board"){
        MemberBoardList();
    }else if(type==="reply"){
        MemberReplies();
    }else if(type==="profile"){
        MemberProfile();
    }



}

function checkkAll(){

    $chk_all= document.getElementById("chk_all");
    $checkList = document.querySelectorAll(".input_check");

    console.log($checkList);

    $chk_all.onclick = e =>{ 

        for($check of $checkList){
        $check.checked = $chk_all.checked;
        }

    
    }

}




(function () {


    console.log("myPage.js 호출");

    // 초기화면 내 게시글로 설정
    MemberBoardList();

    console.log("MemberEvent 호출");
    // 메뉴 이벤트 추가
    MemberEvent();
    




})();



