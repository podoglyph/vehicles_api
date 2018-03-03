FactoryBot.define do
  factory :option do
    name {Faker::RickAndMorty.location}
  end
end
