module Api
  module V1
    module Items
      class MostItemsController < ApplicationController
        respond_to :json

        def show
      
          results = Item.most_items_sold(params[:quantity])
          respond_with results
        end
      end
    end
  end
end
