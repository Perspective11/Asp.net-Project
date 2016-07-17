$(document).ready(function () {

    // Get wow started!
    new WOW().init();

    //Make the curser blink in the logo
    setInterval(function(){
    	$('.navbar-brand span#cursor').toggleClass('invisible');
    }, 1000);
    

});
