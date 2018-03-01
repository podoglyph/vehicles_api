require 'rails_helper'

describe "Makes API" do

  it "can return a list of all vehicle makes" do
    car = create(:make)

    expect(car).to_not be_empty
  end

  xit "can create a new vehicle make" do

  end

  xit "can update an existing vehicle make" do

  end

  xit "can delete an existing vehicle make" do

  end

end
