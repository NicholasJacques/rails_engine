class ChangeColumnCreditCartNumberInTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :credit_cart_number, :credit_card_number
  end
end
