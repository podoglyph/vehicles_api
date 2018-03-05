class Vehicle < ApplicationRecord
  validates_presence_of :nickname, :model_id

  belongs_to :model
  has_many :vehicle_options
  has_many :options, through: :vehicle_options

  enum condition: [:fair, :good, :very_good, :excellent]

  def self.most_expensive
    Vehicle.order("price DESC").limit(3)
  end

  def self.least_mileage
    Vehicle.order("mileage ASC").limit(3)
  end

  def self.color(color)
    models = Model.where(color: color.downcase)
    models.map do |m|
      m.vehicles
    end
  end

  def self.option(option)
    Vehicle.joins(:options).where(options: { name: option })
  end

end
