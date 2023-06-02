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
    <title>êµ¿ì¦ìíìë ¥íì´ì§</title>
    <style>
        .all_area{
            width: 900px;   
            margin: auto;
        }

        table{
            width:750px;
            table-layout: fixed; 
        }
        table th{
            text-align: center;
            width:150px;
        }
        .title{
            color: rgb(255, 131, 153);
            font-weight: bolder;
            text-align: center;
        }
        .sub_title{
            font-weight:bolder;
        }
        .contentImg{
            width:100%;
            height:100%;
        }
        .line{
            border: 1px solid gray; width: 800px;
        }
    </style>
</head>
<body>
    <div class="all_area">

        <div>
            <h2 class="title">굿즈 상품 등록</h2>
            <hr class="line">
        </div>
        
        <br>


        <!-- <form> -->
        <table id="art_table" align="center">
            <tr>
                <th>
                    <h5 class="sub_title">카테고리</h5>
                </th>
                <td>
                    <select name="" id="">
                        <option value="">캐릭터 일러스트</option>
                        <option value="">일러스트</option>
                        <option value="">버츄얼</option>
                        <option value="">디자인</option>
                        <option value="">웹툰</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th><h5 class="sub_title">상품명</h5></th>
                <td colspan="3"><input type="text" style="width: 85%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">상품가격</h5></th>
                <td><input type="number" style="width: 70%;">원 </td>
            </tr>
            <tr>
                <th><h5 class="sub_title">상품 대표 이미지</h5></th>
                <td align="center" colspan="3">
                    <img id="titleimg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="">
                </td>
            </tr>
            <tr>
                <th>
                    <h5 class="sub_title">상세이미지</h5>
                </th>
                <td><img id="contentImg1" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
                <td><img id="contentImg2" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
                <td><img id="contentImg3" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">상품설명</h5></th>
                <td colspan="3">
                    <textarea name="" id="" style="width: 100%; height:400px; resize:none;" maxlength="1000"></textarea>
                </td>
            </tr>
            
            <tr>
                <th><h5 class="sub_title">파일유형</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">해상도</h5> </th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">기본사이즈</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">기본수정횟수</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">작업기간</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th colspan="4"><hr class="line"></th>
            </tr>
        <!-- </table>

        <table align="center"> -->
            <!-- 옵션 -->
            <tr>
                <th colspan="4">
                    <h5 class="sub_title">옵션
                    &nbsp;&nbsp;<button onclick="op_plus();">+</butto></h5>
                </th>
            </tr>

            <!-- 추가될 내용 -->
            <tr>
                <th><h5 class="sub_title">제목</h5></th>
                <td>
                    <input type="text" id="option_1">
                </td>
                <th class="price">
                    <h5 class="sub_title">가격</h5>
                </th>
                <td>
                    <input type="text" id="price_1">
                </td>
            </tr>
            <!-- / 추가될 내용 -->

            <!-- 끝 옵션 -->
        </table>

        <br><br>

        <table align="center">
            <tr>
                <th colspan="5">
                    <hr class="line">
                </th>
            </tr>

            <!-- 옵션 -->
            <tr>
                <th colspan="5">
                    <h5 class="sub_title">굿즈 옵션</h5>
                </th>
            </tr>
            <tr>
                <th><h5 class="sub_title">패션</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">문구</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">주방</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">인테리어</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">주방</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <!-- 끝 옵션 -->
            <tr>
                <td colspan="5"><hr class="line"></td>
            </tr>
            <tr>
                <td colspan="5" align="center"><div class="btn btn-info" style="width: 50%; height: 40px; 
                background-color:  rgb(255, 131, 153); color: black; border: none;">굿즈 판매 요청하기</div></td>
            </tr>
        </table>
    <!-- </form> -->

    </div>
         

    <div id="file-area">
        <input type="file" id="file1" name="file1" required onchange="loadImg(this, 1);">
        <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
        <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
        <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);">
    </div>

    <br><br><br><br>












    <script>

        /* 옵션+버튼 스크립트 */
        var i = 2;
        function op_plus(){
            var art_table = document.getElementById('art_table');

            
            let value = '';
            value = '<tr>'
                        +'<th><h5 class="sub_title">제목</h5></th>'
                        +'<td>'
                            +'<input type="text" id="option_' + i + '">'
                        +'</td>'
                        +'<th><h5 class="sub_title">가격</h5></th>'
                        +'<td>'
                            +'<input type="text" id="price_' + i + '">'
                        +'</td>'
                    +'</tr>';
            i++;

            var result = art_table.innerHTML += document.createElement('tr').innerHTML = value;
        }
        /* 끝 - 옵션+버튼 스크립트 */


        /* 이미지버튼 클릭 시 파일area 클릭 */
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