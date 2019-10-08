function idsearch(){
	$("#loginform").hide();
	$("#idsearchform").show();
}

function idsearchbeck(){
	$("#loginform").show();
	$("#idsearchform").hide();
}

function idsearchchk(){
	var name = $("#name").val();
	var birth = $("#birth").val();
	name = name.trim();
	
	if(name==""){
		alert("이름을 입력 해 주세요.");
	} else if(birth==""){
		alert("생년월일을 입력해 주세요.")
	} else {
		$.ajax({
			url: "idsearch.main",
			type: "get",
			data:"name="+name+"&birth="+birth,
			success: function(data){
				if(data==""){
					alert("입력하신 정보가 존재하지 않습니다.")
				} else {
					alert("해당 정보의 ID는 '"+data+"' 입니다.")
				}
			},
			error: function(request, status, error){
				alert("error 콘솔확인 요망");
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	}
}

//------------------------------------------------------------------------------------------------------------------

function pwsearch(){
	$("#loginform").hide();
	$("#pwsearchform").show();
}

function pwsearchbeck(){
	$("#loginform").show();
	$("#pwsearchform").hide();
}

function pwsearchchk1(){
	$("#pwsearchchk1").val("진행중...");
	$("#pwsearchchk1").attr('disabled', false);
	name = $("#pwsearchname").val();
	var email = $("#pwsearchemail").val();
	name = name.trim();
	
	if(name==""){
		alert("이름을 입력 해 주세요.");
	} else if(email==""){
		alert("email을 입력해 주세요.");
	} else {
		$.ajax({
			url: "pwsearch.main",
			type: "post",
			data: {name:name,email:email},
			success: function(data){
				if(data==""){
					alert("입력하신 정보가 존재하지 않습니다.")
				} else {
					EmailCheckgo(email);
					id = data;
				}
			},
			error: function(request, status, error){
				alert("error 콘솔확인 요망");
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	}
}

function EmailCheckgo(emailchk) {
	$.ajax({
		type : "post",
		url : "http://localhost:8787/bs/EmailCheck.main",
        data:{email:emailchk},
		datatype : "int",
		success : function(data) {
			alert(name+"님 반갑습니다.\n입력하신 이메일로 인증번호가 전송되었습니다.");
			$("#pwsearchform").css("height","380px");
			$("#verificationcode").show();
			$("#pwsearchchk").show();
			$("#pwsearchchk1").hide();
			codenum=data;

			$("#pwsearchchk1").val("인증번호 보내기");
			$("#pwsearchchk1").attr('disabled', true);
		}, error: function(request, status, error){
			alert("error 콘솔확인 요망");
			console.log(request);
			console.log(status);
			console.log(error);

			$("#pwsearchchk1").val("인증번호 보내기");
			$("#pwsearchchk1").attr('disabled', true);
		}
	});
}

function confrom(){
	var code = $("#verificationcode").val();
	if(codenum==code){
		location.href='pwchange.main?id='+id;
		alert("인증되었습니다. 아이디 : '"+id+"' 입니다.");
	} else {
		alert("문자가 다릅니다.");
	}
}