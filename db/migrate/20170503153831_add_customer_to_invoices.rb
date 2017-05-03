class AddCustomerToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :customer, foreign_key: :true, index: true
  end
end