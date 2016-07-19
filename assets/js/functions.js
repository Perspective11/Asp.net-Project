$(document).ready(function () {

    // Get wow started!
    new WOW().init();

    //Make the curser blink in the logo
    setInterval(function(){
    	$('.navbar-brand span#cursor').toggleClass('invisible');
    }, 1000);

    $(".title-section").click(function(){ 
	    //$(".menu-section").collapse('hide');
	    $(this).addClass('active');
	    $(this).siblings('li').removeClass('active').addClass('collapsed');
	    //$(this).siblings('ul').animate().removeClass('in');
	});
});
