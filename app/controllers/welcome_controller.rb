class WelcomeController < ApplicationController

    attr_reader :values
    def index
      string_starting_numbers = File.readlines("#{Rails.root}/config/sudoku_puzzles.txt")[0]
      @values = create_numbers(string_starting_numbers)[0..80]  # need [0..80] or adds 0 to end
      render('index')
      @integers = [1,2,3,4,5,6,7,8,9]
      # @cell_numb_arr = string_starting_numbers
    end

    def find_choices
      interger_arr = params[:arr].map {|i| i.to_i if i >= "1" && i<= "9"}
      results_to_return = possible_numbers(interger_arr,params[:index].to_i)
      # respond_to do |format|
      #   format.html
      #   format.json {render json: results_to_return}
      # end
      # respond_with results_to_return
      render json: results_to_return
    end

    def possible_numbers(arr, index)
      row = find_row(index)
      col = col_find(index, row)
      row_arr = arr_nmbrs(arr, row)
      col_arr = col_nmbrs(arr, col)
      sq_arr = sq_possible_numbs(arr, row, col)
      arr_add_choices = row_arr + col_arr + sq_arr
      #  chooses numbers NOT in col, row, sq
      arr_final_choices = [1,2,3,4,5,6,7,8,9] - arr_add_choices
    end
    def sq_possible_numbs(arr, row, col)
      new_arr = []
      square = 0
      if row < 4
        square = 1 if (col < 4)
        square = 2 if (col >3 ) && (col < 7)
        square = 3 if (col > 6)
      elsif row > 3 && row < 7
        square = 4 if (col < 4)
        square = 5 if (col > 3 ) && (col < 7)
        square = 6 if (col > 6)
      elsif row > 6
        square = 7 if (col < 4)
        square = 8 if (col > 3 ) && (col < 7)
        square = 9 if (col > 6)
      end

      new_arr = (arr[0..2] + arr[9..11] + arr[18..20]) if square == 1
      new_arr = (arr[3..5] + arr[12..14] + arr[21..23]) if square == 2
      new_arr = (arr[6..8] + arr[15..17] + arr[24..26]) if square == 3

      new_arr = (arr[27..29] + arr[36..38] + arr[45..47]) if square == 4
      new_arr = (arr[30..32] + arr[39..41] + arr[48..50]) if square == 5
      new_arr = (arr[33..35] + arr[42..44] + arr[51..53]) if square == 6

      new_arr = (arr[54..56] + arr[63..65] + arr[72..74]) if square == 7
      new_arr = (arr[57..59] + arr[66..68] + arr[75..77]) if square == 8
      new_arr = (arr[60..62] + arr[69..71] + arr[78..80]) if square == 9

      new_arr.delete_if {|x| x == "-" or  x == '\"-\"'}
      new_arr
    end

    def find_row(index)
      row = ((index) / 9) +1
    end
    def col_find(index, row)
      multiple = (index +1)/9
      col = (index+1) - (9 * (row-1))
    end
    def arr_nmbrs(arr, row)
      new_arr = []
      start = ((row-1)*9)
      for i in start..(start+8)
        if arr[i] != "-"
          new_arr << arr[i]
        end
      end
      new_arr
    end
    def col_nmbrs(arr, col)
      new_arr=[]
      9.times do |i|
        # i goes 0-8
        if arr[(i*9) + col-1] != "-"
          new_arr << arr[(i*9) + col-1]
        end
      end
      new_arr
    end


end
