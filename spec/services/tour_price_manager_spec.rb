require 'rails_helper'

RSpec.describe TourPriceManager do
  before do
    @tour = create(:tour)

    create(:high_season, name: 'Férias Escolares', start_date: Date.today - 2.months,
           end_date: Date.yesterday)

    create(:high_season, name: 'Carnaval', start_date: Date.tomorrow,
           end_date: Date.today + 2.weeks)
  end

  describe "#high_season?" do
    context "date is before the high season" do
      it "is not high_season" do
        tour_price_manager = TourPriceManager.new(@tour, Date.today)
        expect(tour_price_manager).to_not be_high_season
      end
    end

    context "date is after the high season" do
      it "is not high_season" do
        tour_price_manager = TourPriceManager.new(@tour, Date.today + 1.month)
        expect(tour_price_manager).to_not be_high_season
      end
    end

    context "date is between start_date and end_date" do
      it "is high_season" do
        tour_price_manager = TourPriceManager.new(@tour, Date.tomorrow)
        expect(tour_price_manager).to be_high_season
      end
    end
  end

  describe "#tour_price_with_season" do
    before do
      @high_season_price = create(:price, tour: @tour,
                                  start_date: Date.today - 2.days,
                                  end_date: Date.yesterday,
                                  season_type: Price.season_types[:high_season])

      @low_season_price =  create(:price, tour: @tour,
                                  start_date: Date.today,
                                  end_date: Date.tomorrow,
                                  season_type: Price.season_types[:low_season])

    end

    context "date is before range of dates in price" do
      it "not found prices" do
        tour_price_manager = TourPriceManager.new(@tour, Date.tomorrow + 1.month)
        expect(tour_price_manager.tour_price_with_season).to be_nil
      end
    end

    context "date is after range of dates in price" do
      it "not found prices" do
        tour_price_manager = TourPriceManager.new(@tour, Date.today - 1.month)
        expect(tour_price_manager.tour_price_with_season).to be_nil
      end
    end

    context "date is between start_date and end_date of the price" do
      it "price is found" do
        tour_price_manager = TourPriceManager.new(@tour, Date.yesterday)
        expect(tour_price_manager.tour_price_with_season).to be_instance_of(Price)
      end

      it "price is high season" do
        tour_price_manager = TourPriceManager.new(@tour, Date.yesterday)
        expect(tour_price_manager.tour_price_with_season).to eq(@high_season_price)
      end

      it "price is low season" do
        tour_price_manager = TourPriceManager.new(@tour, Date.today)
        expect(tour_price_manager.tour_price_with_season).to eq(@low_season_price)
      end
    end
  end
end
