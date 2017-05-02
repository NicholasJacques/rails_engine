require 'csv'

class SeedOutput
  attr_reader :csv

  def initialize(file_path)
    @csv = CSV.open "#{file_path}", headers: true, header_converters: :symbol
  end

  def self.import_merchants(path)
    new(path).import_merchants
  end

  def self.import_transactions(path)
    new(path).import_transactions
  end

  def self.import_invoices(path)
    new(path).import_invoices
  end

  def self.import_items(path)
    new(path).import_items
  end

  def self.import_customers(path)
    new(path).import_customers
  end

  def self.import_invoice_items(path)
    new(path).import_invoice_items
  end

  def import_merchants
    csv.each do |merchant|
      Merchant.create!(name:       merchant[:name],
                       created_at: merchant[:created_at],
                       updated_at: merchant[:updated_at])
    end
  end

  def import_transactions
    csv.each do |transaction|
      Transaction.create!(invoice_id:                  transaction[:invoice_id],
                          credit_cart_number:          transaction[:credit_card_number],
                          credit_card_expiration_date: transaction[:credit_cart_expiration_date],
                          result:                      transaction[:result],
                          created_at:                  transaction[:created_at],
                          updated_at:                  transaction[:updated_at])

    end
  end

  def import_invoices
    csv.each do |invoice|
      Invoice.create!(customer_id: invoice[:customer_id],
                      merchant_id: invoice[:customer_id],
                      status:      invoice[:status],
                      created_at:  invoice[:created_at],
                      updated_at:  invoice[:updated_at])
    end
  end

  def import_items
    csv.each do |item|
      Item.create!(name:        item[:name],
                   description: item[:description],
                   unit_price:  item[:unit_price],
                   merchant_id: item[:merchant_id],
                   created_at:  item[:created_at],
                   updated_at:  item[:updated_at])
    end
  end

  def import_customers
    csv.each do |customer|
      Customer.create!(first_name: customer[:first_name],
                       last_name:  customer[:last_name],
                       created_at: customer[:created_at],
                       updated_at: customer[:updated_at])
    end
  end

  def import_invoice_items
    csv.each do |invoice_item|
      InvoiceItem.create!(item_id:    invoice_item[:item_id],
                          invoice_id: invoice_item[:invoice_id],
                          quantity:   invoice_item[:quantity],
                          unit_price: invoice_item[:unit_price],
                          created_at: invoice_item[:created_at],
                          updated_at: invoice_item[:updated_at])
    end
  end
end

namespace :seed do
  task :seed_all => :environment do
    SeedOutput.import_merchants('db/csv/merchants.csv')
    SeedOutput.import_transactions('db/csv/transactions.csv')
    SeedOutput.import_invoices('db/csv/invoices.csv')
    SeedOutput.import_items('db/csv/items.csv')
    SeedOutput.import_customers('db/csv/customers.csv')
    SeedOutput.import_invoice_items('db/csv/invoice_items.csv')
  end
end
