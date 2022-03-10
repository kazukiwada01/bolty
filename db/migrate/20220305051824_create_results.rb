class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.string     :climb,           null: false
      t.integer    :holding,         null: false
      t.integer    :physical,        null: false
      t.integer    :move,            null: false
      t.integer    :positioning,     null: false
      t.integer    :footwork,        null: false
      t.integer    :coordination,    null: false
      t.references :user ,           null: false, foreign_key: true
      t.references :gym,             null: false, foreign_key: true
      t.references :problem,         null: false, foreign_key: true
    end
  end
end
