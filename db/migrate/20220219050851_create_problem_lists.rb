class CreateProblemLists < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_lists do |t|
      t.string     :name,         null: false
      t.references :admin,        null: false, foreign_key: true
      t.references :gym,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
