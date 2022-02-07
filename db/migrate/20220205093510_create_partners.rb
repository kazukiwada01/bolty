class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :company,            null: false
      t.string :email,              null: false
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.string :phone_number,       null: false
      t.text   :message,            null: false
    end
  end
end
