FactoryBot.define do
  factory :vehicle do
    sequence(:nickname) { |n| "Cool Car #{n}" }
    sequence(:mileage) { |n| n * 3000 }
    condition [0, 1, 2, 3].sample
    pre_owned [false, true].sample
    price {Faker::Number::number(5)}
    model
  end
end
