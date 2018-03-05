class Make < ApplicationRecord
  validates :name, :country, presence: true
  validates_uniqueness_of :name

  has_many :models
  has_many :vehicles, through: :models
end
