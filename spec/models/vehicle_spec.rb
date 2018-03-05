require 'rails_helper'

describe Vehicle, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:model_id) }
    it { should respond_to(:mileage) }
    it { should respond_to(:condition) }
    it { should respond_to(:pre_owned) }
    it { should respond_to(:price) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:model) }
    it { should have_many(:vehicle_options) }
    it { should have_many(:options).through(:vehicle_options) }
  end

end
