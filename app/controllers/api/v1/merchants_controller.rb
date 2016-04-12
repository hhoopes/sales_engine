module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json

      def model
        Merchant
      end
    end
  end
end
