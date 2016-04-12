module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      respond_with model.all
    end

    def show
      respond_with model.find(params[:id])
    end

    def find
      param = params.to_a.first.first
      value = params.to_a.first.last.to_i

      respond_with model.find_by(param => value)
    end

    def find_all
      param = params.to_a.first.first
      value = params.to_a.first.last

      respond_with model.where(param => value)
    end

    def random
      respond_with model.order("RANDOM()").last
    end
  end
end
