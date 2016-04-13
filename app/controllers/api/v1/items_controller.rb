module Api
  module V1
    class ItemsController < ApiController
      def model
        Item
      end

      def model_params
        params.permit(:id, :name, :description, :unit_price, :created_by, :updated_by, :merchant_id)
      end
    end
  end
end
