class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string        :post_code,       null: false
      t.integer       :area_id,         null: false
      t.string        :municipalities,  null: false
      t.string        :street,          null: false
      t.string        :buildeing
      t.string        :phone,           null: false
      t.references    :purchase,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
