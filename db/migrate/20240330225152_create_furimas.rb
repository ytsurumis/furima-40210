class CreateFurimas < ActiveRecord::Migration[7.0]
  def change
    create_table :furimas do |t|
      t.string :title,                  null: false
      t.text :description,              null: false
      t.integer :category_id,           null: false
      t.integer :condition_id,          null: false
      t.integer :burden_id,             null: false
      t.integer :area_id,               null: false
      t.integer :number_of_day_id,      null: false
      t.integer :price,                 null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
