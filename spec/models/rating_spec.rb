require 'rails_helper'

RSpec.describe Rating, type: :model do

  it {should belong_to :course}
  it {should validate_inclusion_of(:rating).in_range(1..5)}
end
