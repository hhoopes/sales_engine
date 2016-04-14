module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController
        respond_to :json

        def show
          total_revenue = {}
          if params[:date]
            total_revenue[:revenue] =
            price_formatted(Invoice.date_revenue(params[:merchant_id], params[:date]))
          else
            total_revenue[:revenue] =
            price_formatted(Invoice.merchant_revenue(params[:merchant_id]))
          end
          respond_with total_revenue
        end
      end
    end
  end
end
