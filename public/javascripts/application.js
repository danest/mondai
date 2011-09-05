// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {

  retrigger = function() {
    //Tooltips
    var tip;
    $(".tip_trigger").hover(function(){
        if($(this).parent().hasClass("vote_up")){
          tip = $("#answer").find('.tip_up').eq(0);       
        } else {
          tip = $("#answer").find('.tip_down').eq(0);        
        }
		    tip.fadeIn('fast'); //Show tooltip
        console.log('here');
        console.log(tip); 
    }, function() {
        tip.hide(); //Hide and remove tooltip appended to the body
        
    }).mousemove(function(e) {
        var mousex = e.pageX + 20; //Get X coodrinates
        var mousey = e.pageY + 20; //Get Y coordinates
        var tipWidth = tip.width(); //Find width of tooltip
        var tipHeight = tip.height(); //Find height of tooltip

        //Distance of element from the right edge of viewport
        var tipVisX = $(window).width() - (mousex + tipWidth);
        //Distance of element from the bottom of viewport
        var tipVisY = $(window).height() - (mousey + tipHeight);

        if ( tipVisX < 20 ) { //If tooltip exceeds the X coordinate of viewport
            mousex = e.pageX - tipWidth - 20;
        } if ( tipVisY < 20 ) { //If tooltip exceeds the Y coordinate of viewport
            mousey = e.pageY - tipHeight - 20;
        }
        //Absolute position the tooltip according to mouse position
        tip.css({  top: mousey, left: mousex });
    });

  }
  retrigger();
  
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
		$("#bigimage").css("backgroundImage", 'url(http://i.imgur.com/rerpP.jpg)');
	    break;
	}
	
	var availableTags = [
		"Binghamton",
		"Downtown",
		"Math",
		"Science",
		"Computer Science",
		"Food",
		"Stuff in General",
		"Meal Plans",
		"Textbook",
		"BuBrain",
		"Blackboard",
		"Bartle Library",
		"Sciences Library",
		"Downtown Library",
		"Spring Fling",
		"Campus Events",
		"Intramural Sports",
		"General Registar",
		"Financial Aid",
		"Where is this room?",
		"Study Abroad",
		"Fraternity",
		"Sorority",
		"Pods",
		"Dormitory (General)",
		"Dormitory (Dickinson)",
		"Dormitory (Mountainview)",
		"Dormitory (Hinman)",
		"Dormitory (Newing)",
		"Dormitory (College in the Woods)",
		"Dormitory (Mohawk)",
		"Dormitory (Hillside and Susquenhanna)",
		"Off Campus",
		"Blue Bus",
		"City Bus",
		"Walmart",
		"Wegmans",
		"Oakdales Mall",
		"Study",
		"Graduate Schools",
		"Final Exams",
		"Commencement Ceremony"
	];
	function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}

	$( "#topics" )
		// don't navigate away from the field on tab when selecting an item
		.bind( "keydown", function( event ) {
			if ( event.keyCode === $.ui.keyCode.TAB &&
					$( this ).data( "autocomplete" ).menu.active ) {
				event.preventDefault();
			}
		})
		.autocomplete({
			minLength: 0,
			source: function( request, response ) {
				// delegate back to autocomplete, but extract the last term
				response( $.ui.autocomplete.filter(
					availableTags, extractLast( request.term ) ) );
			},
			focus: function() {
				// prevent value inserted on focus
				return false;
			},
			select: function( event, ui ) {
				var terms = split( this.value );
				// remove the current input
				terms.pop();
				// add the selected item
				terms.push( ui.item.value );
				// add placeholder to get the comma-and-space at the end
				terms.push( "" );
				this.value = terms.join( ", " );
				return false;
			}
		});
});
