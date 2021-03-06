class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.integer :unit_price
      t.integer :merchant_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
