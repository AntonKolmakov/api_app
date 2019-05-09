require 'faker'

100.times do
  user = User.create(login: "#{Faker::Name.name}")
  2000.times do
    post = Post.create(title: "#{Faker::Hipster.sentence}",
                       description: "#{Faker::Hipster.paragraph}",
                       ip: Faker::Internet.public_ip_v4_address,
                       user_id: user.id)
    5.times do
      Rate.create(value: rand(1..5), post_id: post.id)
    end
  end
end