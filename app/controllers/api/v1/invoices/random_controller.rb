module Api
  module V1
    module Invoices
      class RandomController < ApiController
        def show
          respond_with Invoice.order("RANDOM()").first
        end
      end
    end
  end
end
