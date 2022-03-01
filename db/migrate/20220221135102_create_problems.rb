class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string     :name,            null: false
      t.integer    :grade_id,        null: false
      t.float      :holding,         null: false
      t.float      :physical,        null: false
      t.float      :move,            null: false
      t.float      :positioning,     null: false
      t.float      :footwork,        null: false
      t.float      :coordination,    null: false
      t.references :admin,           null: false, foreign_key: true
      t.references :problem_list,    null: false, foreign_key: true
    end
  end
end
