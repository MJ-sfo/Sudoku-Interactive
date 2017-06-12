class WelcomeController < ApplicationController

    attr_reader :arr_81, :values, :integers
    def index
      string_starting_numbers = File.readlines("#{Rails.root}/config/sudoku_puzzles.txt")[0]
      @values = create_numbers(string_starting_numbers)[0..80]  # need [0..80] or adds 0 to end
      render('index')
      @integers = [1,2,3,4,5,6,7,8,9]
    end
    def arr_81
      @arr_81 =[]
      81.times {|i| @arr_81.push(i.to_s) }
      puts @arr_81
    end

    def options_for_status
      [
        ['1','2','3','4','5','6','7','8','9'],
        [1,2,3,4,5,6,7,8,9]
      ]
    end
    def options_for_seasons
      ['Spring', 'Summer', 'Autumn', 'Winter']
    end

end
