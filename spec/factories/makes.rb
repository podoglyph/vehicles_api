require 'faker'

FactoryBot.define do
  factory :make do
    name {Faker::Vehicle.unique.manufacture}
  end
end
