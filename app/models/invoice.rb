class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.merchant_revenue(merchant_id)
    (where(merchant_id: merchant_id )
    .joins(:invoice_items)
    .joins(:transactions).where("result = 'success'")
    .sum("quantity * unit_price")).to_s
  end

  def self.date_revenue(merchant_id, date)
    (where("invoices.created_at = ? AND merchant_id = ?", date, merchant_id)
    .joins(:invoice_items)
    .where(transactions: {result: "success"})
    .sum("quantity * unit_price")).to_s
  end

  def format(num)
    num.to_f / 100
  end
end
