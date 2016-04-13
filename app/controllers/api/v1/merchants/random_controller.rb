module Api
  module V1
    module Merchants
      class RandomController < ApiController
        def show
          respond_with Merchant.order("RANDOM()").first
        end
      end
    end
  end
end
