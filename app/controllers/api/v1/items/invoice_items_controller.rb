module Api
  module V1
    module Items
      class InvoiceItemsController < ApiController
        before_action :find_item

        def index
          respond_with @item.invoice_items
        end

        private
          def find_item
            @item = Item.find(params[:item_id])
          end
      end
    end
  end
end
