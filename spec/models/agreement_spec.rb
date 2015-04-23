require 'rails_helper'

RSpec.describe Agreement, type: :model do

  it { should belong_to :connection }
  it { should belong_to :course  }

end
