module Api
  module V1
    class ItemsController < ApiController
      def model
        Item
      end

      private
        def model_params
          convert_unit_price
          params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
        end
    end
  end
end
