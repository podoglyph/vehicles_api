require 'csv'

csv_text = File.read('db/vehicles.csv')
csv = CSV.parse(csv_text, :headers => true)

manufacturers = {
  Ford: "America",
  Chevrolet: "America",
  Subaru: "Japan",
  Honda: "Japan",
  Toyota: "Japan",
  Mercedes: "Germany",
  BMW: "Germany",
  Volkswagen: "Germany",
  Audi: "Germany",
  Tesla: "America"
}

manufacturers.each do |m|
  make = Make.create!(name: m[0], country: m[1])
  csv.each do |row|
    if row["make"] == make.name
      make.models.create!(name: row["name"], year: row["year"], color: row["color"], base_price: row["base_price"], style: row["type"])
    end
  end
end

options = ["AM/FM Stereo", "Bluetooth Wireless", "Premium Sound", "OnStar", "Air Conditioning", "Power Windows", "Power Door Locks", "Power Seats", "Leather", "Backup Camera", "Dual Air Bags", "Heated Seats", "Heated Mirrors", "Premium Wheels", "Privacy Glass"]

options.each do |o|
  Option.create!(name: o, cost: Faker::Number.number(3).to_i)
end

models = Model.all

models.each do |m|
  3.times do |v|
    m.vehicles.create!(nickname: Faker::DrWho.character, mileage: Faker::Number.number(5).to_i)
  end
end
