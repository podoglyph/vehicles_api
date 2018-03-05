class Option < ApplicationRecord
  validates_presence_of :name, :cost

  belongs_to :model, optional: true
  belongs_to :vehicle, optional: true

end
