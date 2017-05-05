class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_items(quantity)
    Item.joins(invoice_items: :transactions)
    .merge(Transaction.success).group(:id)
    .order('sum(invoice_items.quantity) DESC')
    .limit(quantity)
  end
end
