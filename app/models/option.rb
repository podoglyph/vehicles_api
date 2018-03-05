class Option < ApplicationRecord
  validates_presence_of :name, :cost

  has_many :vehicle_options
  has_many :vehicles, through: :vehicle_options

end
