// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", (($(window).height() - this.outerHeight()) / 2) + $(window).scrollTop() + "px");
    this.css("left", (($(window).width() - this.outerWidth()) / 2) + $(window).scrollLeft() + "px");
    return this;
}
$(document).ready(function() {
	var randomnumber=Math.floor(Math.random()*5)

	switch(randomnumber)
	{
	case 1:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20110711_demo01_jwc.jpg)');
	  break;
	case 2:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20060315_sculpture08_jwc.jpg)');
	  break;
	case 3:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20110615_dc01_jwc.jpg)')
	  break;
	case 4:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20090528_anderson06_jwc.jpg)')
	  break;
	default:
		
	}
    // put all your jQuery goodness in here.
	$('.hsubmit').hide();
	
	
	
	function popupCenter(url, width, height, name) {
	  var left = (screen.width/2)-(width/2);
	  var top = (screen.height/2)-(height/2);
	  window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
	  return window.close();
	}

	$("a.popup").click(function(e) {
	  popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
	  return false;
	});
	
	$(function(){
	var pop = function(){
		$('#screen').css({	"display": "block", opacity: 0.7, "width":$(document).width(),"height":$(document).height()});
		$('#box').css({"display": "block"});
	}
	$('.pu').click(pop);
	$(window).resize(function(){
		$('#box').css("display") == 'block'?pop.call($('#button')):"";
		});
	});
	$('.close').click(function(){$('#box').css("display", "none");$('#screen').css("display", "none")});
});