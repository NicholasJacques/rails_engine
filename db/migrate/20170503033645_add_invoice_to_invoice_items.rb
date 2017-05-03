class AddInvoiceToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_items, :invoice, foreign_key: :true, index: true
  end
end
