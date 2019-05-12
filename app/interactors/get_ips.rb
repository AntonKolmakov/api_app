class GetIps
  include Interactor

  def call
    find_ips
    context.result = find_duplicates(find_ips)
  end

  protected

  def find_ips
    arr = Post.select('posts.ip', 'users.login').joins(:user).map { |c| [c.ip.to_s, c.login] }
  end

  def find_duplicates(arr)
    ips = {}
    arr.each do |element|
      if ips.has_key?(element[0])
        ips[element[0]] << ",#{element[1]}"
      else
        ips[element[0]] = element[1]
      end
    end
    ips
  end
end