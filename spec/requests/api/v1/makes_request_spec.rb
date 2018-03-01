require 'rails_helper'

describe "Makes API" do

  it "sends a list of all vehicle makes" do
    makes = create_list(:make, 10)

    get "/api/v1/makes"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it "sends a list of all vehicle makes that includes attributes" do
    makes = create_list(:make, 10)
    first_make_name = makes[0].name
    last_make_name = makes[9].name

    get "/api/v1/makes"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json[0]['name']).to eq(first_make_name)
    expect(json[9]['name']).to eq(last_make_name)
  end

  it "can return a single vehicle make" do
    make = create(:make)
    id = make.id

    get "/api/v1/makes/#{id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["id"]).to eq(id)
  end

  it "can create a new make" do
    make_params = {name: "Tesla"}

    post "/api/v1/makes", params: {make: make_params}

    make = Make.last

    assert_response :success
    expect(response).to be_success
    expect(make.name).to eq(make_params[:name])
  end

  # xit "can update an existing vehicle make" do
  #
  # end
  #
  # xit "can delete an existing vehicle make" do
  #
  # end

end
