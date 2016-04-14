class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.top_merchants_by_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total")
    .joins(:invoice_items)
    .order("total DESC")
    .group("merchants.id")
    .take(quantity)
  end

  def self.top_merchants_by_items(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS total")
    .joins(:invoice_items)
    .joins(:transactions).where("result = 'success'")
    .order("total DESC")
    .group("merchants.id")
    .take(quantity)
  end

  def revenue_by_date(date)

  end

  def favorite_customer
    all =
    customers
    .group("customers.id")
    .joins(:transactions).where("result = 'success'")
    .order("transactions.count DESC")
    all.first
  end

  def self.all_merchants_revenue_by_date(date)
    result =
    select("sum(invoice_items.quantity * invoice_items.unit_price) AS total")
    .joins(:invoice_items)
    .where(invoice: {created_at: date})
    result
  end
end
