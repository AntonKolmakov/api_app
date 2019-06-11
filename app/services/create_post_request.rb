class CreatePostRequest
  def initialize(params, login)
  	@login = login
  	@params = params
  end 

  def call
  	user = User.find_or_create_by(login: @login, login: "unknown")
    user.posts.create!(@params)
  end
end