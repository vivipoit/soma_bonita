class Price < ApplicationRecord
  belongs_to :tour

  enum season_type: { low_season: 0, high_season: 1 }

  validates :season_type, :tour, :start_date, :end_date, :adult_price,
            :child_price, :baby_price, presence: true

  validate :end_date_must_be_later_than_start_date

  def end_date_must_be_later_than_start_date
    if end_date && start_date && end_date < start_date
      errors.add(:end_date, 'Preço com Vigência Inválida')
    end
  end
end
