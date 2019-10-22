var memberList;
var depList;

function show(){
	
	return new Promise(resolve => {
		
		$("#memberList").empty();
		$("#memberList").append('<form action="chathome.conference" id="memberDep" ></form>');
		var mastername = $("#masterName").val();
		
		for(var i = 0; i<depList.length; i++){
			var depchk = depList[i].dep_no;
			var dep = "";
			
			if(depchk==0){
				dep="00";
			} else if(depchk<=9 && depchk>=1){
				dep = "0"+depchk;
			} else {
				dep = String(depchk);
			}
			
			$("#memberDep").append('<p id="depNum'+dep+'" ><a class="depName" >'+depList[i].dep_name+'</a><br/></p>');
		}
		
		
		for(var i = 0; i<memberList.length; i++){
			
			var emp = "";
			
			var empchk = memberList[i].main_emp;
			
			if(empchk==0){
				emp="000000";
			} else if(empchk<=99999 && empchk>=10000){
				emp = "0"+empchk;
			} else {
				emp = String(empchk);
			}
			
			if(memberList[i].main_id==mastername){
				$("#depNum"+emp.substring(2,4)).append('<input type="checkbox" name="id" onClick="count_ck(this);" disabled="disabled" value="'+memberList[i].main_id+'">'+memberList[i].main_id+'('+memberList[i].main_name+')</input><br/>');
				$("#depNum"+emp.substring(2,4)).append('<input type="hidden" value="'+$("#depNum"+emp.substring(2,4)+">a").text()+'부서가 생성한 회의방" name="content" />');
			} else {
				$("#depNum"+emp.substring(2,4)).append('<input type="checkbox" name="id" onClick="count_ck(this);" value="'+memberList[i].main_id+'">'+memberList[i].main_id+'('+memberList[i].main_name+')</input><br/>');
			}
			
		}
		
		$("#memberDep").append('<input type="hidden" name="master" value="'+mastername+'" />');
		$("#memberList").append('<input type="button" value="방 만들기" onclick="roomsubmit();" />');
		
		
		resolve();
	  });
	
}

function roomsubmit(){
	if($('#memberList input[type="checkbox"]:checked').length==0){
		alert("초대하는 인원이 없으면 방을 만들 수 없습니다.");
		return;
	}
	
	var mastername = $("#masterName").val();
	
	$.ajax({
		url: "roomMember.conference",
		type: "get",
		data: "id="+mastername,
		dataType: "text",
		success: function(roomname){
			if(roomname!=""){
				alert("이미 참여한 방이 있습니다.");
				return;
			}
			
			var inputString = prompt('방 제목을 입력해 주세요');
			if(inputString==null){
				return;
			}
			if(inputString==""){
				alert("방제목을 입력해 주세요");
				return;
			}
			
			$.ajax({
				type : "get",
				url : "checkRoom.conference",
				data : "name="+inputString,
				success : function(msg) {
					if (msg == "0") {
						alert("이미 존재하는 방이름 입니다.");
						return;
					} else {
						$("#memberDep").append('<input type="hidden" name="name" value="'+inputString+'" />');
						
						$("#memberDep").submit();
					}
				},
				error : function(error){
					console.log(error);
				}
			});
		},
		error: function(request, status, error){
			alert("error 콘솔확인 요망");
			console.log(request);
			console.log(status);
			console.log(error);
		}
	});
	
}

function count_ck(obj){

	var chkbox = $("#memberDep input[type='checkbox']");

	var chkCnt = 0;

	for(var i=0;i<chkbox.length; i++){

		if(chkbox[i].checked){

			chkCnt++;

		}

	}

	if(chkCnt>6){

		alert("회의방 최대 참가 인원은 자신포함 7명입니다.");

		obj.checked = false;

		return false;

	}

}

function getList(){
	return new Promise(resolve => {
		$.ajax({
			url: "memberList.conference",
			type: "get",
			dataType: "json",
			success: function(memberlist){
				memberList = memberlist;
			},
			error: function(request, status, error){
				alert("error 콘솔확인 요망");
				console.log(request);
				console.log(status);
				console.log(error);
			},
			complete: function(){
				$.ajax({
					url: "depList.conference",
					type: "get",
					dataType: "json",
					success: function(deplist){
						depList = deplist;
					},
					error: function(request, status, error){
						alert("error 콘솔확인 요망");
						console.log(request);
						console.log(status);
						console.log(error);
					},
					complete: function(){
						resolve();
					}
				});
			}
		});
	});
}



var sequentialStart = async function() {
	await getList();
	await show();
}


/*------------------------------------------------------------------------------------------------------------------------------*/


var roomName;
var roomList;
var joinedMembers;

