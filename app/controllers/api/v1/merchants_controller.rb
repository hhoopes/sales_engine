module Api
  module V1
    class MerchantsController < ApiController
      def model
        Merchant
      end

      def model_params
        params.permit(:name, :id, :created_by, :updated_by)
      end
    end
  end
end
