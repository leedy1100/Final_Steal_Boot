<%@page import="com.steal.bs.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business support</title>

<link rel="shortcut icon" href="image/stealLogo.ico">
<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<link href="css/Main_pwchange.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_myinfo.js" ></script>

</head>
<body>
<div id="myinfoform">
		<form action="infoupdate.main" method="post" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="main_seq" id="main_seq" value="${userinfo.main_seq}">
			<input type="hidden" name="main_phonenumber" id="main_phonenumber" placeholder="xxx-xxxx-xxxx" value="${userinfo.main_phonenumber}" />
			<input type="hidden" name="main_email" id="main_email" value="${userinfo.main_email }" />
			<br/>
			<h1>새로운 비밀번호 설정</h1>
			<p></p>
			<label>Password <span class="small">패스워드 9자이상</span></label>
			<input type="password" name="main_password" id="main_password" placeholder="숫자+문자+특수문자" />
			<label>Password<span class="small">패스워드 확인</span></label>
			<input type="password" name="password1" id="password1" />
			<input type="button" onclick="pwchk()" id="chk1" class="chk" value="PW유효성검사" />
			<input class="ck1" type="button" id="submit" onclick="update()" value="확인" >
			<input type="submit" id="submitsum"/>
			<br/>
			<input class="ck2" type="button" onclick="back()" value="뒤로가기" />
		</form>
	</div>
</body>
</html>