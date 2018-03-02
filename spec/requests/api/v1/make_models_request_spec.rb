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

  it "can update a model for a given make" do
    make = create(:make)
    make_id = make.id
    model = make.models.create(name: "Pinto")
    model_id = model.id
    model_name = model.name

    put "/api/v1/makes/#{make_id}/models/#{model_id}", params: {model: {id: model_id, name: "Jelly Bean"}}

    new_model = Model.find(model_id)

    assert_response :success
    expect(response).to be_success
    expect(new_model.name).to eq("Jelly Bean")
  end

  it "can delete a model from a given make" do
    make = create(:make)
    make_id = make.id
    model_one = make.models.create(name: "Pinto Bean")
    model_two = make.models.create(name: "Jelly Bean")

    expect(Model.count).to eq(2)

    model_one_id = model_one.id
    model_two_id = model_two.id

    delete "/api/v1/makes/#{make_id}/models/#{model_one_id}"

    assert_response :success
    expect(response).to be_success
    expect(Model.count).to eq(1)
  end

end
