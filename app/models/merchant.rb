class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(quantity)
    joins(:invoice_items)
      .merge(InvoiceItem.success)
      .group(:id)
      .order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
      .limit(quantity)
  end
end
