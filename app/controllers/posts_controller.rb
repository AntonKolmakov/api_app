class PostsController < ApplicationController
  # POST /posts
  def create
    request = CreatePostRequest.new(post_params, params[:login]).call
    json_response(request, :created)
  end

  private

  def post_params
    params.permit(:title, :description, :ip)
  end
end
