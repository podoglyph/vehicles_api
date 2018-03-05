require 'rails_helper'

describe Model, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:make_id) }
    it { should validate_presence_of(:style) }
    it { should validate_presence_of(:base_price) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:make)}
    it { should have_many(:options) }
    it { should have_many(:vehicles) }
  end

end
