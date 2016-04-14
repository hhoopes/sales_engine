class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def price_formatted(cents)
    (cents.to_f/100).to_s
  end

  # def parse_dates
  #   date_params = [:created_at, :updated_at, :date]
  #   date_params.each do | param |
  #     params[param] = Date.parse(params[param]) if params[param]
  #   end
  # end
end
