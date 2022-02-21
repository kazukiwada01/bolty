class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string     :name,            null: false
      t.integer    :grade_id,        null: false
      t.integer    :holding,         null: false
      t.integer    :physical,        null: false
      t.integer    :move,            null: false
      t.integer    :positioning,     null: false
      t.integer    :footwork,        null: false
      t.integer    :coordination,    null: false
      t.references :admin,           null: false, foreign_key: true
      t.references :problem_list,    null: false, foreign_key: true
    end
  end
end
