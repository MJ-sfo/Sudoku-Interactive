class AddPuzzleRefToAttempts < ActiveRecord::Migration[5.1]
  def change
    add_reference :attempts, :puzzle, foreign_key: true
  end
end
