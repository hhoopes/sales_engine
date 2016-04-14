module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController
        respond_to :json

        def show
          total_revenue = {}
          total_revenue[:revenue] = price_formatted(Merchant.find(params[:merchant_id]).total_revenue)
          respond_with total_revenue
        end
      end
    end
  end
end
