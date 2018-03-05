class Model < ApplicationRecord
  validates :name, :year, :color, :make_id, :style, :base_price, presence: true

  belongs_to :make
  has_many :options
  has_many :vehicles
end
