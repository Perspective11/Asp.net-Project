﻿$(document).ready(function() {

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

    loadProfile();



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

/**
 * Function that gets the data of the profile in case
 * thar it has already saved in localstorage. Only the
 * UI will be update in case that all data is available
 *
 * A not existing key in localstorage return null
 *
 */
function getLocalProfile(callback){
    var profileImgSrc      = localStorage.getItem("PROFILE_IMG_SRC");
    var profileName        = localStorage.getItem("PROFILE_NAME");
    var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

    if(profileName !== null
            && profileReAuthEmail !== null
            && profileImgSrc !== null) {
        callback(profileImgSrc, profileName, profileReAuthEmail);
    }
}

/**
 * Main function that load the profile if exists
 * in localstorage
 */
function loadProfile() {
    if(!supportsHTML5Storage()) { return false; }
    // we have to provide to the callback the basic
    // information to set the profile
    getLocalProfile(function(profileImgSrc, profileName, profileReAuthEmail) {
        //changes in the UI
        $("#profile-img").attr("src",profileImgSrc);
        $("#profile-name").html(profileName);
        $("#reauth-email").html(profileReAuthEmail);
        $("#inputEmail").hide();
        $("#remember").hide();
    });
}

/**
 * function that checks if the browser supports HTML5
 * local storage
 *
 * @returns {boolean}
 */
function supportsHTML5Storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}

/**
 * Test data. This data will be safe by the web app
 * in the first successful login of a auth user.
 * To Test the scripts, delete the localstorage data
 * and comment this call.
 *
 * @returns {boolean}
 */
function testLocalStorageData() {
    if(!supportsHTML5Storage()) { return false; }
    localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" );
    localStorage.setItem("PROFILE_NAME", "César Izquierdo Tello");
    localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
}