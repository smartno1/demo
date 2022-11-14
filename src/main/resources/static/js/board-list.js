function alertServerMessage() {
     

    if (msg === 'reg-success') {
        alert('게시물이 정상 등록되었습니다.');
    }
}


function detailEvent() {
    //상세보기 요청 이벤트
    const $table = document.querySelector(".articles");


    $table.addEventListener('click', e => {


        if (!e.target.matches('.articles td')) return;

        console.log('tr 클릭됨! - ', e.target);

        let bn = e.target.parentElement.firstElementChild.textContent;
        console.log('글번호: ' + bn);

        if(sType!==null && sKeyword!==null){
        location.href = "/board/content/" + bn + "?pageNum=" + pageNum + "&amount=" + amount + "&type=" + sType + "&keyword=" + sKeyword;
        }else{
         location.href = "/board/content/" + bn + "?pageNum=" + pageNum + "&amount=" + amount;
        }

    });
}

//현재 위치한 페이지에 active 스타일 부여하기
function appendPageActive() {

    // 현재 내가 보고 있는 페이지 넘버
    const curPageNum = pageNum;
    // console.log("현재페이지: ", curPageNum);

    // 페이지 li태그들을 전부 확인해서 
    // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
    // li를 찾아서 class active 부여
    const $ul = document.querySelector('.pagination');

    for (let $li of [...$ul.children]) {
        if (curPageNum === $li.dataset.pageNum) {
            $li.classList.add('active');
            break;
        }
    }

}

// 옵션태그 고정
function fixSearchOption() {
    const $select = document.getElementById('search-type');

    for (let $opt of [...$select.children]) {
        if ($opt.value === sType) {
            $opt.setAttribute('selected', 'selected');
            break;
        }
    }
}

function appendAmountActive(){

 
    $amount = document.querySelector(".amount");

  

    if(amount===null||amount==="10")
    {   
        $amount.children[0].classList.add("active");
    }else if(amount==="20"){
        $amount.children[1].classList.add("active");
    }else if(amount==="30"){
        $amount.lastElementChild.classList.add("active");
    }



}


(function () {

    alertServerMessage();
    detailEvent();
    appendPageActive();
    fixSearchOption();
    appendAmountActive()

})();

