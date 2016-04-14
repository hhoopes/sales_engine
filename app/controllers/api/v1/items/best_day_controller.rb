module Api
  module V1
    module Items
      class BestDayController < ApplicationController
        respond_to :json

        def show
          results = {}
          results[:best_day] = Item.best_day(params[:item_id])
          respond_with results
        end
      end
    end
  end
end
