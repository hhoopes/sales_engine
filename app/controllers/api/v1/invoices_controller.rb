module Api
  module V1
    class InvoicesController < ApiController
      def model
        Invoice
      end

      def model_params
        params.permit(:customer_id, :merchant_id, :status, :created_by, :updated_by, :id)
      end
    end
  end
end
