require 'rails_helper'

describe Model, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name)}
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:make)}
  end
  
end
