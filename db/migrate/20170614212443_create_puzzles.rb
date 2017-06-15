class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.string :puzzle
      t.integer :level

      t.timestamps
    end
  end
end
