FactoryBot.define do
  factory :model do
    name {Faker::StarWars.unique.vehicle}
  end
end
