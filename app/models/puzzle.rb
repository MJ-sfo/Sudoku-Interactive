class Puzzle < ApplicationRecord
  has_many :attempts, dependent: :destroy
end
