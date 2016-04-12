module Api
  module V1
    class CustomersController < ApiController
      respond_to :json

      def index
        respond_with Customer.all
      end

      def show
        respond_with Customer.find(params[:id])
      end

      def find
        param = params.to_a.first.first
        value = params.to_a.first.last.to_i
        respond_with Customer.find_by(param => value)
      end

      def find_all
        param = params.to_a.first.first
        value = params.to_a.first.last

        respond_with Customer.where(param => value)
      end

      def random
        respond_with Customer.order("RANDOM()").last
      end
    end
  end
end
