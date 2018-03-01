5.times do
  Make.create(name: Faker::Vehicle.unique.manufacture )
end
