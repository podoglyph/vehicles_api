require 'rails_helper'

describe "Vehicles API" do

  context "when performing standard CRUD functions" do

    before(:each) do
      @make = create(:make, name: "Tesla")
      @model = @make.models.create(name: "Star Dust", year: "2018", color: "Blue", style: "sedan", base_price: 29999)
    end

    it "sends a list of all vehicles" do
      vehicles = create_list(:vehicle, 10)

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
      vehicles = create_list(:vehicle, 3, model_id: @model.id)

      expect(Vehicle.count).to eq(3)

      vehicle_one_id = vehicles.first.id

      delete "/api/v1/vehicles/#{vehicle_one_id}"

      assert_response :success
      expect(response).to be_success
      expect(Vehicle.count).to eq(2)
    end
  end

  context "when performing custom API queries" do

    makes = %w(Ford Chevrolet Tesla BMW Mercedes Honda Toyota Subaru Volkwagen Audi Jeep)

    years = %w(1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018)


    before(:all) do
      makes.each do |m|
        make = create(:make, name: m)
        3.times do |i|
          model = create(:model, make_id: make.id)
        end
      end

    end

    it "sends a list of 3 most expensive vehicles" do
      v1 = create(:vehicle, price: 999999)
      v2 = create(:vehicle, price: 999998)
      v3 = create(:vehicle, price: 999997)
      v4 = create(:vehicle, price: 9999)
      v5 = create(:vehicle, price: 9998)

      get "/api/v1/vehicles/most_expensive"

      json = JSON.parse(response.body)

      expect(json.length).to eq(3)

      expect(json.first["id"]).to eq(v1.id)
      expect(json.first["nickname"]).to eq(v1.nickname)
      expect(json[1]["id"]).to eq(v2.id)
      expect(json[1]["nickname"]).to eq(v2.nickname)
      expect(json.last["id"]).to eq(v3.id)
      expect(json.last["nickname"]).to eq(v3.nickname)
    end

    it "sends a list of 3 vehicles with lowest mileage" do
      v1 = create(:vehicle, mileage: 1)
      v2 = create(:vehicle, mileage: 2)
      v3 = create(:vehicle, mileage: 3)
      v4 = create(:vehicle, mileage: 555)
      v5 = create(:vehicle, mileage: 5555)

      get "/api/v1/vehicles/least_mileage"

      json = JSON.parse(response.body)

      expect(json.length).to eq(3)

      expect(json.first["id"]).to eq(v1.id)
      expect(json.first["nickname"]).to eq(v1.nickname)
      expect(json[1]["id"]).to eq(v2.id)
      expect(json[1]["nickname"]).to eq(v2.nickname)
      expect(json.last["id"]).to eq(v3.id)
      expect(json.last["nickname"]).to eq(v3.nickname)
    end

    it "sends a list of vehicles by selected color" do
      m1 = create(:model, color: "green")
      m2 = create(:model, color: "blue")
      m3 = create(:model, color: "purple")
      m4 = create(:model, color: "yellow")
      m5 = create(:model, color: "green")

      v1 = m1.vehicles.create(nickname: "Patsy")
      v2 = m2.vehicles.create(nickname: "Bob")
      v3 = m3.vehicles.create(nickname: "Alice")
      v4 = m4.vehicles.create(nickname: "Stark")
      v5 = m5.vehicles.create(nickname: "Luba")

      get "/api/v1/vehicles/color?color=green"

      json = JSON.parse(response.body)

      expect(json.length).to eq(2)

      expect(json.first[0]["id"]).to eq(v1.id)
      expect(json.first[0]["nickname"]).to eq(v1.nickname)
      expect(json.last[0]["id"]).to eq(v5.id)
      expect(json.last[0]["nickname"]).to eq(v5.nickname)
    end

  end


end
