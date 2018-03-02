class Make < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :models
end
