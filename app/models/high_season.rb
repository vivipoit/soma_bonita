class HighSeason < ApplicationRecord

  validates :name,:start_date,:end_date, presence: true

  validate :end_date_must_be_later_than_start_date

  def end_date_must_be_later_than_start_date
    if end_date && start_date && end_date < start_date
      errors.add(:end_date, ' Período inválido.')
    end
  end

end
