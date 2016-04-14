module Api
  module V1
    class ItemsController < ApiController
      def model
        Item
      end

      private
        def model_params
          convert_unit_price
          params.permit(:id, :name, :description, :unit_price, :created_by, :updated_by, :merchant_id)
        end
    end
  end
end
