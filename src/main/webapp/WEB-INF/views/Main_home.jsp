<%@page import="com.steal.bs.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<% 
	MainDto userinfo=null;
	int logininfo = 0;
	try{
		userinfo = (MainDto)session.getAttribute("userinfo");
		logininfo = Integer.parseInt((String)session.getAttribute("logininfo"));
	} catch (Exception e){
		System.out.println("userinfo or logininfo null point exception");
	}
	
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
<link href="css/Main_search.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_home.js" ></script>
<script type="text/javascript" src="js/Main_login.js" ></script>
<script type="text/javascript" src="js/Main_signup.js" ></script>
<script type="text/javascript" src="js/Main_search.js" ></script>

<style type="text/css">



#pwsearchform {
	background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);	
	width: 500px;
    height: 350px;
    text-align: center;
    margin: auto;
    display: none;
}

#pwsearchform *{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

#pwsearchform .pwsearch {
    width: 100%;
    height: 100px;
}

#pwsearchform .pwsearch > h1 {
    padding-top: 30px;
}

#pwsearchform a {
    color: inherit;
    text-decoration: inherit;
}

#pwsearchform input {
    padding: 7px 39px;
    border: 1px solid #dfdfdf;
}

#pwsearchform .input_box {
    width: 100%;
    height: auto;
}
#pwsearchform .input_box > div {
    width: 50%;
    height: 100%;
    margin: 0 auto;
    overflow: hidden;
}
#pwsearchform .input_box > div > input {
    margin: 0 auto;
    margin-bottom: 15px !important;
    
}
#pwsearchform .pwsearch_box {
    width: 100%;
    height: 40px;
}
#pwsearchform .pwsearch_box > div {
    box-sizing: border-box;
    border-radius: 7px;
}
#pwsearchform .pwsearch_box > div > input{
    color:white;
	background-color: black;
	font-size:21px;
}
#verificationcode{
	display: none;
}
#pwsearchchk{
	display: none;
}
</style>

<script type="text/javascript">


function pwsearch(){
	$("#loginform").hide();
	$("#pwsearchform").show();
}

function pwsearchbeck(){
	$("#loginform").show();
	$("#pwsearchform").hide();
}

function pwsearchchk1(){
	$("#pwsearchchk1").val("진행중...");
	$("#pwsearchchk1").attr('disabled', false);
	name = $("#pwsearchname").val();
	var email = $("#pwsearchemail").val();
	name = name.trim();
	
	if(name==""){
		alert("이름을 입력 해 주세요.");
	} else if(email==""){
		alert("email을 입력해 주세요.");
	} else {
		$.ajax({
			url: "pwsearch.main",
			type: "post",
			data: {name:name,email:email},
			success: function(data){
				if(data==""){
					alert("입력하신 정보가 존재하지 않습니다.")
				} else {
					EmailCheckgo(email);
					password = data;
				}
			},
			error: function(request, status, error){
				alert("error 콘솔확인 요망");
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	}
}

function EmailCheckgo(emailchk) {
	$.ajax({
		type : "post",
		url : "http://localhost:8787/bs/EmailCheck.main",
        data:{email:emailchk},
		datatype : "int",
		success : function(data) {
			alert(name+"님 반갑습니다.\n입력하신 이메일로 인증번호가 전송되었습니다.");
			$("#pwsearchform").css("height","380px");
			$("#verificationcode").show();
			$("#pwsearchchk").show();
			$("#pwsearchchk1").hide();
			codenum=data;

			$("#pwsearchchk1").val("인증번호 보내기");
			$("#pwsearchchk1").attr('disabled', true);
		}, error: function(request, status, error){
			alert("error 콘솔확인 요망");
			console.log(request);
			console.log(status);
			console.log(error);

			$("#pwsearchchk1").val("인증번호 보내기");
			$("#pwsearchchk1").attr('disabled', true);
		}
	});
}

function confrom(){
	var code = $("#verificationcode").val();
	if(codenum.indexOf(code)==0){
		alert("인증되었습니다. 비밀번호는 : '"+password+"' 입니다.");
	} else {
		alert("문자가 다릅니다.");
	}
}
</script>

<% 
	if(userinfo!=null){
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
		</div>
		
		<div id="myinfo">
			 
<% 
	if(userinfo!=null){
%>			 
			 <b>-<%= userinfo.getMain_id()%>님 환영합니다-</b><br/>-<a href="myinfo.main">내정보 보기</a>- -<a href="logout.main">로그아웃</a>-
<%
	} 
%>			 
			 
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
	} else if(logininfo==2){
%>
<script type="text/javascript">
	
	$(function(){
		alert("정보가 수정 되었습니다. 재 로그인 해주세요.")
	});

</script>		
<%
		session.setAttribute("logininfo", "0");
	}  else if(logininfo==4){
%>
<script type="text/javascript">
			
	$(function(){
		alert("회원 탈퇴 되셨습니다.")
	});

</script>		
<%		
		session.setAttribute("logininfo", "0");
	}
%>
</html>