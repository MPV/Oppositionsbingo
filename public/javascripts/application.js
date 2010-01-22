// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

if (navigator.userAgent.indexOf('iPhone') != -1) {
        addEventListener("load", function() {
                setTimeout(hideURLbar, 0);
        }, false);
}

function hideURLbar() {
        window.scrollTo(0, 1);
}