module Api
  module V1
    module Invoices
      class InvoiceItemsController < ApiController
        before_action :find_invoice

        def index
          respond_with @invoice.invoice_items
        end

        private
          def find_invoice
            @invoice = Invoice.find(params[:invoice_id])
          end
      end
    end
  end
end
