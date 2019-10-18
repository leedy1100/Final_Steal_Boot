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

<style type="text/css">
.mycontent {
    text-align: right;
    margin-top: 20px;
    margin-left: 10%;
    position: absolute;
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
	color: blue;
}

#mainlogo {
    position: absolute;
    margin-top: 20px;
    margin-left: 5%;
}

#selectEmp {
    text-align: right;
    font-weight: 700;
}

#profileAll{
	text-align:center;
	background-color: rgba(255,255,255,0.8);
	position: absolute;
	margin-top: 100px;
	z-index:2;
	width: 100%;
	height: 100%
}

#profile{
	display: inline-block;
	margin: 10px;
}

a{
	text-decoration: none;
}

body{
		margin: 0;
}
	
#background{
		position : absolute;
		opacity:.3;
		background-image: url("../image/main/main_background.jpg");
		background-size: cover;
		width: 100%;
		height: 100%;
}

#empInsert {
	margin-left: 20px;
}

#selectEmp {
    text-align: right;
    font-weight: 700;
}

#profileAll>p{
	font-weight: 700;
	font-size: 20px;
}

</style>
</head>
<body>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>	

	<div id="background"></div>
	<div id="mainlogo"><a href="/"><img alt="MainLogo" src="../image/main/stealLogo.png" /></a></div>
	<sec:authorize access="isAuthenticated()">
		<ul class="mycontent">
			<li><%=name %>님 <a href="../myinfo.main?id=<%=name %>">개인정보</a></li>
			<li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
		</ul>
		<form id="logout-form" action='<c:url value='/logout.main'/>' method="POST">
		   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		</form>
	</sec:authorize>

	<div id="profileAll">
	
		<div id="selectEmp">
			<a href="employeelist">가입한 사원</a>&nbsp;|
			<a href="empList">등록된 사원</a>
		</div>
		<p>사원목록</p>
		<c:choose>
		<c:when test="${empty list }">
			<p>가입된 사원이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
			<c:if test="${dto.main_authority == 'ROLE_USER' }">
				<div id="profile">
					<img src="/image/noimg.jpg" style="width: 100px;"/>
					<div>
						<a href="selectone?id=${dto.main_id }">${dto.main_name }</a>${dto.main_emp }
					</div>
				</div>
			</c:if>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>