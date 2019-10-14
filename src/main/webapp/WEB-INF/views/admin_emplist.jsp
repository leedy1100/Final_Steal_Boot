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
<a href="employeelist">사원목록</a>
<a href="/">메인</a>
	<h1>사원등록</h1>
	<form action="empInsert" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<label>Name <span class="small">이름</span></label>
		<input type="text" name="emp_name"/>
		<label>No <span class="small">사원번호</span></label>
		<input type="text" name="emp_no">
		<input type="submit" value="사원등록">
	</form>
	
	<h1>사원 목록</h1>
	
	<table>
		<tr>
			<th>사원이름</th>
			<th>사원번호</th>
		</tr>
		
		<c:choose>
		<c:when test="${empty list }">
			등록된 사원이 없습니다.
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
			<c:if test="${dto.emp_no != 1 }">
				<tr>
					<td>${dto.emp_name }</td>
					<td>${dto.emp_no }</td>
					<td><input type="button" value="삭제" onclick="location.href='/admin/empDelete?emp_no=${dto.emp_no}'"/></td>
				</tr>
			</c:if>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>	
</body>
</html>