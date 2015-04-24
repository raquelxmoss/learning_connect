require 'rails_helper'

RSpec.describe User, type: :model do

  it {should have_many :initializer_connections}
  it {should have_many :receiver_connections}
  it {should have_many :initializers}
  it {should have_many :receivers}


end
