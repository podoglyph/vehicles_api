class Option < ApplicationRecord
  validates_presence_of :name, :cost
end
