class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def render_read
    p "this is render_read in models"
  end
end
