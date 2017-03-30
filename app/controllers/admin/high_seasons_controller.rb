module Admin
  class HighSeasonsController < ApplicationController
    layout 'admin_application'
    before_action :authenticate_user!

    def index
      @high_seasons = HighSeason.all
    end

    def new
      @high_season = HighSeason.new
    end

    def create
      @high_season = HighSeason.new(high_season_params)
      if @high_season.save
        redirect_to admin_high_seasons_path
      else
        flash[:error] = "Não foi possível salvar a Alta Temporada."
        render :new
      end
    end

    private
    def high_season_params
      params.require(:high_season).permit(:name, :start_date, :end_date)
    end
  end
end
