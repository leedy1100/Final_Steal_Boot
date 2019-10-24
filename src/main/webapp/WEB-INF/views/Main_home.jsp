<%@page import="com.steal.bs.dto.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix ="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<% 
	int logininfo = 0;
	try{
		logininfo = Integer.parseInt((String)session.getAttribute("logininfo"));
	} catch (Exception e){
		System.out.println("logininfo null point exception");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business support</title>

<link rel="shortcut icon" href="image/stealLogo.ico">

<script type="text/javascript" src="js/jquery-3.4.1.min.js" ></script>
<link href="css/Main_login.css" rel="stylesheet" type="text/css">
<link href="css/Main_home.css" rel="stylesheet" type="text/css">
<link href="css/Main_signup.css" rel="stylesheet" type="text/css">
<link href="css/Main_search.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Main_home.js" ></script>
<script type="text/javascript" src="js/Main_login.js" ></script>
<script type="text/javascript" src="js/Main_signup.js" ></script>
<script type="text/javascript" src="js/Main_search.js" ></script>

<link href="css/Conference.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Conference.js" ></script>

<link href="css/Decision.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Decision.js" ></script>




<script type="text/javascript">


</script>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String name = "";
    String user = "anonymousUser";
    if(principal != null) {
        name = auth.getName();
    }
    if(!principal.equals(user)){
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
			<div id="conferenceform">
				<div id="memberList"></div>
			
				<a id="conferenceRoomListReplace" onclick="conferenceReplace();"><img alt="replace" src="image/main/replace.png" style=" width: 32px; height: 32px;"></a>
				
				<div id="roomList"></div>
			</div>
		</div>
		
		<div id="myinfo">
		<input type="hidden" value="<%=name %>" id="masterName" >
			<sec:authorize access="isAuthenticated()">
				<ul class="mycontent">
					<li><%=name %>님 <a href="../myinfo.main?id=<%=name %>">개인정보</a></li>
					<li><a href="#" onclick="logout()">로그아웃</a></li>
<%
if(name.equals("zongyeng")){
%>
					<li><a href="admin/employeelist">사원목록</a></li>
<%
}
%>
				</ul>
				<form id="logout-form" action='<c:url value='/logout.main'/>' method="POST">
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			</sec:authorize>
		</div>
		
		<div id="decision" onclick="decision()" style="cursor:pointer">
			<p style="cursor:pointer"></p>
			<div id="decisionform">

			</div>
		</div>
		
		
		<div id="calendar2" onclick="calendar2()" style="cursor:pointer">
			<p style="cursor:pointer">일정관리</p>
			<div id="calendarform2">
				<div class="container">
		        <!-- 일자 클릭시 메뉴오픈 -->
			        <div id="contextMenu" class="dropdown clearfix">
	        		    <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
	                		style="display:block;position:static;margin-bottom:5px;">
			                <li><a tabindex="-1" href="#">카테고리1</a></li>
	    		            <li><a tabindex="-1" href="#">카테고리2</a></li>
	            		    <li><a tabindex="-1" href="#">카테고리3</a></li>
			                <li><a tabindex="-1" href="#">카테고리4</a></li>
	    		            <li class="divider"></li>
	            		    <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			            </ul>
	    		    </div>
	
			        <div id="wrapper">
	    		        <div id="loading"></div>
	            		<div id="calendar"></div>
			        </div> 

        		</div>
        		
			</div>
		</div>
	</div>
	
	<div id="userpageform">
		<div id="loginform">
			<form action="login.main" method="post" id="loginformsubmit">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<font color="red">
					<a>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</a> 
					<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
				</font>
			</c:if>
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
				        <!-- 일정 추가 MODAL --> 
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal" >
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                                aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title"></h4>
	                    </div>
	                    <div class="modal-body">
	
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
	                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox" />
	                            </div>
	                        </div>
	
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-title">일정명</label>
	                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
	                                    required="required" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-start">시작</label>
	                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-end">끝</label>
	                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-type">구분</label>
	                                <select class="inputModal" name="edit-type" id="edit-type">
	                                    <option value="카테고리1">카테고리1</option>
	                                    <option value="카테고리2">카테고리2</option>
	                                    <option value="카테고리3">카테고리3</option>
	                                    <option value="카테고리4">카테고리4</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-color">색상</label>
	                                <select class="inputModal" name="color" id="edit-color">
	                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
	                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
	                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
	                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
	                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
	                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
	                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
	                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
	                                    <option value="#495057" style="color:#495057;">검정색</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-alram">알람</label>
	                                <select class="inputModal" name="alram" id="edit-alram">
	                                    <option value="0" >알람없음</option>
	                                    <option value="5" >5분</option>
	                                    <option value="15" >15분</option>
	                                    <option value="30" >30분</option>
	                                    <option value="60" >1시간</option>
	                                    <option value="1440" >1일</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-desc">설명</label>
	                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
	                                    id="edit-desc"></textarea>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="modal-footer modalBtnContainer-addEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
	                    </div>
	                    <div class="modal-footer modalBtnContainer-modifyEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
	                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
	                    </div>
	            </div><!-- /.modal-content  --> 
	        </div><!-- /.modal-dialog  --> 
	    </div><!-- /.modal  -->       
    <!-- /.container -->
    <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/moment.min.js"></script>
 <script src="js/fullcalendar.min.js"></script>
 <script src="js/ko.js"></script>
 <script src="js/select2.min.js"></script>
 <script src="js/bootstrap-datetimepicker.min.js"></script>
 <script src="js/cal.js"></script>
 <script src="js/addEvent.js"></script>
 <script src="js/editEvent.js"></script>
 <script src="js/etcSetting.js"></script>
</body>
<% 
	if(logininfo==1){
%>
<script type="text/javascript">
	
	$(function(){
		alert("회원가입 되었습니다. 로그인 해주세요.")
	});

</script>
<%
		session.setAttribute("logininfo", "0");
	} else if(logininfo==2){
%>
<script type="text/javascript">
	
	$(function(){
		alert("회원가입 실패하였습니다. 재 시도 하시거나, 관리자에게 문의 하세요.")
	});

</script>		
<%
		session.setAttribute("logininfo", "0");
	}
%>
</html>