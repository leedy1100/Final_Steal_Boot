var width = window.innerWidth;
var height = window.innerHeight;
$(function(){
	$("#mainpage").css({"width":width,"height":height});
	$("#loginform").css("margin-top",height/2-200);
	$("#idsearchform").css("margin-top",height/2-180);
	$("#pwsearchform").css("margin-top",height/2-200);
	$("#signupform").css("margin-top",height/2-350);
	$("#userpageform").css({"width":width,"height":height});
});

$(window).resize(function() {
	width = window.innerWidth;
	height = window.innerHeight;
	$("#mainpage").css({"width":width,"height":height});
	$("#loginform").css("margin-top",height/2-200);
	$("#idsearchform").css("margin-top",height/2-180);
	$("#pwsearchform").css("margin-top",height/2-200);
	$("#signupform").css("margin-top",height/2-350);
	$("#userpageform").css({"width":width,"height":height});
});

function hoverevent(){
	$("#conference").hover(
			function conferenceonevent() {
				$(this).animate({"opacity":".7"},100);
			}, function conferenceoutevent() {
				$(this).animate({"opacity":"1"},100);
			}
		);
		$("#decision").hover(
				function decisiononevent() {
					$(this).animate({"opacity":".7"},100);
				}, function decisioutevent() {
					$(this).animate({"opacity":"1"},100);
				}
			);
		$("#calendar2").hover(
				function calendaronevent() {
					$(this).animate({"opacity":".7"},100);
				}, function calendaroutevent() {
					$(this).animate({"opacity":"1"},100);
				}
			);
	return false;
}
$(function(){
	hoverevent();
});

function conference(){
	$("#conference>p").css({"display":"inline","cursor":"default"});
	$("#myinfo>br").remove();
	$("#myinfo").css({"top":"0","margin":"auto","width":"auto","height":"auto"});
	$("#myinfo").animate({"left":"20%"});
	$("#conference").css({"z-index":"0","cursor":"default"});
	$("#decision").css({"z-index":"1","cursor":"pointer"});
	$("#calendar2").css({"z-index":"1","cursor":"pointer"});
	hoverevent();
	$("#conference").animate({"width":"100%","height":"100%","border-radius":"0","opacity":"1"});
	$("#conference").unbind();
	$("#conference>p").fadeIn();
	$("#decision>p").fadeOut();
	$("#calendar2>p").fadeOut();
	$("#decision").animate({"width":"5%","height":"5%","left": "95%","border-bottom-left-radius":"1000px"});
	$("#calendar2").animate({"width":"5%","height":"5%","border-top-left-radius":"1000px","border-top-right-radius":"1000px","top": "95%","left": "47.5%"});
	
	$("#decisionform").hide();
	$("#calendarform2").hide();
	$("#conferenceform").show();
	
	$("#decision").attr("onclick","decision();");
	$("#calendar2").attr("onclick","calendar2();");
	$("#conference").removeAttr("onclick");
	
	sequentialStart();
	roomListStart();
	
}

function decision(){
	$("#decision>p").css({"display":"inline","cursor":"default"});
	$("#myinfo>br").remove();
	$("#myinfo").css({"top":"0","margin":"auto","width":"auto","height":"auto"});
	$("#myinfo").animate({"left":"20%"});
	$("#conference").css({"z-index":"1","cursor":"pointer"});
	$("#decision").css({"z-index":"0","cursor":"default"});
	$("#calendar2").css({"z-index":"1","cursor":"pointer"});
	hoverevent();
	$("#decision").animate({"width":"100%","height":"100%","border-radius":"0","opacity":"1","top": "0%","left": "0%"});
	$("#decision").unbind();
	$("#decision>p").fadeIn();
	$("#conference>p").fadeOut();
	$("#calendar2>p").fadeOut();
	$("#conference").animate({"width":"5%","height":"5%","border-bottom-right-radius":"1000px"});
	$("#calendar2").animate({"width":"5%","height":"5%","border-top-left-radius":"1000px","border-top-right-radius":"1000px","top": "95%","left": "47.5%"});
	
	$("#conferenceform").hide();
	$("#calendarform2").hide();
	$("#decisionform").show();
	
	$("#conference").attr("onclick","conference();");
	$("#calendar2").attr("onclick","calendar2();");
	$("#decision").removeAttr("onclick");
	
	
	
}

function calendar2(){
	$("#calendar2>p").css({"display":"inline","cursor":"default"});
	$("#myinfo>br").remove();
	$("#myinfo").css({"top":"0","margin":"auto","width":"auto","height":"auto"});
	$("#myinfo").animate({"left":"6%"});
	$("#conference").css({"z-index":"1","cursor":"pointer"});
	$("#decision").css({"z-index":"1","cursor":"pointer"});
	$("#calendar2").css({"z-index":"0","cursor":"default"});
	hoverevent();
	$("#calendar2").animate({"width":"100%","height":"100%","border-radius":"0","opacity":"1","top": "0%","left": "0%"});
	$("#calendar2").unbind();
	$("#calendar2>p").fadeIn();
	$("#conference>p").fadeOut();
	$("#decision>p").fadeOut();
	$("#conference").animate({"width":"5%","height":"5%","border-bottom-right-radius":"1000px"});
	$("#decision").animate({"width":"5%","height":"5%","left": "95%","border-bottom-left-radius":"1000px"});
	
	$("#decisionform").hide();
	$("#conferenceform").hide();
	$("#calendarform2").show();
	
	$("#conference").attr("onclick","conference();");
	$("#decision").attr("onclick","decision();");
	$("#calendar2").removeAttr("onclick");
	
}