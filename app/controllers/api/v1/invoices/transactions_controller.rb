module Api
  module V1
    module Invoices
      class TransactionsController < ApiController
        before_action :find_invoice

        def index
          respond_with @invoice.transactions
        end

        private
          def find_invoice
            @invoice = Invoice.find(params[:invoice_id])
          end
      end
    end
  end
end
