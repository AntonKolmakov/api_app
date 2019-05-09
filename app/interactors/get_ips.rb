class GetIps
  include Interactor

  def call
    context.result = Post
                         .select('posts.ip', 'users.login')
                         .joins(:user)
                         .distinct(:ip)
  end
end