class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionView::Helpers::SanitizeHelper

  p "from ActionController !!!"



  def create_numbers(string)
    test_arr   = string.split("")
    test_arr.map! do |index|
      if index != "-"
        index = index.to_i
      else
        index = "-"
      end    # if index
    end   # test_arr.map! do
    test_arr
  end
end
