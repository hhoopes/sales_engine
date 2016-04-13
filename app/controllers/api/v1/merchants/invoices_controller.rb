module Api
  module V1
    module Merchants
      class InvoicesController < ApiController
        before_action :find_merchant

        def index
          respond_with @merchant.invoices
        end

        private
          def find_merchant
            @merchant = Merchant.find(params[:merchant_id])
          end
      end
    end
  end
end
