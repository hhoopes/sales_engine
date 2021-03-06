module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApiController
        before_action :find_invoice_item

        def show
          respond_with @invoice_item.invoice
        end

        private
          def find_invoice_item
            @invoice_item = InvoiceItem.find(params[:invoice_item_id])
          end
      end
    end
  end
end
