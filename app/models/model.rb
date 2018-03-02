class Model < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  belongs_to :make
  
end
