require 'rails_helper'

RSpec.describe Rate, type: :model do
  it { should belong_to(:post) }
end
