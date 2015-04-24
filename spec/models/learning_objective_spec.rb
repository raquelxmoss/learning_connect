require 'rails_helper'

RSpec.describe LearningObjective, type: :model do

  it {should belong_to :course}

end
