class AddRateToPost
  def initialize(params)
    @rate_params = params
    @params_value = @rate_params[:value]
  end

  def call
    if rate_exist?
      value = @post.value
      result = Rate.update(value: ((@params_value).to_i.+(value)/2),
                   post_id: @rate_params[:post_id])
    else
      result = Rate.create!(value: (@params_value).to_i/2,
                   post_id: @rate_params[:post_id])
    end
    result
  end

private

  def rate_exist?
    @post ||= Rate.find_by(post_id: @rate_params[:post_id])
  end
end