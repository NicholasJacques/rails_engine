require 'csv'

class SeedOutput

  def self.open_file(file_path)
    CSV.open "#{file_path}", headers: true, header_converters: :symbol 
  end

  def self.parse_merchants(merchants)
    merchants.each do |merchant|
      new_merchant = Merchant.new(name: merchant[:name],
                      created_at: merchant[:created_at],
                      updated_at: merchant[:updated_at])
      if new_merchant.save 
        puts "Successfully created merchant #{new_merchant.name}"
      else
        "Failed to create a merchant"
      end
    end
  end
end

namespace :seed do
  task :seed_all => :environment do 
    merchants = SeedOutput.open_file('db/csv/merchants.csv')
    SeedOutput.parse_merchants(merchants)
  end
end
