module Api
  module V1
    module Transactions
      class RandomController < ApiController
        def show
          respond_with Transaction.order("RANDOM()").first
        end
      end
    end
  end
end
