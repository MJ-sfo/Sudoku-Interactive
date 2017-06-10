class WelcomeController < ApplicationController
    def index
      string_starting_numbers = File.readlines("#{Rails.root}/config/sudoku_puzzles.txt")[0]
      @values = create_numbers(string_starting_numbers)
      render('index')

    end

end
