class RemovePuzzleIdFromAttempt < ActiveRecord::Migration[5.1]
  def change
    remove_column :attempts, :puzzle_id, :bigint
  end
end
