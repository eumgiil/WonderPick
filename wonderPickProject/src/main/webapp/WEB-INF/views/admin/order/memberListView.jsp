<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>회원전체조회</title>
<style>
.all_area {
   /* background-color:rgb(247, 245, 245); */
   width: 900px;
   margin: auto;
   margin-top: 150px;
}

.reportList-area {
   border: 1px solid white;
   width: 600px;
   box-sizing: border-box;
   text-align: center;
}

.reportList-area thead {
   background-color: rgb(238, 238, 238);
   font-weight: 300;
   border-top: 1.5px solid rgb(138, 138, 138);
   border-bottom: 1.5px solid rgb(138, 138, 138);
   border-right: 2px solid white;
   border-left: 2px solid white;
}

.reportList:hover {
   background-color: rgb(237, 237, 237);
}

.reportList-area tr {
   border-bottom: 1px solid rgb(181, 181, 181);
   height: 40px;
}

#pagingArea {
   width: fit-content;
   margin: auto;
}

.thid {
   width: 20%;
}

.thNickname {
   width: 20%;
}

.report {
   width: 20%;
}

.thDate {
   width: 20%;
}

.thgrade {
   width: 20%;
}

#searchForm {
   width: 600px;
   margin: auto;
}

#searchForm>* {
   float: left;
   margin: 5px;
}

.select {
   width: 20%;
}

.text {
   width: 53%;
}

.searchBtn {
   width: 20%;
}

</style>
</head>
<body>
   <div class="all_area">


      <h2 align="center" style="color: rgb(255, 131, 153);">회원관리</h2>
      <hr style="width: 600px; border: 1px solid gray;">
      <br> <br>

      <table align="center">



      <div class="allList" id="allList">
         <table class="allTable reportList-area" align="center">
            <thead>
               <tr>
                  <th class="id">아이디</th>
                  <th class="thNickname">닉네임</th>
                  <th class="status">회원상태</th>
                  <th class="thDate">가입일</th>
                  <th class="thgrade">회원 등급</th>

               </tr>
            </thead>
            <tbody>
               <c:forEach items="${list }" var="m">
                  <tr>
                     <td class="mno">${m.memberId }</td>
                     <td>${m.nickName}</td>
                     <td>${m.status}</td>
                     <td>${m.enrollDate}</td>
                     <td>${m.memberGrade}</td>
                  </tr>
               </c:forEach>


            </tbody>

         </table>

         <br> <br>



      </div>


    




      <br> <br>

     



   </div>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
</body>
</html>