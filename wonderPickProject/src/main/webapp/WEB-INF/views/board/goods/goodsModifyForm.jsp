<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>굿즈등록상품 수정페이지</title>
    <style>
        .wide{
         
        }
       
    </style>
</head>
<body>
    <div class="topouter">
        <h2 style="color: rgb(255, 131, 153); font-weight: bolder;" align="center">굿즈 상품 등록</h2>
        <hr style="border: 1px solid gray; width: 500px;" >
        <br>

        <form action="" method="post">
        <table  width="00px" style="text-align: center; " align="center">
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">카테고리</h5></td>
                <td style="float: left; margin-left: 80px;">
                    <select name="goodsCategory" id="">
                        <option value="FASHION">패션</option>
                        <option value="STATIONERY">문구</option>
                        <option value="KITCHEN">주방</option>
                        <option value="INTERIOR">인테리어</option>
                        <option value="ETC">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">상품명</h5></td>
                <td colspan="3"><input type="text" style="width: 85%;" name="boardTitle"></td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">상품가격</h5></td>
                <td ><input type="number" style="width: 50%;" name="price">원 </td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">상품 대표 이미지</h5></td>
                <td align="center" colspan="3">
                    <img id="titleimg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="">
                </td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">상세이미지</h5></td>
                <td><img id="contentImg1" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="" width="200" height="200"></td>
                <td><img id="contentImg2" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="" width="200" height="200"></td>
                <td><img id="contentImg3" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="" width="200" height="200"></td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">상품설명</h5></td>
                <td colspan="3"><textarea name="boardContent" id="" cols="30" rows="10" style="width: 100%;"></textarea></td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">작업소요일</h5></td>
                <td style="float: left;"><input type="number" style="width: 45%;" name="workday">일</td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">시안개수</h5></td>
                <td style="float: left; margin-left: 80px;"><select name="draft" id="">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
               </td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">추가시안비</h5> </td>
                <td style="float: left;">갯수별  <input type="number" style="width: 40%;" name="addDraft">원</td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">기본수정횟수</h5></td>
                <td style="float: left;"><input type="number" style="width: 45%;" name="modifyCount">회</td>
            </tr>
            <tr>
                <td class="wide"><h5 style="font-weight: bolder;">추가수정비</h5></td>
                <td style="float: left;">횟수별  <input type="number" style="width: 40%;" name="addModify">원</td>
            </tr>
            <tr>
                <td colspan="4"><hr style="width: 80%; border: 1px solid gray;"></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4" align="center"><div class="btn btn-info" style="width: 50%; height: 40px; 
                background-color:  rgb(255, 131, 153); color: black; border: none;">굿즈 판매 요청하기</div></td>
                <td></td>
            </tr>
    </table>
    </form>

    </div>

    <script>
    // 숫자 3자리 콤마찍기

        Number.prototype.formatNumber = function(){

            if(this==0) return 0;

            let regex = /(^[+-]?\d+)(\d)/;

            let nstr = (this + '');

            while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');

            return nstr;

        };
    </script>
         

    <div id="file-area">
        <input type="file" id="file1" name="file1" required onchange="loadImg(this, 1);">
        <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
        <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
        <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);">
    </div>

    <script>

        $(function(){
            $('#file-area').hide(); 
            
            $('#titleimg').click(function(){ 
                $('#file1').click();
            })

            $('#contentImg1').click(function(){ 
                $('#file2').click();
            })

            $('#contentImg2').click(function(){  
                $('#file3').click();
            })

            $('#contentImg3').click(function(){ 
                $('#file4').click();
            })
        })

        function loadImg(inputFile, num) {

            if(inputFile.files.length == 1){ 
            let reader = new FileReader();
            reader.readAsDataURL(inputFile.files[0]);
            reader.onload = function(e){
                switch(num) {
                                case 1 : $('#titleimg').attr('src', e.target.result); break;
                                case 2 : $('#contentImg1').attr('src', e.target.result); break;
                                case 3 : $('#contentImg2').attr('src', e.target.result); break;
                                case 4 : $('#contentImg3').attr('src', e.target.result); break;
                            }
                        }

} else {
    switch(num) {
            case 1 : $('#titleimg').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
            case 2 : $('#contentImg1').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
            case 3 : $('#contentImg2').attr('src','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
            case 4 : $('#contentImg3').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
        }

}
}
</script>


    
    
</body>
</html>