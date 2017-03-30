class Budget < ApplicationRecord
  validates :start_date, :end_date, :tour_name, :quantity_adults,
    :quantity_children, :quantity_babies, presence: true
end
