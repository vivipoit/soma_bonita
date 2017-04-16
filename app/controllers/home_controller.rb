class HomeController < ApplicationController

  def index
    @interest_tours = Tour.all
  end

  def filter_period
    @interest_tours = Tour.all
    if params[:filter_from].present? || params[:filter_to].present?
      @start_date = Date.parse(params[:filter_from])
      @end_date = Date.parse(params[:filter_to])
    else
      @start_date = Date.today
      @end_date = @start_date

    end
    @date_range = @start_date.step(@end_date, 1)
    prices_in_period = Price.where("start_date <= ? AND end_date >= ?", @start_date, @end_date)
    tours_id = prices_in_period.pluck(:tour_id).uniq
    tours_id = tours_id & params[:tour_ids].map(&:to_i) if params[:tour_ids].present?
    @tours = Tour.where(id: tours_id)
    render 'index'
  end
end
