class ToursController < ApplicationController
  def show
    @tour = Tour.find(params[:id])
    @prices = @tour.prices.where("end_date >= ?",Date.today).order("start_date ASC")
  end
end
