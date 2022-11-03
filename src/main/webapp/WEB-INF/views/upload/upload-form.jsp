<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <style>
        a {color: #fff; text-decoration: none; outline: none}
        a:hover, a:active {text-decoration: none; }

        body{
            position: relative;
            width: 100%;
            height: 100vh;
        }


    </style>
</head>
<body>
<div class="upLoad">
    <h1>이미지를 올려주세요!</h1>

    <form id="upload-form" action="/upload" method="POST" enctype="multipart/form-data">
         <input type="file" name="file" id="file-input">
        <div id="checkLog"></div>
        <p>코멘트 </p> <textarea id="text-input" onkeypress="Check()" type="text" name="fileText" maxlength="50"></textarea>
        <button id="upload-btn" type="submit">업로드</button>
    </form>
</div>

<script>

    let check= false;

    function fileCheckEvent() {

        document.getElementById('file-input').onchange = e => {
            check= false;
            console.log(e.target);
            const $checkLog = document.getElementById("checkLog");
            // 파일 업로드 확장자 체크
            console.log(e.target.value);
            if (e.target.value !== "") {
                const ext = e.target.value.split('.').pop().toLowerCase();
                const list = ['gif', 'png', 'jpg', 'jpeg', ]
                // console.log(ext);
                // console.log(list[0]);
                // 파일확장자 비교
                for (let i in list) {
                    // console.log(list[i]);
                    if (ext === list[i]) {
                        check = true;

                    }
                }
                console.log(check);
                // 확장자 체크
                if (check !== true) {
                    $checkLog.innerHTML =
                        `<b class="c-red" style="color: red">[파일확장자를 확인하세요]<br>[gif, png, jpg, jpeg]</b>`;
                    return;
                } else {
                    // 파일용량 체크
                    if (e.target.files[0].size > 10 * 1024 * 1024) {
                        $checkLog.innerHTML =
                            `<b class="c-red" style="color: red">[파일용량 초과 (최대:10MB) ]</b>`;
                            check = false;
                        return;
                    } else {
                        e.target.style.borderColor = 'skyblue';
                        $checkLog.innerHTML = `<b class="c-blue" style="color: limegreen">[업로드가능한 파일입니다.]</b>`;
                    }
                }
            }

            const $uploadBtn = document.getElementById('upload-btn');
            const $uploadForm = document.getElementById('upload-form');
            $uploadBtn.addEventListener("click", (e) => {
                e.preventDefault();
                if (check === true) {
                    $uploadForm.submit();
                } else {
                    alert('파일을 다시 확인하세요');
                }
            });
        }
    }
let enter = 0;
    function Check() {
        if(event.keyCode===13){
            enter = enter + 1
        }
        if(enter > 2){
            alert("3줄로 제한됩니다.")
            event.returnValue=false;
            enter = 0;
        }
    }

    (function (){

        fileCheckEvent();
        console.log(check);

    })();

</script>
</body>
</html>

