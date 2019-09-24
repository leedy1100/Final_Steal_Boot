<%@page import="com.steal.bs.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<% 
	MainDto userinfo = (MainDto)session.getAttribute("userinfo");
	int logininfo = Integer.parseInt((String)session.getAttribute("logininfo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business support</title>

<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<link href="css/Main_login.css" rel="stylesheet" type="text/css">
<link href="css/Main_home.css" rel="stylesheet" type="text/css">
<link href="css/Main_signup.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_home.js" ></script>
<script type="text/javascript" src="js/Main_login.js" ></script>
<script type="text/javascript" src="js/Main_signup.js" ></script>

<script type="text/javascript">

</script>

<% 
	if(userinfo!=null){
%>
<script type="text/javascript">
	
	$(function(){
		$("#loginform").hide();
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
		
		<div id="conference">
			<p>화상회의</p>
		</div>
		
		<div id="myinfo">
			 
<% 
	if(userinfo!=null){
%>			 
			 -<%= userinfo.getMain_id()%>님 환영합니다-<br/>-<a>내정보 보기</a>- -<a href="logout.main">로그아웃</a>-
<%
	} 
%>			 
			 
		</div>
		
		<div id="decision">
			<p>문서결재</p>
		</div>
		
		<div id="calendar">
			<p>일정관리</p>
		</div>
		
	</div>
	
	<div id="loginform">
		<form action="login.main" method="post" id="loginformsubmit">
			<div class="login">
				<h1>LOGIN</h1>
			</div>
			<div class="input_box">
				<div>
					<input type="text" placeholder="ID" name="main_id" id="id">
					<input type="password" placeholder="PASSWORD" name="main_password">
				</div>
			</div>
			<div class="login_box" style="margin-bottom: 15px;">
				<div>
				<input type="button" class="ir" value="로그인" onclick="loginidchk()"><br/>
				</div>
			</div>
		</form>
		<div class="sub">
			<ul>
				<li><a href="#" onclick="window.open('useridsearch.jsp','searchid','width=456, height=510')">아이디 찾기</a></li>
				<li><a href="#" onclick="window.open('userpasswordsearch.jsp','searchpassword','width=456, height=510')">비밀번호 찾기</a></li>
				<li><a href="#" onclick="signup()">회원가입</a></li>
			</ul>
		</div>
	</div>
	
	<div id="signupform">
		<form action="signup.main" method="post" id="test" >
			<input type="hidden" name="command" value="signupres">
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
			<input type="text" name="main_birth" id="main_birth" placeholder="주민번호 앞 6자리"/>
			
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
	

</body>
<% 
	if(logininfo==1){
%>
<script type="text/javascript">
	
	$(function(){
		alert("비밀번호가 틀렸습니다.")
	});

</script>
<%
		session.setAttribute("logininfo", "0");
	} 
%>
</html>