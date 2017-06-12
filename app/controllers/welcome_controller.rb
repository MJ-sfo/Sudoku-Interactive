class WelcomeController < ApplicationController

    attr_reader :arr_81
    def index
      string_starting_numbers = File.readlines("#{Rails.root}/config/sudoku_puzzles.txt")[0]
      @values = create_numbers(string_starting_numbers)
      render('index')

    end
    def arr_81
      @arr_81 =[]
      81.times {|i| @arr_81.push(i.to_s) }
      puts @arr_81
    end

end
