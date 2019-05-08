class Post < ApplicationRecord
  belongs_to :user
  has_one :rate
  validates :title, :description, presence: true
end
