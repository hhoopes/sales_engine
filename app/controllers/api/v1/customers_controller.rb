module Api
  module V1
    class CustomersController < ApiController
      def model
        Customer
      end

      def model_params
        params.permit(:first_name, :last_name, :id, :created_by, :updated_by)
      end
    end
  end
end
