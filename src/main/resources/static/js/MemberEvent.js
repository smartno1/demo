function MemberEvent() {

    $nav = document.getElementById("myPageNav");

    $nav.onclick = e => {
        if (e.target.matches('.myBoard')) {
            e.preventDefault();
            function MemberBoardList();
        } else if (e.target.matches('.myReply')) {
            e.preventDefault();
            function MemberReplies();
        } else if (e.target.matches('.myProfile')) {
            e.preventDefault();
            return;
        }


    };

}
