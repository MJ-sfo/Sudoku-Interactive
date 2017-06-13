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
console.log("js is showing")
$( document ).on('turbolinks:load', function() {
  // console.log('Jquery is working')

  $('.box').click( function(event) {
    var id = event.target.id;
    // console.log('id = ' + id);
    index = Number(id.substring(5));
    console.log('id = ' + id + ", and index is: " + index)
    console.log(jQuery.type( index ))

    var menu_class = 'menu_' + parseInt(index)
    console.log('menu = ' + menu_class);
    $('.menu_class').css("display", "block");  // these don't work!
    // $('.menu_class').show();  // these don't work!
    // $('#menu_class').toggle();  // these don't work!
    // replace = find_row(index);
    // replace = possible_numbers(string_starting_numbers[index], index)
    // console.log(replace);
    console.log(JSON.parse($( "#numbs_arr").text()))
    $.ajax({
      url: "/welcome/render_read",
      type: 'GET',
      data: {
        arr: JSON.parse($( "#numbs_arr").text()),
        index: index
      }
    });
  });   // $(".box").click(
});   //  $( document ).on
