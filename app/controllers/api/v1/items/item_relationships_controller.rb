module Api
  module V1
    module Items
      class ItemRelationshipsController < ApiController
        before_action :find_item

        def invoice_items
          respond_with @item.invoice_items
        end

        def merchant
          respond_with @item.merchant
        end

        private
          def find_item
            @item = Item.find(params[:id])
          end
      end
    end
  end
end
