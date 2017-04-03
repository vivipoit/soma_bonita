class Tour < ApplicationRecord

  validates :name, :description, :category, :attraction, :duration, :distance, presence: true

  belongs_to :category

  has_many :prices
  has_many :transfers

end
