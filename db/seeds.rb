5.times do
  make = Make.create(name: Faker::Vehicle.unique.manufacture )
  make.models.create(name: Faker::StarWars.unique.vehicle)
end

10.times do
  Option.create(name: Faker::StarWars.unique.droid)
end
