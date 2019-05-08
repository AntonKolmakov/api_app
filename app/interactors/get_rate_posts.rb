class GetRatePosts
  include Interactor

  def call
    result = Post
                 .select('posts.title', 'posts.description', 'rates.value')
                 .joins(:rate)
                 .where('rates.value = ?', context.rate_params[:rate_value])

    context.result = result
  end
end
