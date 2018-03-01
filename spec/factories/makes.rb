require 'faker'

FactoryBot.define do
  factory :make do
    name {Faker::Vehicle.manufacture}
  end
end
