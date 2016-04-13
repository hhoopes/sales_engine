module Api
  module V1
    module Transactions
      class InvoicesController < ApiController
        before_action :find_transaction

        def show
          respond_with @transaction.invoice
        end

        private
          def find_transaction
            @transaction = Transaction.find(params[:transaction_id])
          end
      end
    end
  end
end
