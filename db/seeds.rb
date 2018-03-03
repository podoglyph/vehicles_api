5.times do
  make = Make.create(name: Faker::Vehicle.unique.manufacture, country: Faker::HitchhikersGuideToTheGalaxy.planet )
  make.models.create(name: Faker::StarWars.unique.vehicle, year: "2017", color: "Purple")
end

10.times do
  Option.create(name: Faker::StarWars.unique.droid, cost: Faker::Number.number(5))
end
