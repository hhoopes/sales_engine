module Api
  module V1
    class InvoicesController < ApiController
      def model
        Invoice
      end

      def model_params
        params.permit(:customer_id, :merchant_id, :status, :created_at, :updated_at, :id)
      end
    end
  end
end
