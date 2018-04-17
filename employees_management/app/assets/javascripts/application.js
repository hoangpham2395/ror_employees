// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

//= require jquery
//= require bootstrap-sprockets
//= require jasny-bootstrap.min

$(document).ready(function () {
/*-- js cho phần sidebar --*/
    $('div .menu-1').click(function() {
        $('div .submenu-1').toggle();
    });

    $('div .menu-2').click(function() {
        $('div .submenu-2').toggle();
    });

    $('div .menu-3').click(function() {
        $('div .submenu-3').toggle();
    });
    
    $('div .menu-4').click(function() {
        $('div .submenu-4').toggle();
    });
});