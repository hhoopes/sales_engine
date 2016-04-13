module Api
  module V1
    module Transactions
      class TransactionRelationshipsController < ApiController
        before_action :find_transaction

        def invoice
          respond_with @transaction.invoice
        end

        private
          def find_transaction
            @transaction = Transaction.find(params[:id])
          end
      end
    end
  end
end
