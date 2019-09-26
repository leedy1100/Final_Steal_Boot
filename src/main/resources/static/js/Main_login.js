function signup(){
	$("#loginform").hide();
	$("#signupform").show();
}
function login(){	
	$("#loginform").show();
	$("#signupform").hide();
}

function loginidchk(){
	
	if($("#password").val()==""){
		alert("비밀번호를 입력해 주세요.")
	} else {
		var id= $("#id").val();
		$.ajax({
			url: "loginidchk.main",
			type: "get",
			data:"id=" + id,
			success: function(data){
				if(data==""){
					alert("아이디가 존재하지 않습니다.")
				} else {
					$("#loginformsubmit").submit();
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

function enterkey() {
        if (window.event.keyCode == 13) {
        	loginidchk();
        }
}