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

  $('.box').one("click", function(event) {
    var id = event.target.id;
    index = Number(id.substring(5));
    console.log('id = ' + id + ", and index is: " + index)
    // console.log(jQuery.type( index ))

    var menu_id = 'menu_' + parseInt(index)
    console.log('menu = ' + menu_id);
    // console.log($('#menu_4'))
    // console.log($('#menu_id').val())
    // replace = find_row(index);
    // replace = possible_numbers(string_starting_numbers[index], index)
    // console.log(replace);
    // console.log(JSON.parse($( "#numbs_arr").text()))
    $.ajax({
      url: "/welcome/find_choises",
      type: 'GET',
      data: {
        arr: JSON.parse($( "#numbs_arr").text()),
        index: index
      },
      // dataType: "json",
      // async: false,
      success: function(response) {
      // success: function(){var dave response.sucess} {
          // console.log("ajax success");
          // console.log(response);
          // console.log(jQuery.type( response ));
          response.forEach(function(item){
            $('#' + menu_id).append($("<option></option>").attr("value", item).text(item));
          })
      },  //   success: function(
    });   //   $.ajax({
    // $('#' + menu_id).toggle();
    $('#' + menu_id).show();
  });   // $(".box").click(
});   //  $( document ).on
