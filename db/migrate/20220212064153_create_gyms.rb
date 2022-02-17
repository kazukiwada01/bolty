class CreateGyms < ActiveRecord::Migration[6.0]
  def change
    create_table :gyms do |t|
      t.string     :name,               null: false
      t.integer    :prefecture_id,      null: false
      t.string     :city_name,          null: false
      t.string     :street,             null: false
      t.string     :building_name
      t.text       :gym_url,            null: false
      t.references :admin,              null: false, foreign_key: true
    end
  end
end
