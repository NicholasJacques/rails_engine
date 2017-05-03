class AddInvoiceToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :invoice, foreign_key: :true, index: true
  end
end
