module Api
  module V1
    module InvoiceItems
      class RandomController < ApiController
        def show
          respond_with InvoiceItem.order("RANDOM()").first
        end
      end
    end
  end
end
