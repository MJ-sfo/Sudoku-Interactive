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

  // pulling DB info from rails to index page to here:
  var arr_store_cell_numbs = JSON.parse($( "#numbs_arr").text());
  // console.log("arr_store_cell_numbs is a: " + jQuery.type( arr_store_cell_numbs ));
  var playing_level = Number(JSON.parse($( "#level_id").text()));
  // console.log("playing_level is a: " + jQuery.type( playing_level ));
  var puzzle_id = Number(JSON.parse($( "#puzzle").text()));
    // console.log(puzzle_id);
    // console.log(jQuery.type( puzzle_id ));

  // info will need to send to db:
  var count = 0;
  var did_i_win = false;

  $('.box').one("click", function(event) {
    // var newText = $(this).text().replace("/def/g", "");
    // $(this).text(newText);
    var id = event.target.id;
    index = Number(id.substring(5));
    // console.log(jQuery.type( index ))
    var menu_id = 'menu_' + parseInt(index)
    // console.log('menu = ' + menu_id);
    $.ajax({
      url: "/welcome/find_choices",
      type: 'GET',
      data: {
        arr: arr_store_cell_numbs,
        // arr: JSON.parse($( "#numbs_arr").text()),
        index: index
      },
      success: function(response) {
        // if nothing in array (response) , game over
        if (response.length < 1) {
          $.ajax({
            url: "/welcome/game_end_stats",
            type: 'POST',
            data: {
              win: did_i_win,
              choices: count,
              puzzle_id: puzzle_id
            },
          });  //  $.ajax({
          window.alert("Sorry, end of possibilities.  Game over after" + parseInt(count) + " tries.");
        }  //  if (response.length
        else {
          response.forEach(function(item){
            $('#' + menu_id).append($("<option></option>").attr("value", item).text(item));
          })   //  response.forEach
        }
      },  //   success: function(
    });   //   $.ajax({
    // $('#' + menu_id).toggle();

    // finished ajax call, but stil within box-one-click
    $('#' + menu_id).show();
    $(function() {
        $('#' + menu_id).change(function(resp) {
            var choice = $( "#" + menu_id + " option:selected" ).text();
            console.log('menue has changed with ' + choice);
            // $('#' + numbs_arr)[index] = choice;

            arr_store_cell_numbs[index] = Number(choice);
            // console.log(arr_store_cell_numbs);
            count = count +1;
            console.log("count is now: " + parseInt(count));
            // var arr_make_tbl = $('#numbs_arr')[0].innerHTML;
            // var add_to_arr = JSON.parse(  arr_make_tbl)
            // add_to_arr[index] = Number(choice);
            // console.log(add_to_arr);
            // console.log(jQuery.type( add_to_arr ));
            // arr_make_tbl = add_to_arr;
            // console.log(arr_make_tbl);
            // console.log(jQuery.type( arr_make_tbl ));
        });  //  $('#' + menu_id).change
      //  $(this).unbind('click');
    });   //  $(function()
  });   // $(".box").click(
});   //  $( document ).on
