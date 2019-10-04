var height = window.innerHeight;
$(function(){
	$("#myinfoform").css("margin-top",height/2-350);
});

function pwchk(){
	var pw = $("#main_password").val();
	var pw1 = $("#password1").val();
	var seq = $("#main_seq").val();
	var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{9,16}$/);
	pw = pw.trim();
	if(pw==""){
		alert("Passsword를 입력해 주세요.")
	} else {
		$.ajax({
			url: "updatepwchk.main",
			type: "get",
			data:"seq=" + seq,
			success: function(data){
				if(data==pw){
					alert("지금 사용하고 있는 비밀번호 입니다. 다른 비밀번호를 입력해 주세요.");
					return;
				} else {
					if(passwdCheck.test(pw)){
						if(pw==pw1){
							if(confirm("사용 가능한 비밀번호 입니다. 사용하시겠습니까?\n-확인하시면 변경 불가능 합니다.-")){
								$("#main_password").attr('readonly','readonly');
								$("#main_password").css('background-color', 'rgb(232,240,254)');
								$("#password1").attr('readonly','readonly');
								$("#password1").css('background-color', 'rgb(232,240,254)');
							} else {
								
							}
						} else {
							alert("비밀번호가 다릅니다.")
						}
					} else {
						alert("숫자와 문자 특수문자를 1자이상 사용해 주시고, 9자 이상으로 해주십시요.")
					}
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

function update(){
	
	var phonenumberchk = $("#main_phonenumber").val();
	var emailchk = $("#main_email").val();
	
	if(!$("#main_password").prop('readonly')){
		alert("PW유효성검사를 해주세요.")
	} else if($("#main_phonenumber").val()=="" || phonenumberchk.indexOf("-")==-1) {
		alert("전화번호를 정확히 입력해 주세요. - 포함해야 합니다.")
	} else if($("#main_email").val()=="" || emailchk.indexOf("@")==-1) {
		alert("이메일을 정확히 입력해 주세요. @도메인 포함해야 합니다.")
	} else {
		$("#submitsum").click();
	}
}

function back(){
	location.href="/";
}

function deleteres(){
	if(confirm("정말 탈퇴 하시겠습니까?")){
		var seq = $("#main_seq").val();
		location.href="infodelete.main?seq="+seq;
	}
}
