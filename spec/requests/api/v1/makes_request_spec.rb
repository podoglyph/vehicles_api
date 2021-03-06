require 'rails_helper'

describe "Makes API" do

  context "when performing standard CRUD functions" do
    
    it "sends a list of all vehicle makes" do
      makes = create_list(:make, 10)

      get "/api/v1/makes"

      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json.length).to eq(10)
    end

    it "sends a list of all vehicle makes that includes attributes" do
      makes = create_list(:make, 10)
      first_make_name = makes.first.name
      last_make_name = makes.last.name

      get "/api/v1/makes"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.first["name"]).to eq(first_make_name)
      expect(json.last["name"]).to eq(last_make_name)
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
      make_params = {name: "Tesla", country: "America"}

      post "/api/v1/makes", params: {make: make_params}

      make = Make.last

      assert_response :success
      expect(response).to be_success
      expect(make.name).to eq(make_params[:name])
    end

    it "can update an existing vehicle make" do
      make = create(:make)
      id = make.id
      make_name = make.name

      put "/api/v1/makes/#{id}", params: {make: {id: id, name: "Jelly Bean"}}

      new_make = Make.find(id)

      assert_response :success
      expect(response).to be_success
      expect(new_make.name).to eq("Jelly Bean")
    end

    it "can delete an existing vehicle make" do
      makes = create_list(:make, 5)

      expect(Make.count).to eq(5)

      make_one_id = makes[0].id

      delete "/api/v1/makes/#{make_one_id}"

      assert_response :success
      expect(response).to be_success
      expect(Make.count).to eq(4)
    end

  end
end
