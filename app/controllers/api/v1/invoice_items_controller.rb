module Api
  module V1
    class InvoiceItemsController < ApiController
      def model
        InvoiceItem
      end

      def model_params
        params.permit(:item_id, :invoice_id, :quantity, :unit_price, :id, :created_by, :updated_by)
      end

      private
        def model_params
          convert_unit_price
          params.permit(:id, :name, :description, :unit_price, :created_by, :updated_by, :merchant_id)
        end
    end
  end
end
