<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	$(function() {
		$(window).on("beforeunload", function() {
			$(opener.document).find("#layer_one").css("display","none");
			return "";
		});
		
		$("#insertdoc").on("click", function() {
			var title = $("input[name=title]").val();
			var writer = $("input[name=writer]").val();
			var draft_date = $("input[name=draft_date]").val();
			var deadline = $("input[name=deadline]").val();
			var content = $("textarea[name=content]").val();
			var collaborator = $("select[name=collaborator]").val();
			var settlement = $("select[name=settlement]").val();
			
			$.ajax({
				url : "insertdoc",
				type : "GET",
				data : {"title" : title, "writer" : writer,
					    "draft_date" : draft_date, "deadline" : deadline,
					    "content" : content, "collaborator" : collaborator,
					    "settlement" : settlement},
				success : function(data) {
					window.close();
				},
				error : function(request, status, error) {
					alert(request.status + " / " + status.responseText + " / " + error);
				}
			});
			
		});
		
	});
</script>
<style type="text/css">
	input[type=submit] {
		border: 1px solid black;
	}
</style>
</head>
<body>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String name = auth.getName();
%>
	<input type="text" name="title" placeholder="제목을 입력하세요" style="line-height: 60px;"><br>
	작성자<input type="text" name="writer" value=<%= name %> readonly="readonly">
	기안일<input type="date" name="draft_date">
	결재기한<input type="date" name="deadline"><br>
	내용<br>
	<textarea name="content"></textarea>
	<select name="collaborator">
		<option value="부장">부장</option>
		<option value="과장">과장</option>
		<option value="팀장">팀장</option>
	</select>
	<select name="settlement">
		<option value="사장">사장</option>
	</select>
	<input type="button" id="insertdoc" value="문서작성">
</body>
</html>