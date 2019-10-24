<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Event</title>

    <link rel="stylesheet" href="resources/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href='resources/css/select2.min.css' />
    <link rel="stylesheet" href='resources/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="resources/css/main.css">
    <style type="text/css">
    .insertBtn{
    	
    }
    </style>
    
</head>
<body>
    <div class="container">
 <!-- calendar 
       <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>
-->        
		<div id="insert">
			<button type="button" class="btn btn-primary" id="insert-event" >일정 추가</button>
		</div>
		
       <!-- 일정 추가 MODAL --> 
        <div class="insertBtn" tabindex="-1" role="dialog" id="eventModal">	
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
                        <button type="button" class="btn btn-default" id="cancel">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    
                </div><!-- /.modal-content  --> 
            </div><!-- /.modal-dialog  --> 
        </div><!-- /.modal  --> 
    </div>
    <!-- /.container -->
    <script src="resources/js/jquery.min.js"></script>


    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/moment.min.js"></script>
    <script src="resources/js/fullcalendar.min.js"></script>
    <script src="resources/js/ko.js"></script>
    <script src="resources/js/select2.min.js"></script>
    <script src="resources/js/bootstrap-datetimepicker.min.js"></script>
    <script src="resources/js/cal.js"></script>
    <script src="resources/js/addEvent.js"></script>
    <script src="resources/js/editEvent.js"></script>
    <script src="resources/js/etcSetting.js"></script>
    <script type="text/javascript">
 
    var eventModal = $('#eventModal');

    var modalTitle = $('.modal-title');
    var editAllDay = $('#edit-allDay');
    var editTitle = $('#edit-title');
    var editStart = $('#edit-start');
    var editEnd = $('#edit-end');
    var editType = $('#edit-type');
    var editColor = $('#edit-color');
    var editDesc = $('#edit-desc');
    var editAlram = $('#edit-alram');

    var addBtnContainer = $('.modalBtnContainer-addEvent');

    eventModal.hide(); 	// insert window hide
    modalTitle.html('새로운 일정');
    addBtnContainer.show();
//    eventModal.modal('show');

	$('#insert').on('click', function () {
		eventModal.show();
	});

    $('#save-event').on('click', function () {

        var eventData = {
        		
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            //username: '사나',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
//            alram: editAlram.val(),
//            allDay: false
        };
        
//       alert('insert Event');
       
        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = 'Y';
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "POST",
            url: "insertEvent.do",
            data: eventData,
/*            {
                //.....
            },*/
            success: function (response) {
//            	alert(response);
            	if(response == 0){	// insert fail
                    //DB연동시 중복이벤트 방지를 위한
                    $('#calendar').fullCalendar('removeEvents');
                    $('#calendar').fullCalendar('refetchEvents');
            		alert("Insert Event Fail!");
            	} else {
            		alert("Insert Event Success!");
            		$('#calendar').fullCalendar('removeEvents');
                    $('#calendar').fullCalendar('refetchEvents');
            	}

            }
        });
        eventModal.hide();
    });
    $('#cancel').on('click', function () {
    	eventModal.hide();
    });
    
    </script>
</body>
</html>