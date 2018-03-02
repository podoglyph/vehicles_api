require 'rails_helper'

describe "Make Models API" do

  it "sends a list of all models with a given make" do
    make = create(:make)
    id = make.id
    make.models.create(name: "Helen")
    make.models.create(name: "Achilles")

    get "/api/v1/makes/#{id}/models"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(2)
  end

  xit "can create a model for a given make" do

  end

  xit "can update a model for a given make" do

  end

  xit "can delete a model from a given make" do

  end


end
