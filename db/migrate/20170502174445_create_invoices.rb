class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :merchant_id
      t.text :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
