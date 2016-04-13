module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      if params.empty?
        respond_with model.all
      else
        respond_with model.where(model_params)
      end
    end

    def show
      respond_with model.find_by(model_params)
    end
  end
end
