class AddRateToPost
  def initialize(params)
    @rate_params = params
    @params_value = @rate_params[:value]
    @post ||= Rate.find_by(post_id: @rate_params[:post_id])
  end

  def call
    if rate_exist?
      value = @post.value
      @post.update(value: ((@params_value).to_i. + value))
      avarage_of_post
    else
      result = Rate.create!(value: (@params_value).to_i,
                   post_id: @rate_params[:post_id])
    end
  end

private

  def rate_exist?
    @post.present?
  end

  def avarage_of_post
    @post.value = @post.value/2
    @post
  end
end