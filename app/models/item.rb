class Item < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :invoice_item
  has_many :invoices, through: :invoice_item
end
