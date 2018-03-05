require 'faker'

FactoryBot.define do
  factory :make do
    sequence(:name) { |n| "Car Maker #{n}"}
    country {Faker::HitchhikersGuideToTheGalaxy.planet}
  end
end
