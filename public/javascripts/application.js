// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	var randomnumber=Math.floor(Math.random()*6)

	switch(randomnumber)
	{
	case 1:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20110711_demo01_jwc.jpg)');
	  break;
	case 2:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20060315_sculpture08_jwc.jpg)');
	  break;
	case 3:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20110615_dc01_jwc.jpg)');
	  break;
	case 4:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20090528_anderson06_jwc.jpg)');
	  break;
	case 5:
	  $("#bigimage").css("backgroundImage", 'url(http://www2.binghamton.edu/photos/images/20110507_rugby036_jwc.jpg)');
	  break;
	default:
		
	}
});