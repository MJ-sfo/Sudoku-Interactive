# Sudoku-Interactive
Web users can play a random game of sudoku at:  https://polar-scrubland-63019.herokuapp.com/

Sudoku is a simple game where user ties to fill a nine-by-nine board, with each row, column, and each 3x3 squares without repeating an integer

This is a full-stack app, with JQuery frontend, ruby 2.4.0 on Rails 5.1.1 server with a PostgreSQL database storing different versions of initial games and results of different attempts to solve the puzzle

To restart on Heroku, need to run
heroku run rake db:seed
before running
heroku open

In process of creating this app, discovered that game apps are usually done in node.js, because most of the algorithms are done on the front end - that is, rarely needing to communicate with server.  I created a hybrid-app with JQuery frontend collecting and distributing data, creating the initial board, pub making ajax calls to ruby functions in the rails controller file to perform calculations. The controller also communicates directly with DB.

code I am proud of:
from app/assets/javascripts/application.js
```$.ajax({
  url: "/welcome/find_choices",
  type: 'GET',
  data: {
    arr: arr_store_cell_numbs,
    index: index
  },
  success: function(response) {
  ```

this ajax call both sends information to a ruby function, and then retrieves response from ruby function from controller
app/controllers/welcome_controller.rb
```
def find_choices
  interger_arr = params[:arr].map {|i| i.to_i if i >= "1" && i<= "9"}
  results_to_return = possible_numbers(interger_arr,params[:index].to_i)
  render json: results_to_return
end  
```
This ruby function parses the incoming data, sends information to second function possible_numbers, and returns result to JQuery

Future Features:
- For rare case of user solving puzzle, app needs to recognise a win and congratulate user, and save win data to DB
- allow user to change choise on each cell
- highlight different cells - cells pre filled, and completed rows/columns/3x3 boxes
- user to choose different level of difficulty
- more style, such as animation
- hide word "choose" once cell shows menu
