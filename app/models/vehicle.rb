class Vehicle < ApplicationRecord
  validates_presence_of :nickname, :model_id

  belongs_to :model
  has_many :options

  enum condition: [:fair, :good, :very_good, :excellent]
end
