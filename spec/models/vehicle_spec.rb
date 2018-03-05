require 'rails_helper'

describe Vehicle, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:model_id) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:model) }
    it { should have_many(:options) }
  end

end
