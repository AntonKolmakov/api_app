class GetRatePosts
  def initialize(params)
  	@rate_params = params
  end

  def call
    result = Post
                 .select('posts.title', 'posts.description', 'rates.value')
                 .joins(:rate)
                 .where('rates.value = ?', @rate_params[:rate_value])
  end
end