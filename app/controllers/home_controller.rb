class HomeController < ApplicationController

  def index
  end

  def filter_period

    if params[:filter_from].present? || params[:filter_to].present?
      @start_date = Date.parse(params[:filter_from])
      @end_date = Date.parse(params[:filter_to])
    else
      @start_date = Date.today
      @end_date = @start_date
      
    end
    @date_range = @start_date.step(@end_date, 1)
    prices_in_period = Price.where("start_date <= ? AND end_date >= ?", @start_date, @end_date)
    tours_id = prices_in_period.pluck(:tour_id)
    @tours = Tour.where(id: tours_id)
    render 'index'
  end

end
