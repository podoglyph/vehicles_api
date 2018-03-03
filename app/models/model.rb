class Model < ApplicationRecord
  validates :name, :year, :color, presence: true
  validates_uniqueness_of :name

  belongs_to :make

end
