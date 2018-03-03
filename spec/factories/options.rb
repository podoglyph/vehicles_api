FactoryBot.define do
  factory :option do
    name {Faker::RickAndMorty.location}
    cost {Faker::Number.number(5)}
  end
end
