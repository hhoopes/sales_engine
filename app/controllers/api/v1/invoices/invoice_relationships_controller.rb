module Api
  module V1
    module Invoices
      class InvoiceRelationshipsController < ApiController
        before_action :find_invoice

        def transactions
          respond_with @invoice.transactions
        end

        def invoice_items
          respond_with @invoice.invoice_items
        end

        def items
          respond_with @invoice.items
        end

        def customer
          respond_with @invoice.customer
        end

        def merchant
          respond_with @invoice.merchant
        end

        private
          def find_invoice
            @invoice = Invoice.find(params[:id])
          end
      end
    end
  end
end
