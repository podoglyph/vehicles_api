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

    expect(json.first["name"]).to eq("Helen")
    expect(json.first["make_id"]).to eq(id)

    expect(json.last["name"]).to eq("Achilles")
    expect(json.last["make_id"]).to eq(id)

  end

  it "can create a model for a given make" do
    make = create(:make)
    id = make.id
    model_params = {name: "Zeus"}

    post "/api/v1/makes/#{id}/models", params: {model: model_params}

    model = make.models.last

    assert_response :success
    expect(response).to be_success
    expect(model.name).to eq(model_params[:name])
  end

  xit "can update a model for a given make" do

  end

  xit "can delete a model from a given make" do

  end


end
