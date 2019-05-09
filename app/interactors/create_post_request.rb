class CreatePostRequest
  include Interactor

  def call
    user = User.find_or_create_by(login: context.login, login: "unknown")
    result = user.posts.create!(context.post_params)
    context.result = result
  end
end

