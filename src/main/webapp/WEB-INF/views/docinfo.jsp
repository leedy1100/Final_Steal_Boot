<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${dto.title}</h1>
	${dto.writer}<br>
	${dto.draft_date}<br>
	${dto.deadline}<br>
	${dto.collaborator}<br>
	${dto.settlement}
</body>
</html>