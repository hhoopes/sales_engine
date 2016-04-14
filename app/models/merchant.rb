class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def total_revenue
    if invoices.empty?
      0
    else
      invoice_items.sum(:unit_price)
    end
  end
end
