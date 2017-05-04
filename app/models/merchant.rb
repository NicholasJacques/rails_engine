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

  def self.revenue_by_date(date)
      # select('invoices.*, sum(invoice_items.quantity * invoice_items.unit_price)')
    joins(:invoice_items)
      .merge(Invoice.select_date(date))
      .merge(InvoiceItem.success)
      .sum('quantity * unit_price')
      # .where({invoice_item: { invoice: { created_at: date } })

    # associated with all invoices on a specific date
    # sum of subtotals for all invoiceitems
    # that are associated with a successful transaction
    # across all merchants

    # joins(:invoice_items)
    # .merge(InvoiceItem.success)
    # .group(:id)

    # .limit(date)
  end

  def self.most_items(quantity)
    joins(:invoice_items)
      .merge(InvoiceItem.success)
      .group(:id)
      .order('sum(invoice_items.quantity) DESC')
      .limit(quantity)
  end
end
