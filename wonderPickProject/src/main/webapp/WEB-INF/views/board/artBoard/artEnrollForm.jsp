<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>굿즈상품입력페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

        <div >
            <h2 class="title">굿즈 상품 등록</h2>
            <hr class="line">
        </div>
        
        <br>


        <form id="form" method="post" enctype="multipart/form-data">
	        <table id="art_table" align="center">
	            <tbody>
	                <tr>
	                    <th>
	                        <h5 class="sub_title">카테고리</h5>
	                    </th>
	                    <td>
	                        <select id="category" name="category">
	                            <option value="CI">캐릭터 일러스트</option>
	                            <option value="I">일러스트</option>
	                            <option value="V">버츄얼</option>
	                            <option value="D">디자인</option>
	                            <option value="W">웹툰</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품명</h5></th>
	                    <td colspan="3"><input type="text"  name="boardTitle" style="width: 85%;"></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품가격</h5></th>
	                    <td><input type="number" name="price" style="width: 70%;">원 </td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품 대표 이미지</h5></th>
	                    <td align="center" colspan="3">
	                        <img id="titleimg" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="">
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
	                        <textarea name="boardContent" id="boardContent" style="width: 100%; height:400px; resize:none;" maxlength="1000"></textarea>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><h5 class="sub_title">파일유형</h5></th>
	                    <td><input type="text" name="fileType"></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">해상도</h5> </th>
	                    <td><input type="text" name="dpi"></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">기본사이즈</h5></th>
	                    <td><input type="text" name="defaultSize"></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">기본수정횟수</h5></th>
	                    <td><input type="number" name="modifyCount"></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">작업기간</h5></th>
	                    <td><input type="text" name="workday"></td>
	                </tr>
	                <tr>
	                    <th colspan="4"><hr class="line"></th>
	                </tr>
	                <!-- 옵션 -->
	                <tr>
	                    <th colspan="4">
	                        <h5 class="sub_title">옵션</h5>
	                        <button type="button" onclick="op_plus();">메인옵션추가</button>
	                    </th>
	                </tr>
	
	                
	                <!-- 끝 옵션 -->
	            </tbody>
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
	                <td colspan="3"><input type="text" name="" style="width:100%;"></td>
	            </tr>
	            <tr>
	                <th><h5 class="sub_title">문구</h5></th>
	                <td colspan="3"><input type="text" name="" style="width:100%;"></td>
	            </tr>
	            <tr>
	                <th><h5 class="sub_title">주방</h5></th>
	                <td colspan="3"><input type="text" name="" style="width:100%;"></td>
	            </tr>
	            <tr>
	                <th><h5 class="sub_title">인테리어</h5></th>
	                <td colspan="3"><input type="text" name="" style="width:100%;"></td>
	            </tr>
	            <tr>
	                <th><h5 class="sub_title">주방</h5></th>
	                <td colspan="3"><input type="text" name="" style="width:100%;"></td>
	            </tr>
	            <!-- 끝 옵션 -->
	            <tr>
	                <td colspan="5"><hr class="line"></td>
	            </tr>
	            <tr>
	                <td colspan="5" align="center"><div onclick="start();" class="btn btn-info" style="width: 50%; height: 40px; 
	                background-color:  rgb(255, 131, 153); color: black; border: none;">굿즈 판매 요청하기</div></td>
	            </tr>
	        </table>
	        
	        <!-- 
	        <input type="hidden" id="deList" name="deList" value="'+ deList +'">
            <input type="hidden" id="prList" name="prList" value="'+ prList +'">
	        -->
            <input type="hidden" id="options" name="options" value="'+ options +'">
            
            
		    <div style="display:none;" id="file-area">
		        <input type="file" id="file1" name="upfile" required onchange="loadImg(this, 1);">
		        <input type="file" id="file2" name="upfile" onchange="loadImg(this, 2);">
		        <input type="file" id="file3" name="upfile" onchange="loadImg(this, 3);">
		        <input type="file" id="file4" name="upfile" onchange="loadImg(this, 4);">
	    	</div>
	    	
	    </form>
	    

    </div>
         

    

    <br><br><br><br>







    <script>

        /* 옵션+버튼 스크립트 */
        let i = 1;
        let j = 1;
        let num;
        var art_table = document.getElementById('art_table');
        

        function op_plus(){
            let value = '';
            value = '<th>'
                        +'<button type="button" onclick="detail_op_plus(this);" style="float:left;">+</button>'
                        +'<h5 class="sub_title">옵션카테고리'+ i +'</h5></th>'
                    +'<td>'
                        +'<input type="text" name="option_' + i + '" id="option_' + i + '">'
                    +'</td>'
                    +'<th><h5 class="sub_title"></h5></th>'
                    +'<td>'
                        +'<input type="text" readonly id="price_' + i + '">'
                    +'</td>';
            var tbody = document.createElement('tbody');
            tbody.id = ('tbody' + i);
            var tr = document.createElement('tr'); 
            tr.id = ('newTr'+i);

            tr.innerHTML = value;
            tbody.append(tr);
            art_table.append(tbody);
            i++;
        }
        /* 끝 - 옵션+버튼 스크립트 */
        
        function detail_op_plus(e){

        	let tbody = e.parentElement.parentElement.parentElement;
            let id = tbody.id;
            // let str = id.slice(0, id.indexOf('y') + 1);
            num = parseInt(id.slice(id.indexOf('y')+1));
            let value = '';
            value = '<th>'
                        +'<h5>옵션명</h5></th>'
                    +'<td>'
                        +'<input type="text" name="detailOp'+ num +'" class="detailOp'+ num +'">'
                    +'</td>'
                    +'<th><h5>가격</h5></th>'
                    +'<td>'
                        +'<input type="text" name="opPrice'+ num +'" class="opPrice'+ num +'" oninput="this.value = this.value.replace(/[^0-9]/, '')">'
                    +'</td>';
            
            let tr = document.createElement('tr');
            tr.innerHTML += value;
            tbody.append(tr);
            
            
            
        }

        function start(){

            /* tbody개수 파악  */
        	let length = art_table.tBodies.length;

            let deList = [];
            let prList = [];

            let detailOp = [];
            let opPrice = [];

            let option;
            let options = [];

            for(let i = 1; i < length; i++){
                detailOp = document.getElementsByClassName('detailOp' + i);
                opPrice = document.getElementsByClassName('opPrice' + i);
                option = document.getElementById('option_'+ i);

                /*
                deList.push('#'+option.value+'#');
                prList.push('#'+option.value+'#');
                options.push(option.value);

                for(let j = 0; j < detailOp.length; j++){
                    deList.push(detailOp[j].value);
                    prList.push(opPrice[j].value);
                }
                */
            };

            let form = document.getElementById('form');
            /*
            document.getElementById('deList').value = deList;
            document.getElementById('prList').value = prList;
            */
            document.getElementById('options').value = options;
            
            
           	form.action = 'enroll.at';
            form.submit();

        }














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