function getRoomList(){
	return new Promise(resolve => {
		var mastername = $("#masterName").val();
		$.ajax({
			url: "roomList.conference",
			type: "get",
			data: "id="+mastername,
			dataType: "json",
			success: function(roomlist){
				roomList = roomlist;
			},
			error: function(request, status, error){
				alert("error 콘솔확인 요망");
				console.log(request);
				console.log(status);
				console.log(error);
			},
			complete: function(){
				$.ajax({
					url: "roomMember.conference",
					type: "get",
					data: "id="+mastername,
					dataType: "text",
					success: function(roomname){
						roomName = roomname;
					},
					error: function(request, status, error){
						alert("error 콘솔확인 요망");
						console.log(request);
						console.log(status);
						console.log(error);
					},
					complete: function(){
						resolve();
					}
				});
			}
		});
	});	
}

function joinedMember(){
	return new Promise(resolve => {
		
		if(roomList.length==0){
			resolve();
		}
		for(var i = 0; i<roomList.length; i++){
			$.ajax({
				url: "joinedMember.conference",
				type: "get",
				data: "room="+roomList[i].name,
				dataType: "json",
				success: function(joinedmembers){
					joinedMembers = joinedmembers;
				},
				error: function(request, status, error){
					alert("error 콘솔확인 요망");
					console.log(request);
					console.log(status);
					console.log(error);
				},
				complete: function(){
					resolve();
				}
			});
		}
	});
}

function roomListshow(){
	
	return new Promise(resolve => {
		var mastername = $("#masterName").val();
		$("#roomList").empty();
		$("#roomList").append('<p>초대된 회의방</p>');
		if(roomList.length==0){
			$("#roomList").append('<p id="noroom">초대된 방이 없습니다.</p>');
		} else {
			if(roomName!=""){
				for(var i = 0; i<roomList.length; i++){
					if(roomName==roomList[i].name){
						$("#roomList").append('<div id="confereneRoom'+i+'"><p>'+roomList[i].name+'(이미 접속된 방입니다.)</p></div>');
					} else {
						$("#roomList").append('<div id="confereneRoom'+i+'"><p>'+roomList[i].name+'(이미 접속된 방이 존재합니다.)</p></div>');
					}
				}
			} else {
				var chkRoomMemberNum;
				for(var i = 0; i<roomList.length; i++){
					$("#roomList").append('<div id="confereneRoom'+i+'"><p onclick="showRoomInfo();">방 이름 : '+roomList[i].name+'</p><div><p>방 생성자 : '+roomList[i].master+'</p></div></div>');
					var confereneRoomClone = $("#confereneRoom"+i+">div");
				
					if(roomList[i].user2==null) {
						confereneRoomClone.append('<p>'+roomList[i].user1+'</p>');
						chkRoomMemberNum=1;
					} else if(roomList[i].user3==null){
						confereneRoomClone.append('<p>'+roomList[i].user1+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user2+'</p>');
						chkRoomMemberNum=2;
					} else if(roomList[i].user4==null){
						confereneRoomClone.append('<p>'+roomList[i].user1+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user2+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user3+'</p>');
						chkRoomMemberNum=3;
					} else if(roomList[i].user5==null){
						confereneRoomClone.append('<p>'+roomList[i].user1+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user2+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user3+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user4+'</p>');
						chkRoomMemberNum=4;
					} else if(roomList[i].user6==null){
						confereneRoomClone.append('<p>'+roomList[i].user1+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user2+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user3+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user4+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user5+'</p>');
						chkRoomMemberNum=5;
					} else {
						confereneRoomClone.append('<p>'+roomList[i].user1+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user2+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user3+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user4+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user5+'</p>');
						confereneRoomClone.append('<p>'+roomList[i].user6+'</p>');
						chkRoomMemberNum=6;
					}
					var roomNameClone = $("#confereneRoom"+i+">p").eq(0).text();
					$("#confereneRoom"+i+">div").append('<input type="button" onclick="location.href=\'chatjoin.conference?user1='+mastername+'&name='+roomNameClone.substring(7)+'\'" value="참여" />');
					
					for(var j = 0; j<joinedMembers.length; j++){
						var confereneRoomClone = $("#confereneRoom"+i+">div>p");
						for(var k = 0; k<chkRoomMemberNum+1; k++){
							if(joinedMembers[j]===confereneRoomClone.eq(k).text() || joinedMembers[j]===confereneRoomClone.eq(k).text().substring(8)){
								confereneRoomClone.eq(k).append(" (참여중)");
							}
						}
					}
				}
			}
		}
		resolve();
	});

}


var roomListStart = async function() {
	await getRoomList();
	await joinedMember();
	await roomListshow();
}

async function conferenceReplace(){
	$("#conferenceRoomListReplace>img").attr("src","image/main/loading.gif");
	$("#conferenceRoomListReplace").removeAttr("onclick");
	await getRoomList();
	await joinedMember();
	await roomListshow();
	await conferenceReplaceAsync();
}

function conferenceReplaceAsync(){
	return new Promise(resolve => {
		$("#conferenceRoomListReplace>img").attr("src","image/main/replace.png");
		$("#conferenceRoomListReplace").attr("onclick","conferenceReplace();");
		resolve();
	});
}

function showRoomInfo(){
	if($("#roomList>div>div").css("display")=="none"){
		$("#roomList>div>div").slideDown("fast");
	} else {
		$("#roomList>div>div").slideUp("fast");
	}
}
