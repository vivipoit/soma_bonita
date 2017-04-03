class Transfer < ApplicationRecord
  belongs_to :tour

  enum seat_type: {particular: 0, shared: 1}

  validates :name, presence: true
end
