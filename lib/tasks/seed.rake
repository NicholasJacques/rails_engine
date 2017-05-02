require 'csv'

class SeedOutput
  attr_reader :csv

  def initialize(file_path)
    @csv = CSV.open "#{file_path}", headers: true, header_converters: :symbol
  end

  def self.import_merchants(path='db/csv/merchants.csv')
    new(path).import_merchants
  end

  def self.import_transactions(path)
    new(path).import_transactions
  end

  def self.import_invoices(path)
    new(path).import_invoices
  end

  def import_merchants
    csv.each do |merchant|
      new_merchant = Merchant.new(name:       merchant[:name],
                                  created_at: merchant[:created_at],
                                  updated_at: merchant[:updated_at])
      if new_merchant.save
        puts '.'
      else
        'Failed to create a merchant'
      end
    end
  end

  def import_transactions
    csv.each do |transaction|
      new_transaction = Transaction.new(invoice_id:                  transaction[:invoice_id],
                                        credit_cart_number:          transaction[:credit_card_number],
                                        credit_card_expiration_date: transaction[:credit_cart_expiration_date],
                                        result:                      transaction[:result],
                                        created_at:                  transaction[:created_at],
                                        updated_at:                  transaction[:updated_at])

      if new_transaction.save
        puts '.'
      else
        puts 'Failed to create a transaction'
      end
    end
  end

  def import_invoices
    csv.each do |invoice|
      new_invoice = Invoice.new(customer_id: invoice[:customer_id],
                                merchant_id: invoice[:customer_id],
                                status:      invoice[:status],
                                created_at:  invoice[:created_at],
                                updated_at:  invoice[:updated_at])
      if new_invoice.save
        puts '.'
      else
        puts 'Fails to create an invoice'
      end
    end
  end
end

namespace :seed do
  task :seed_all => :environment do
    SeedOutput.import_merchants('db/csv/merchants.csv')
    SeedOutput.import_transactions('db/csv/transactions.csv')
    SeedOutput.import_invoices('db/csv/invoices.csv')
  end
end
