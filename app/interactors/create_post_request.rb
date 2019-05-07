class CreatePostRequest
  include Interactor

  def call
    user = User.create(login: context.login, login: "Smith")
    result = user.posts.create!(context.post_params)
    context.result = result
  end
end

