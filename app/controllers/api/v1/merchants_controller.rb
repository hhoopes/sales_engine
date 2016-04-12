module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json, :xml

      def index
        respond_with Merchant.all
      end

      def show
        respond_with Merchant.find(params[:id])
      end

      def find
        param = params.to_a.first.first
        value = params.to_a.first.last.to_i

        respond_with Merchant.find_by(param => value)
      end

      def find_all
        param = params.to_a.first.first
        value = params.to_a.first.last

        respond_with Merchant.where(param => value)
      end
    end
  end
end
