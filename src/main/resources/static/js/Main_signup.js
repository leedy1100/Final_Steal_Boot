	function idchk(){
		var id = $("#main_id").val();
		id = id.trim();
		if(id==""){
			alert("ID를 입력해 주세요.")
		} else {
			$.ajax({
				url: "loginidchk.main",
				type: "get",
				data:"id=" + id,
				success: function(data){
					if(data==""){
						if(confirm("사용 가능한 이이디 입니다. 사용하시겠습니까?\n-확인하시면 변경 불가능 합니다.-")){
							$("#main_id").attr('readonly','readonly');
							$("#main_id").css('background-color', 'rgb(232,240,254)');
						} else {
							
						}
					} else {
						alert("이미 사용된 아이디 입니다.")
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
	
	function pwchk(){
		var pw = $("#main_password").val();
		var pw1 = $("#password1").val();
		var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{9,16}$/);
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
	
	function empchk(){
		var emp = $("#main_emp").val();
		$.ajax({
			url: "signupempchk.main",
			type: "get",
			data:"emp=" + emp,
			success: function(data){
				if(data==""){
					alert("사원번호가 존재하지 않습니다.")
				} else {
					alert(data+"님 환영합니다.");
					if(confirm("이 사원번호를 사용하시겠습니까?\n-확인하시면 변경 불가능 합니다.-")){
						$("#main_emp").attr('readonly','readonly');
						$("#main_emp").css('background-color', 'rgb(232,240,254)');
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
	
	function signupchk(){
		
		var phonenumberchk = $("#main_phonenumber").val();
		var emailchk = $("#main_email").val();
		
		if(!$("#main_id").prop('readonly')){
			alert("id중복체크를 해주세요.")	
		} else if(!$("#main_password").prop('readonly')){
			alert("PW유효성검사를 해주세요.")
		} else if(!$("#main_emp").prop('readonly')){
			alert("사원번호 확인을 눌러주세요.")
		} else if($("#main_name").val()=="") {
			alert("이름을 입력해 주세요.")
		} else if($("#main_sex option:selected").val()=="선택하세요") {
			alert("성별을 선택해 주세요.");
		} else if($("#main_phonenumber").val()=="" || phonenumberchk.indexOf("-")==-1) {
			alert("전화번호를 정확히 입력해 주세요. - 포함해야 합니다.")
		} else if($("#main_email").val()=="" || emailchk.indexOf("@")==-1) {
			alert("이메일을 정확히 입력해 주세요. @도메인 포함해야 합니다.")
		} else if($("#main_birth").val()=="" || !$("#main_birth").val().length==6) {
			alert("생년월일을 정확히 입력해 주세요. 주민번호 앞 6자리 입니다.")
		} else {
			alert("통과");
			alert($("#submitsum"));
			$("#submitsum").click();
		}
	}
