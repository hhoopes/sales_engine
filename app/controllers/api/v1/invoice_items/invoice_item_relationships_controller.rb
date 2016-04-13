module Api
  module V1
    module InvoiceItems
      class InvoiceItemRelationshipsController < ApiController
        before_action :find_invoice_item

        def invoice
          respond_with @invoice_item.invoice
        end

        def item
          respond_with @invoice_item.item
        end

        private
          def find_invoice_item
            @invoice_item = InvoiceItem.find(params[:id])
          end
      end
    end
  end
end
