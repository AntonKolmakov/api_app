class RatesController < ApplicationController
  # POST /rates
  def create
    request = AddRateToPost.call(rate_params: rate_params)
    json_response(request.result, :created)
  end

  private

  def rate_params
    params.permit(:value, :post_id)
  end
end
