class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :created_at, :updated_at, :unit_price, :item_id, :invoice_id

  def unit_price
    (object.unit_price.to_f/100).to_s
  end
end
