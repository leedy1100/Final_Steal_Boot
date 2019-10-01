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