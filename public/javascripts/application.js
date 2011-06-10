// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
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
	  $('.signinsubmit').hide();
	  $('#signup').css('margin-left', '300px');
	  e.stopPropagation(); 
	  return false;
	});
});