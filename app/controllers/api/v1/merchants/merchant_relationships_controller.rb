module Api
  module V1
    module Merchants
      class MerchantRelationshipsController < ApiController
        before_action :find_merchant

        def invoices
          respond_with @merchant.invoices
        end

        def items
          respond_with @merchant.items
        end

        private
          def find_merchant
            @merchant = Merchant.find(params[:id])
          end
      end
    end
  end
end
