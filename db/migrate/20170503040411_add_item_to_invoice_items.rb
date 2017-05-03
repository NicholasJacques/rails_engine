class AddItemToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_items, :item, foreign_key: :true, index: true
  end
end
