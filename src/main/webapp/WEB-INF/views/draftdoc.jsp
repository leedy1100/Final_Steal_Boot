<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border: 1px solid black;
		margin: 0 auto;
		border-collapse: collapse;
	}
	
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
</style>
</head>
<body>
	<h1>기안문서함</h1>
	<table>
		<tr>
			<th>문서번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>기안일</th>
			<th>결재기한</th>
			<th>협조자</th>
			<th>결재자</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.doc_seq}</td>
				<td><a href="docinfo?title=${dto.title}">${dto.title}</a></td>
				<td>${dto.writer}</td>
				<td>${dto.draft_date}</td>
				<td>${dto.deadline}</td>
				<td>${dto.collaborator}</td>
				<td>${dto.settlement}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>