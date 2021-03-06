class RatesController < ApplicationController
  # POST /rates
  def create
    request = AddRateToPost.new(rate_params).call
    json_response(request, :created)
  end

  # GET rates/get_rate_posts
  def get_rate_posts
    request = GetRatePosts.new(rate_params).call
    json_response(request, :created)
  end

  # GET rates/get_ips
  def get_ips
    request = GetIps.call
    json_response(request, :created)
  end

  private

  def rate_params
    params.permit(:value, :post_id, :rate_value)
  end
end
