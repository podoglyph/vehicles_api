require 'faker'

FactoryBot.define do
  factory :make do
    name {Faker::Vehicle.unique.manufacture}
    country {Faker::HitchhikersGuideToTheGalaxy.planet}
  end
end
