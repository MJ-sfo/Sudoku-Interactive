class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.integer :choices
      t.boolean :win
      t.belongs_to :puzzle

      t.timestamps
    end
  end
end
