require 'rails_helper'

describe "Options API" do

  it "sends a list of all vehicle options" do
    options = create_list(:option, 10)

    get "/api/v1/options"

    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it "sends a list of all vehicle options that includes attributes" do
    options = create_list(:option, 10)
    first_option_name = options.first.name
    last_option_name = options.last.name

    get "/api/v1/options"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.first["name"]).to eq(first_option_name)
    expect(json.last["name"]).to eq(last_option_name)
  end

  it "can return a single option" do
    option = create(:option)
    id = option.id

    get "/api/v1/options/#{id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["id"]).to eq(id)
  end

  it "can create a new option" do
    option_params = {name: "Leather seats"}

    post "/api/v1/options", params: {option: option_params}

    option = Option.last

    assert_response :success
    expect(response).to be_success
    expect(option.name).to eq(option_params[:name])
  end

  it "can update an existing option" do
    option = create(:option)
    id = option.id
    option_name = option.name

    put "/api/v1/options/#{id}", params: {option: {id: id, name: "Rearview mirror"}}

    new_option = Option.find(id)

    assert_response :success
    expect(response).to be_success
    expect(new_option.name).to eq("Rearview mirror")
  end

  it "can delete an existing option" do
    options = create_list(:option, 5)

    expect(Option.count).to eq(5)

    option_one_id = options.first.id

    delete "/api/v1/options/#{option_one_id}"

    assert_response :success
    expect(response).to be_success
    expect(Option.count).to eq(4)
  end

end
