require 'csv'

namespace :import do
  desc "Import merchant model from csv"
    task merchants: :environment do
      CSV.foreach("data/merchants.csv", headers: true) do |row|
        Merchant.create(row.to_h)
    end
  end

  desc "Import customer model from csv"
    task customers: :environment do
      CSV.foreach("data/customers.csv", headers: true) do |row|
        Customer.create(row.to_h)
    end
  end

  desc "Import item model from csv"
    task items: :environment do
      CSV.foreach("data/items.csv", headers: true) do |row|
        Item.create(row.to_h)
    end
  end

  desc "Import invoice model from csv"
    task invoices: :environment do
      CSV.foreach("data/invoices.csv", headers: true) do |row|
        Invoice.create(row.to_h)
    end
  end

  desc "Import transaction model from csv"
    task transactions: :environment do
      CSV.foreach("data/transactions.csv", headers: true) do |row|
        Transaction.create(
          invoice_id: row["invoice_id"],
          credit_card_number: row["credit_card_number"],
          result: row["result"],
          created_at: row["created_at"],
          updated_at: row["updated_at"]      
        )
    end
  end

  desc "Import invoice_item model from csv"
    task invoice_items: :environment do
      CSV.foreach("data/invoice_items.csv", headers: true) do |row|
        InvoiceItem.create(row.to_h)
    end
  end

  task all: [:merchants, :customers, :items, :invoices, :transactions, :invoice_items]

  desc "Import everything"
  task :import => 'import:all'

end
