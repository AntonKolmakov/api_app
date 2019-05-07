class PostsController < ApplicationController
  # POST /posts
  def create
    post = CreatePostRequest.call(post_params: post_params, login: params[:login])
    json_response(post.result, :created)
  end

  private

  def post_params
    params.permit(:title, :description)
  end
end
