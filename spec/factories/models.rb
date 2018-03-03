FactoryBot.define do
  factory :model do
    name {Faker::StarWars.unique.vehicle}
    year  %w[2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017].sample
    color %w[green, red, blue, yellow, orange, black, white, gray, lavender, purple].sample
  end
end
