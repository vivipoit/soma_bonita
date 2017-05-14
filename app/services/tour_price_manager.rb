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
    price_season = high_season? ? Price.high_season : Price.low_season
    price_season.where("start_date <= ?", date).where("end_date >= ?", date)
    .where(tour: tour).last  
  end
end
