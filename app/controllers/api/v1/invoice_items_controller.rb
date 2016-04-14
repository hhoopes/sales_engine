module Api
  module V1
    class InvoiceItemsController < ApiController
      def model
        InvoiceItem
      end

      private
        def model_params
          convert_unit_price
          params.permit(:id, :name, :description, :quantity, :unit_price, :created_at, :updated_at, :item_id)
        end
    end
  end
end
