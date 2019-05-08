FactoryBot.define do
  factory :rate do
    value { 1 }
    post { create (:post) }
  end
end
