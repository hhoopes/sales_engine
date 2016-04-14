module Api
  module V1
    class TransactionsController < ApiController
      def model
        Transaction
      end

      def model_params
        params.permit(:invoice_id, :result, :credit_card_number, :id, :created_at, :updated_at)
      end
    end
  end
end
