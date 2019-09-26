<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<link href="css/Main_myinfo.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_myinfo.js" ></script>

</head>
<body>

	<div id="myinfoform">
		<form action="infoupdate.main" method="post" id="test" >
			<input type="hidden" name="command" value="updateres">
			<br/>
			<h1>내 정보</h1>
			<p></p>

			<label>Name <span class="small">이름</span></label>
			<input type="text" name="main_name" id="main_name" readonly="readonly" value="${userinfo.main_name}" style="background-color:rgb(232,240,254)" />
			
			<label>ID <span class="small">아이디</span></label>
			<input type="text" name="main_id" id="main_id" readonly="readonly" value="${userinfo.main_id}" style="background-color:rgb(232,240,254)" />

			<label>Password <span class="small">패스워드 9자이상</span></label>
			<input type="password" name="main_password" id="main_password" placeholder="숫자+문자+특수문자" />
			
			<label>Password<span class="small">패스워드 확인</span></label>
			<input type="password" name="password1" id="password1" />
			<input type="button" onclick="pwchk()" id="chk1" class="chk" value="PW유효성검사" />
			
			<label>sex<span class="small">성별</span></label>
			<input type="text" name="main_sex" id="main_sex" readonly="readonly" value="${userinfo.main_sex}" style="background-color:rgb(232,240,254)" />
			
			<label>Phone <span class="small">전화번호 입력</span></label>
			<input type="text" name="main_phonenumber" id="main_phonenumber" placeholder="xxx-xxxx-xxxx" value="${userinfo.main_phonenumber}" />
			
			<label>Email<span class="small">이메일주소</span></label>
			<input type="text" name="main_email" id="main_email" value="${userinfo.main_email }" />
			
			<label>Birth<span class="small">생년월일</span></label>
			<input type="text" name="main_birth" id="main_birth" placeholder="주민번호 앞 6자리" readonly="readonly" value="${userinfo.main_birth}" style="background-color:rgb(232,240,254)" />
			
			<label>EMP<span class="small">사워번호</span></label>
			<input type="text" name="main_emp" id="main_emp" style="background-color:rgb(232,240,254)" />
			
			<input class="ck1" type="button" id="submit" onclick="update()" value="정보 수정" >
			<input type="submit" id="submitsum" />
			<br/>
			<br/>
			<button class="ck1" type="button" onclick="delete()">회원탈퇴</button>
			<br/>
			<br/>
			<button class="ck1" type="button" onclick="back()">뒤로가기</button>
		</form>
	</div>

</body>
</html>