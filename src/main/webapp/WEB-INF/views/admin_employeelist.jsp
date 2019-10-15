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
<title>Insert title here</title>
<style type="text/css">
#profile{
	display: inline-block;
	margin: 30px;
	margin-top: 200px;
}
#profileAll{
	text-align: center;
	position : relative;
	z-index:10;
}
a{
	text-decoration: none;
}

a:active {
	
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
.mycontent {
    text-align: right;
    margin-left: 1460px;
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
	color: black;
	font-weight: 1000;
}
#selectEmp {
    position: absolute;
    text-align: left;
    margin-left: 500px;
    margin-top: 160px;
    font-weight: 700;
}
#mainlogo {
    position: absolute;
    margin: 20px;
    margin-left: 500px;
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
	<div id="profileAll">
	<div id="mainlogo"><a href="/">메인</a></div>
	<sec:authorize access="isAuthenticated()">
			<ul class="mycontent">
				<li><%=name %>님 <a href="../myinfo.main?id=<%=name %>">개인정보</a></li>
				<li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
			</ul>
				<form id="logout-form" action='<c:url value='/logout.main'/>' method="POST">
				   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			</sec:authorize>	
		<div id="selectEmp">
			<a href="employeelist">가입한 사원</a>&nbsp;|
			<a href="empList">등록된 사원</a>
		</div>
		<c:choose>
		<c:when test="${empty list }">
			가입된 사원이 없습니다.
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