<%@page import="com.steal.bs.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<% 
	int logininfo = 0;
	try{
		logininfo = Integer.parseInt((String)request.getAttribute("logininfo"));
	} catch (Exception e){
		System.out.println("logininfo null point exception");
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business support</title>

<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<link href="css/Main_myinfo.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_myinfo.js" ></script>

</head>
<body>

	<div id="myinfoform">
		<form action="infoupdate.main" method="post" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="main_seq" id="main_seq" value="${userinfo.main_seq}">
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
<%
	MainDto dto = (MainDto)request.getAttribute("userinfo");
	char sex = dto.getMain_sex();
	switch(sex){
		case 'M':
			sex='남';
			break;
		case 'F':
			sex='여';
			break;
		case 'X':
			sex='X';
			break;
		default :
			sex='X';
	}
%>				
			<label>sex<span class="small">성별</span></label>
			<input type="text" name="main_sex" id="main_sex" readonly="readonly" value="<%=sex%>" style="background-color:rgb(232,240,254)" />
			
			<label>Phone <span class="small">전화번호 입력</span></label>
			<input type="text" name="main_phonenumber" id="main_phonenumber" placeholder="xxx-xxxx-xxxx" value="${userinfo.main_phonenumber}" />
			
			<label>Email<span class="small">이메일주소</span></label>
			<input type="text" name="main_email" id="main_email" value="${userinfo.main_email }" />
	
			<label>Birth<span class="small">생년월일</span></label>
			<input type="text" name="main_birth" id="main_birth" placeholder="주민번호 앞 6자리" readonly="readonly" value="${userinfo.main_birth}" style="background-color:rgb(232,240,254)" />
<%
	int empchk = dto.getMain_emp();
	String emp = null;
	if(empchk==0){
		emp="000000";
	} else if(empchk<=99999 && empchk>=10000){
		emp = "0"+empchk;
	} else {
		emp = String.valueOf(empchk);
	}
%>
			<label>EMP<span class="small">사원번호</span></label>
			<input type="text" name="main_emp" id="main_emp" style="background-color:rgb(232,240,254)" readonly="readonly" value="<%=emp%>" />
			
			<input class="ck1" type="button" id="submit" onclick="update()" value="정보 수정" >
			<input type="submit" id="submitsum" />
			<br/>
			<br/>
			<button class="ck1" type="button" onclick="deleteres()">회원탈퇴</button>
			<br/>
			<br/>
			<button class="ck1" type="button" onclick="back()">뒤로가기</button>
		</form>
	</div>

</body>
<%
if(logininfo==3){
%>		
<script type="text/javascript">
	
	$(function(){
		alert("정보 수정이 실패하였습니다.")
	});

</script>
<%		
	} else if(logininfo==5){
%>		
<script type="text/javascript">
			
	$(function(){
		alert("회원탈퇴에 실패하였습니다.")
	});

</script>
<%				
	}
%>
</html>