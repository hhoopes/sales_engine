class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue_by_item(quantity)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total")
    .joins(:invoices)
    .joins(:transactions).where("result = 'success'")
    .order("total DESC")
    .group("items.id")
    .take(quantity)
  end

  def self.most_items_sold(quantity)
    select("items.*, sum(invoice_items.quantity) AS total")
    .joins(:invoices)
    .joins(:transactions).where("result = 'success'")
    .order("total DESC")
    .group("items.id")
    .take(quantity)
  end

  def self.best_day(item_id)
    result =
    select("invoices.created_at, sum(invoice_items.quantity) AS total")
    .joins(:invoices)
    .order("total DESC")
    .group("invoices.created_at")
    .where(id: item_id)
    .take(1)

    result.first[:created_at]
  end
end
