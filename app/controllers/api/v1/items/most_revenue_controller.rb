module Api
  module V1
    module Items
      class MostRevenueController < ApplicationController
        respond_to :json

        def show
          results = Item.most_revenue_by_item(params[:quantity])
          respond_with results
        end
      end
    end
  end
end
