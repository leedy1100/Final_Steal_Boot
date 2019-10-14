<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/">메인</a>
	<a href="empList">등록된 사원</a>
	<h1>가입한 사원 목록</h1>
		<c:choose>
		<c:when test="${empty list }">
			가입된 사원이 없습니다.
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
			<c:if test="${dto.main_authority == 'ROLE_USER' }">
				<div>
					<img src="/image/noimg.jpg" style="width: 100px;"/>
					<div><a href="selectone?id=${dto.main_id }">${dto.main_name }</a>
					${dto.main_emp }</div>
				</div>
			</c:if>
			</c:forEach>
		</c:otherwise>
		</c:choose>	
</body>
</html>