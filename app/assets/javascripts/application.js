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

  $('.box').one("click", function(event) {
    var id = event.target.id;
    index = Number(id.substring(5));
    console.log('id = ' + id + ", and index is: " + index)
    // console.log(jQuery.type( index ))
    var menu_id = 'menu_' + parseInt(index)
    console.log('menu = ' + menu_id);
    $.ajax({
      url: "/welcome/find_choices",
      type: 'GET',
      data: {
        arr: JSON.parse($( "#numbs_arr").text()),
        index: index
      },
      success: function(response) {
          response.forEach(function(item){
            $('#' + menu_id).append($("<option></option>").attr("value", item).text(item));
          })
      },  //   success: function(
    });   //   $.ajax({
    // $('#' + menu_id).toggle();
    $('#' + menu_id).show();
    $(function() {
        $('#' + menu_id).change(function(resp) {
            console.log('menue has changed with');
            var choice = $( "#" + menu_id + " option:selected" ).text();
            console.log(choice);
            // $('#' + numbs_arr)[index] = choice;
            var dave = JSON.parse( $('#numbs_arr')[0].innerHTML )
            dave[index] = Number(choice);
            console.log(dave);
            console.log(jQuery.type( dave ));
        });
    });
  });   // $(".box").click(
});   //  $( document ).on
