module Api
  module V1
    module Invoices
      class MerchantsController < ApiController
        before_action :find_invoice

        def show
          respond_with @invoice.merchant
        end

        private
          def find_invoice
            @invoice = Invoice.find(params[:invoice_id])
          end
      end
    end
  end
end
