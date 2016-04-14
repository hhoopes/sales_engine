module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApplicationController
        respond_to :json

        def show
          results = Merchant.find(params[:merchant_id]).favorite_customer
          respond_with results
        end
      end
    end
  end
end
