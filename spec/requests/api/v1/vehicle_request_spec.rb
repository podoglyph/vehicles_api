require 'rails_helper'

describe "Vehicles API" do

  before(:each) do
    @make = create(:make)
    @model = @make.models.create(name: "Star Dust", year: "2018", color: "Blue")
  end

  it "sends a list of all vehicles" do
    vehicles = create_list(:vehicle, 10, model_id: @model.id)

    get "/api/v1/vehicles"

    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it "can return a single vehicle" do
    vehicle = create(:vehicle, model_id: @model.id)
    id = vehicle.id

    get "/api/v1/vehicles/#{id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["id"]).to eq(id)
  end

  it "can create a new vehicle" do
    vehicle_params = {nickname: "Cool Car", model_id: @model.id}

    post "/api/v1/vehicles", params: {vehicle: vehicle_params}

    vehicle = Vehicle.last

    assert_response :success
    expect(response).to be_success
    expect(vehicle.model_id).to eq(vehicle_params[:model_id])
  end

end
