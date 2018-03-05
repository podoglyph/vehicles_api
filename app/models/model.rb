class Model < ApplicationRecord
  validates :name, :year, :color, presence: true

  belongs_to :make
  has_many :options
  has_many :vehicles
end
