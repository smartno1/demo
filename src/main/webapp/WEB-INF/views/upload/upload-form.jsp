<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h1>upload-form</h1>

<form id="upload-form" action="/upload" method="POST" enctype="multipart/form-data">
    파일 : <input type="file" name="file" id="file">
    <span id="checkLog"></span><br>
    파일 설명 : <input type="text" name="fileText"><br>
    <button id="upload-btn" type="submit">업로드</button>

</form>


<script>

    let check= false;

    function fileCheckEvent() {

        document.getElementById('file').onchange = e => {

            console.log(e.target);
            const $checkLog = document.getElementById("checkLog");
            // 파일 업로드 확장자 체크
            console.log(e.target.value);
            if (e.target.value != "") {
                const ext = e.target.value.split('.').pop().toLowerCase();
                const list = ['gif', 'png', 'jpg', 'jpeg', ]
                // console.log(ext);
                // console.log(list[0]);
                // 파일확장자 비교
                for (let i in list) {
                    // console.log(list[i]);
                    if (ext == list[i]) {
                        check = true;

                    }
                }
                console.log(check);
                // 확장자 체크
                if (check != true) {
                    $checkLog.innerHTML =
                        `<b class="c-red" style="color: red">[파일확장자를 확인하세요][gif, png, jpg, jpeg]</b>`;
                    return;
                } else {
                    // 파일용량 체크
                    if (e.target.files[0].size > 10 * 1024 * 1024) {
                        $checkLog.innerHTML =
                            `<b class="c-red" style="color: red">[파일용량 초과 (최대:10MB) ]</b>`;
                        return;
                    } else {
                        e.target.style.borderColor = 'skyblue';
                        $checkLog.innerHTML = `<b class="c-blue" style="color: yellowgreen">[업로드가능한 파일입니다.]</b>`;
                    }
                }
            }
        }
    }



    (function (){
        const $uploadBtn = document.getElementById('upload-btn');
        const $uploadForm = document.getElementById('upload-Form');

        fileCheckEvent();
        console.log(check);

        $uploadBtn.addEventListener("click", (e) => {
            e.preventDefault();
            if (check == true) {
                $uploadForm.submit();
            } else {
                alert('파일을 다시 확인하세요');
            } e.preventDefault()
        });
    })();

</script>
</body>
</html>

