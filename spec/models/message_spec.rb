require 'rails_helper'

RSpec.describe Message, type: :model do

  it {should belong_to :connection}
  it {should belong_to :user}

end
