class PostsController < ApplicationController
  # POST /posts
  def create
    request = CreatePostRequest.call(post_params: post_params, login: params[:login])
    json_response(request.result, :created)
  end

  private

  def post_params
    params.permit(:title, :description, :ip)
  end
end
