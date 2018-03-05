require 'rails_helper'

describe "Vehicles API" do

  before(:each) do
    @make = create(:make)
    @model = @make.models.create(name: "Star Dust", year: "2018", color: "Blue", style: "sedan", base_price: 29999)
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

  it "can update an existing vehicle" do
    vehicle = create(:vehicle, model_id: @model.id)
    id = vehicle.id
    vehicle_name = vehicle.nickname

    put "/api/v1/vehicles/#{id}", params: {vehicle: {id: id, nickname: "Patty"}}

    new_vehicle = Vehicle.find(id)

    assert_response :success
    expect(response).to be_success
    expect(new_vehicle.nickname).to eq("Patty")
  end

  it "can delete an existing vehicle" do
    vehicles = create_list(:vehicle, 5, model_id: @model.id)

    expect(Vehicle.count).to eq(5)

    vehicle_one_id = vehicles.first.id

    delete "/api/v1/vehicles/#{vehicle_one_id}"

    assert_response :success
    expect(response).to be_success
    expect(Vehicle.count).to eq(4)
  end

end
