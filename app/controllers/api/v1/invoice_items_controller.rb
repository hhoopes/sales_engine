module Api
  module V1
    class InvoiceItemsController < ApiController
      def model
        InvoiceItem
      end

      def model_params
        params.permit(:item_id, :invoice_id, :quantity, :unit_price, :id, :created_by, :updated_by)
      end
    end
  end
end
