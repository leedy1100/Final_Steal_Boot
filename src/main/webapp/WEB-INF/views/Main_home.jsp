<%@page import="com.steal.bs.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business support</title>

<link rel="shortcut icon" href="image/stealLogo.ico">

<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<link href="css/Main_login.css" rel="stylesheet" type="text/css">
<link href="css/Main_home.css" rel="stylesheet" type="text/css">
<link href="css/Main_signup.css" rel="stylesheet" type="text/css">
<link href="css/Main_search.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_home.js" ></script>
<script type="text/javascript" src="js/Main_login.js" ></script>
<script type="text/javascript" src="js/Main_signup.js" ></script>
<script type="text/javascript" src="js/Main_search.js" ></script>

<style type="text/css">
.mycontent {
    padding-inline-start: 0px;
}
.mycontent li{
	list-style: none;
	display: inline-block;
	font-weight: 700;
	border-left: 2px solid black;
	padding-left: 8px;	
	line-height: 85%;
}
.mycontent li:first-child{
	border: none;
}
.mycontent li a{
	text-decoration: none;
	color: black;
}
.mycontent li :hover{
	color: black;
	font-weight: 1000;
}

</style>

<script type="text/javascript">


</script>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String name = "";
    String user = "anonymousUser";
    if(principal != null) {
        name = auth.getName();
    }
    if(!principal.equals(user)){
%>	
	<script type="text/javascript">
		
		$(function(){
			$("#userpageform").hide();
			$("#mainpage").css("opacity","1");
			$("#myinfo").show();
		});
	
	</script>
<%
	}
%>
</head>
<body>
	
	<div id="mainpage">
	
		<div id="background"></div>
		
		<div id="conference" onclick="conference()" style="cursor:pointer">
			<p style="cursor:pointer">화상회의</p>
			<div id="conferenceform">
				<a href="chathome.chat?id=<%= name %>">채팅방 가기</a>
			
			</div>
		</div>
		
		<div id="myinfo">
			<sec:authorize access="isAuthenticated()">
				<ul class="mycontent">
					<li><%=name %>님 <a href="../myinfo.main?id=<%=name %>">개인정보</a></li>
					<li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
<%
if(name.equals("zongyeng")){
%>
					<li><a href="admin/employeelist">사원목록</a></li>
<%
}
%>
				</ul>
				<form id="logout-form" action='<c:url value='/logout.main'/>' method="POST">
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			</sec:authorize>
		</div>
		
		<div id="decision" onclick="decision()" style="cursor:pointer">
			<p style="cursor:pointer">문서결재</p>
		</div>
		
		<div id="calendar" onclick="calendar()" style="cursor:pointer">
			<p style="cursor:pointer">일정관리</p>
		</div>
		
	</div>
	
	<div id="userpageform">
		<div id="loginform">
			<form action="login.main" method="post" id="loginformsubmit">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="login">
					<h1>LOGIN</h1>
				</div>
				<div class="input_box">
					<div>
						<input type="text" placeholder="ID" name="main_id" id="id" onkeyup="enterkey()">
						<input type="password" placeholder="PASSWORD" name="main_password" id="password" onkeyup="enterkey()">
					</div>
				</div>
				<div class="login_box" style="margin-bottom: 15px;">
					<div>
					<input type="button" class="ir" value="로그인" onclick="loginidchk()"><br/>
					</div>
				</div>
			</form>
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<font color="red">
					<p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p> 
					<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
				</font>
			</c:if>
			<div class="sub">
				<ul>
					<li><a href="#" onclick="idsearch()">아이디 찾기</a></li>
					<li><a href="#" onclick="pwsearch()">비밀번호 찾기</a></li>
					<li><a href="#" onclick="signup()">회원가입</a></li>
				</ul>
			</div>
		</div>
			
		<div id="signupform">
			<form action="signup.main" method="post" >
				<br/>
				<h1>회원가입</h1>
				<p>모두 입력해 주세요.</p>
	
				<label>Name <span class="small">이름 입력</span></label>
				<input type="text" name="main_name" id="main_name" />
				
				<label>ID <span class="small">아이디 입력</span>
				</label> <input type="text" name="main_id" id="main_id" />
				<input type="button" onclick="idchk()" id="chk0" class="chk" value="중복체크" />
	
				<label>Password <span class="small">패스워드 9자이상</span></label>
				<input type="password" name="main_password" id="main_password" placeholder="숫자+문자+특수문자" />
				
				<label>Password<span class="small">패스워드 확인</span></label>
				<input type="password" name="password1" id="password1" />
				<input type="button" onclick="pwchk()" id="chk1" class="chk" value="PW유효성검사" />
				
				<label>sex<span class="small">성별</span>	</label>
				<select name="main_sex" id="main_sex" >
					<option selected="selected">선택하세요</option>
					<option value="M">남자</option>
					<option value="F">여자</option>
					<option value="X">X</option>
				</select>
				
				<label>Phone <span class="small">전화번호 입력</span></label>
				<input type="text" name="main_phonenumber" id="main_phonenumber" placeholder="xxx-xxxx-xxxx" />
				
				<label>Email<span class="small">이메일주소</span></label>
				<input type="text" name="main_email" id="main_email" />
				
				<label>Birth<span class="small">생년월일</span></label>
				<input type="number" name="main_birth" id="main_birth" placeholder="주민번호 앞 6자리"/>
				
				<label>EMP<span class="small">사워번호</span></label>
				<input type="text" name="main_emp" id="main_emp"  />
				<input type="button" onclick="empchk()" id="chk2" class="chk" value="사원번호 확인" />
				
				<input class="ck1" type="button" id="submit" onclick="signupchk()" value="회원가입" >
				<input type="submit" id="submitsum" />
				<br/>
				<br/>
				<button class="ck1" type="button" onclick="login()">뒤로가기</button>
			</form>
		</div>

		<div id="idsearchform">
			<div class="idsearch">
				<h1>아이디 찾기</h1>
			</div>
			<div class="input_box">
				<div>
					<input type="text" placeholder="이름" name="main_name" id="name" >
					<input type="number"  placeholder="생년월일 6자리" name="main_birth" id="birth" >
				</div>
			</div>
			<div class="idsearch_box" style="margin-bottom: 15px;">
				<div>
					<input type="button" class="ir" value="완료" onclick="idsearchchk()"><br/><br/>
					<input type="button" class="ir" value="돌아가기" onclick="idsearchbeck()"><br/>
				</div>
			</div>
		</div>
		
		<div id="pwsearchform">
			<div class="pwsearch">
				<h1>패스워드 찾기</h1>
			</div>
			<div class="input_box">
				<div>
					<input type="text" placeholder="이름" name="main_name" id="pwsearchname" >
					<input type="text" placeholder="가입시 입력한 email 주소" name="main_email" id="pwsearchemail" >
					<input type="text" placeholder="인증번호" id="verificationcode" >
				</div>
			</div>
			<div class="pwsearch_box" style="margin-bottom: 15px;">
				<div>
					<input type="button" class="ir" value="인증번호 보내기" onclick="pwsearchchk1()" id="pwsearchchk1"  ><input type="button" class="ir" value="완료" onclick="confrom()" id="pwsearchchk"><br/><br/>
					<input type="button" class="ir" value="돌아가기" onclick="pwsearchbeck()"><br/>
				</div>
			</div>
		</div>
		
	</div>

</body>

</html>