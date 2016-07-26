$(document).ready(function() {

    // Get wow started!
    new WOW().init();

    //affix sidebar
    sidebarAffix();

    //Make the curser blink in the logo
    setInterval(function() {
        $('.navbar-brand span#cursor').toggleClass('invisible');
    }, 1000);

    //fix sidebar focus when clicked
    $(".title-section").click(function() {
        $(this).addClass('active');
        $(this).siblings('li').removeClass('active').addClass('collapsed');
    });

    readMore();



});

function sidebarAffix() {

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
        } else {
            $('.nav-side-menu').addClass('sidebar-affix');
        }
    });
}

function showdown($textarea) {
    // When using more than one `textarea` on your page, change the following line to match the one you’re after
    var $preview = $('<div id="preview" />').insertAfter($textarea),
        converter = new Showdown.converter();
    $textarea.keyup(function() {
        $preview.html(converter.makeHtml($textarea.val()));
    }).trigger('keyup');
};

//a function that enables the read more effect
function readMore() {
    $('p.readMore').each(function(event) { /* select all divs with the item class */

        var max_length = 250; /* set the max content length before a read more link will be added */

        if ($(this).html().length > max_length) { /* check for content length */

            var short_content = $(this).html().substr(0, max_length); /* split the content in two parts */
            var long_content = $(this).html();

            $(this).html(short_content +
                '<a href="#" class="read_more"><br/>Read More</a>' +
                '<span class="more_text" style="display:none;">' + long_content + '</span>'); /* Alter the html to allow the read more functionality */

            $(this).find('a.read_more').click(function(event) { /* find the a.read_more element within the new html and bind the following code to it */

                event.preventDefault(); /* prevent the a from changing the url */
                $(this).hide(); /* hide the read more button */
                $(this).parents('.readMore').find('.more_text').show(); /* show the .more_text span */

            });

        }

    });

};
