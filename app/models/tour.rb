class Tour < ApplicationRecord

  validates :name, :description, :category, :attraction, :duration, :distance, :minimum_age, presence: true
  validates :minimum_age, inclusion: { in: 0..18, message: 'A Idade Mínima tem que estar entre 0 e 18'  }

  belongs_to :category

  has_many :prices
  has_many :transfers

end
