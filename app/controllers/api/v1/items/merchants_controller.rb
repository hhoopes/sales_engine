module Api
  module V1
    module Items
      class MerchantsController < ApiController
        before_action :find_item

        def show
          respond_with @item.merchant
        end

        private
          def find_item
            @item = Item.find(params[:item_id])
          end
      end
    end
  end
end
