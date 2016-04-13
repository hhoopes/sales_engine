module Api
  module V1
    module Customers
      class TransactionsController < ApiController
        before_action :find_customer

        def index
          respond_with @customer.transactions
        end

        private
          def find_customer
            @customer = Customer.find(params[:customer_id])
          end
      end
    end
  end
end
