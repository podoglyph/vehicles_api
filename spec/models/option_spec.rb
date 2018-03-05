require 'rails_helper'

describe Option, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cost) }
  end

end
