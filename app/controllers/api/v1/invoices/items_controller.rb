module Api
  module V1
    module Invoices
      class ItemsController < ApiController
        before_action :find_invoice

        def index
          respond_with @invoice.items
        end

        private
          def find_invoice
            @invoice = Invoice.find(params[:invoice_id])
          end
      end
    end
  end
end
