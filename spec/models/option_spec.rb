require 'rails_helper'

describe Option, type: :model do

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cost) }
    it { should respond_to(:vehicle_id) }
    it { should respond_to(:model_id) }

  end

  describe "ActiveRecord associations" do
    it { should have_many(:vehicle_options) }
    it { should have_many(:vehicles).through(:vehicle_options) }
  end

end
