require 'rails_helper'

describe "Makes API" do

  it "sends a list of all vehicle makes" do
    cars = create_list(:make, 10)

    get "/api/v1/makes"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it "sends a list of all vehicle makes that includes attributes" do
    cars = create_list(:make, 10)
    first_car_name = cars[0].name
    last_car_name = cars[9].name

    get "/api/v1/makes"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json[0]['name']).to eq(first_car_name)
    expect(json[9]['name']).to eq(last_car_name)
  end

  it "can return a single vehicle make" do
    car = create(:make)
    id = car.id

    get "/api/v1/makes/#{id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["id"]).to eq(id)
  end

  # xit "can create a new vehicle make" do
  #
  # end
  #
  # xit "can update an existing vehicle make" do
  #
  # end
  #
  # xit "can delete an existing vehicle make" do
  #
  # end

end
