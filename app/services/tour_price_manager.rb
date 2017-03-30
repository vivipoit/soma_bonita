class TourPriceManager

  attr_reader :tour, :date

  def initialize tour, date
    @tour = tour
    @date = date
  end

  def high_season?
    HighSeason.where("start_date <= ?", date).where("end_date >= ?", date).any?
  end

  def tour_price_with_season
    season_type = high_season? ? 1 : 0  # low_season: 0, high_season: 1
    tour.prices.where("start_date <= ? AND end_date >= ? AND season_type = ?", date, date, season_type).last
  end


end
