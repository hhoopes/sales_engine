module Api
  module V1
    module Items
      class RandomController < ApiController
        def show
          respond_with Item.order("RANDOM()").first
        end
      end
    end
  end
end
