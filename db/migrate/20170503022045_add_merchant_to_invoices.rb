class AddMerchantToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :merchant, foreign_key: :true, index: true
  end
end
