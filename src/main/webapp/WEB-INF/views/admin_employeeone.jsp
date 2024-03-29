<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>admin page</title>

<link rel="shortcut icon" href="../image/stealLogo.ico">

<script type="text/javascript" src="../js/jquery-3.4.1.min.js" ></script>
<link href="../css/Main_myinfo.css" rel="stylesheet" type="text/css">
<style type="text/css">

.mycontent {
    text-align: right;
    position: relative;
    margin-right: 20px;
    margin-bottom: 40px;
    color: white;
}
.mycontent li{
	list-style: none;
	display: inline-block;
	font-weight: 700;
	border-left: 2px solid white;
	padding-left: 8px;	
	line-height: 85%;
}
.mycontent li:first-child{
	border: none;
}
.mycontent li a{
	text-decoration: none;
	color: white;
}
.mycontent li :hover{
	color: aqua;
}

#myinfoform{
	height: 550px;
}
</style>
</head>
<body>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String name = "";
    String user = "anonymousUser";
    if(principal != null) {
        name = auth.getName();
    }
%>
	<sec:authorize access="isAuthenticated()">
		
		<ul class="mycontent">
			<li> <%=name %>님 <a href="../myinfo.main?id=<%=name %>"> 개인정보</a></li>
			<li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
			<li><a href="employeelist">사원목록</a></li>
		</ul>
			<form id="logout-form" action='<c:url value='/logout.main'/>' method="POST">
			   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			</form>
		</sec:authorize>
	<div id="myinfoform">
		<form action="empUpdate" method="post" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="main_seq" id="main_seq" value="${employee.main_seq}">
			<input type="hidden" name="emp_no" id="emp_no" value="${employee.main_emp }" />
			<br/>
			<h1>사원 정보</h1>
			<p></p>

			<label>Name <span class="small">이름</span></label>
			<input type="text" name="main_name" id="main_name" readonly="readonly" value="${employee.main_name}" style="background-color:rgb(232,240,254)" />
			
			<label>ID <span class="small">아이디</span></label>
			<input type="text" name="main_id" id="main_id" readonly="readonly" value="${employee.main_id}" style="background-color:rgb(232,240,254)" />
			<label>Phone <span class="small">전화번호</span></label>
			<input type="text" name="main_phonenumber" id="main_phonenumber" readonly="readonly" placeholder="xxx-xxxx-xxxx" value="${employee.main_phonenumber}" style="background-color:rgb(232,240,254)"/>
			
			<label>Email<span class="small">이메일주소</span></label>
			<input type="text" name="main_email" id="main_email" readonly="readonly" value="${employee.main_email }" style="background-color:rgb(232,240,254)"/>
	
			<label>Birth<span class="small">생년월일</span></label>
			<input type="text" name="main_birth" id="main_birth" placeholder="주민번호 앞 6자리" readonly="readonly" value="${employee.main_birth}" style="background-color:rgb(232,240,254)" />
			<label>EMP<span class="small">사원번호</span></label>
			<input type="text" name="main_emp" id="main_emp" value="${employee.main_emp }" />
			
			<input class="ck1" type="submit" value="정보 수정"/>
			<br/>
			<br/>
			<button class="ck1" type="button" onclick="location.href='/admin/empDel?seq=${employee.main_seq}'">회원삭제</button>
			<br/>
			<br/>
			<input class="ck1" type="button" value="뒤로가기" onclick="location.href='/admin/employeelist'"/>
		</form>
	</div>

</body>

</body>
</html>