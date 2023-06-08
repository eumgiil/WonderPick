<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공모전신청페이지</title>
    <style>
        #all_area{
            box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
            border-radius: 20px;
            margin: auto;
            width: 800px;
            padding: 20px;
        }
        h1{
            color : rgb(255, 131, 153);
        }
        .noImge{
            width: 100px;
            height: 100px;
            margin: auto;
        }
        #thumnailImage{
            width: 200px;
            height: 200px;
        }
        #input_file{
            margin: 30px;
        }
        #emg_title{
            width: 500px;
            height: 40px;
            border-radius: 20px;
        }
        #emg_price{
            width: 300px;
            height: 30px;
            border-radius: 20px;
        }
        hr{
            background:pink;
            height:1px;
            border: 0;
            width: 90%;
        }


    </style>
</head>
<body>

    <form action="insertContest.ct" method="post" enctype="multipart/form-data">
        <div id="all_area" align="center">
        <div id="enroll_title">
            <span><h1>공모전 참가/등록</h1></span>
            <hr>
        </div>
        <div>
            <img src="/resources/no-image.svg" class="noImge" id="thumnailImage">
        </div>
        <div>
            <img src="/resources/no-image.svg" class="noImge" id="Image1">
            <img src="/resources/no-image.svg" class="noImge" id="Image2">
            <img src="/resources/no-image.svg" class="noImge" id="Image3">
            <img src="/resources/no-image.svg" class="noImge" id="Image4">
        </div>
        <div id="input_file">
            1. <input type="file"  name="thumbnailUpFile" required onchange="thumbnailReadURL(this,1)"><br>
            2. <input type="file"  name="upFile" onchange="thumbnailReadURL2(this,2)"><br>
            3. <input type="file"  name="upFile" onchange="thumbnailReadURL3(this,3)"><br>
            4. <input type="file"  name="upFile" onchange="thumbnailReadURL4(this,4)"><br>
            5. <input type="file"  name="upFile" onchange="thumbnailReadURL5(this,5)"><br>
            
        </div>
        <div>
            * 이모티콘(사진)등록은 최소 1장 필수이며, 최대 5장까지 첨부가능합니다.
            <br>
        </div>
        <br><hr>
        <div>
            <br>
            <span>[ 희망가격 ]</span><br><br>
            <span>* 최소 2000원부터 최대 3만원까지 입력가능합니다.</span><br>
            <span>* 등록 후 수정이 불가능 하오니 신중하게 입력해주세요.</span><br>
            <input type="number" name="price" value="" min="2000" max="30000" id="emg_price" required > 원
            <input type="hidden" name="boardType" value="C">
           <%--  <input type="hidden" name="${ sessionScope.loginUser.memberNo }"> --%>
            
        </div>
        <br><hr>
        <div>
            <br>
            <span>[ 이모티콘 제목 또는 이름 ]</span><br><br>
            <div>
                <input type="text" name="boardTitle" placeholder="이모티콘 제목 또는 이름을 입력해주세요." id="emg_title" required>
            </div>
        </div>
        <div>
            <br>
            <span>[ 이모티콘 설명 ]</span><br><br>
            <div>
                <textarea name="boardContent" name="" id="" cols="80" rows="30" placeholder="내용을 입력해주세요." required></textarea>
            </div>
        </div>
        <br><br><br><br><br>
        <div>
            <span>등록하신 순서대로 업로드 됩니다.(선착순)</span><br>
            <button type="submit">등록하기</button>
            <br><br>
        </div>

    </div>

    </form>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    
  <script>
        function thumbnailReadURL(input,){
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('thumnailImage').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('thumnailImage').src = "";
            }
        }
        function detailReadURL(input){
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('Image1').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('Image1').src = "";
            }
        }
    </script>
    



</body>
</html>