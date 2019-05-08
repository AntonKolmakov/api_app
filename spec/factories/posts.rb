FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
    ip { Faker::Internet.ip_v4_address }
    user { create(:user) }

    after :create do |post|
      create :rate, post: post, value: 10
    end
  end
end