$(document).ready(function() {

    // Get wow started!
    new WOW().init();

    //affix sidebar
    if (window.matchMedia('(max-width: 767px)').matches) {
        //if you hard code, then use console
        //.log to determine when you want the 
        //nav bar to stick.  
        //console.log($(window).scrollTop())
        if ($(window).scrollTop() > 236) {
            $('.nav-side-menu').addClass('sidebar-affix');
        }
        if ($(window).scrollTop() < 237) {
            $('.nav-side-menu').removeClass('sidebar-affix');
        }
    }
    //affix sidebar on scroll
    $(window).on('scroll', function() {
        // see if it matches the media query of 767
        if (window.matchMedia('(max-width: 767px)').matches) {
            //console.log($(window).scrollTop())
            if ($(window).scrollTop() > 236) {
                $('.nav-side-menu').addClass('sidebar-affix');
            }
            if ($(window).scrollTop() < 237) {
                $('.nav-side-menu').removeClass('sidebar-affix');
            }
        }
    });
    $(window).resize(function() {
        // see if it matches the media query of 767
        if (window.matchMedia('(max-width: 767px)').matches) {
            $('.nav-side-menu').removeClass('sidebar-affix');   
        }
        else {
        	$('.nav-side-menu').addClass('sidebar-affix');
        }
    });

    //Make the curser blink in the logo
    setInterval(function() {
        $('.navbar-brand span#cursor').toggleClass('invisible');
    }, 1000);

    $(".title-section").click(function() {
        $(this).addClass('active');
        $(this).siblings('li').removeClass('active').addClass('collapsed');
    });


});
