class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_customer(id)
    Customer.find(id.to_i).merchants.joins(:transactions)
    .merge(Transaction.success)
    .group("merchants.id")
    .order("count(transactions.result) DESC")
    .take
  end
end
