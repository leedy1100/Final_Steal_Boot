var width = window.innerWidth;
var height = window.innerHeight;
$(function(){
	$("#mainpage").css({"width":width,"height":height});
	$("#loginform").css("margin-top",height/2-200);
	$("#signupform").css("margin-top",height/2-350);
});

$(window).resize(function() {
	width = window.innerWidth;
	height = window.innerHeight;
	$("#mainpage").css({"width":width,"height":height});
	$("#loginform").css("margin-top",height/2-200);
	$("#signupform").css("margin-top",height/2-350);
});