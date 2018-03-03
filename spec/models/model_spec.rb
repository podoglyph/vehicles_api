require 'rails_helper'

describe Model, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:year) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:make)}
  end

end
