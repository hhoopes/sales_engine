module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController
        respond_to :json

        def show
          total_revenue = {}
          if params[:date]
            total_revenue[:revenue] =
            price_formatted(Merchant.find(params[:id]).merchant_revenue_by_date(params[:date]))
          else
            total_revenue[:revenue] =
            price_formatted(Invoice.merchant_revenue(params[:merchant_id]))
          end
          respond_with total_revenue
        end

        def index
          total_revenue = {}
          total_revenue[:revenue] =
          Merchant.all_merchants_revenue_by_date(params[:date])
          respond_with total_revenue
        end
      end
    end
  end
end
