module Api
  module V1
    module Merchants
      class MostRevenueController < ApplicationController
        respond_to :json

        def index
          results = Merchant.top_merchants_by_revenue(params[:quantity])
          respond_with results
        end
      end
    end
  end
end
