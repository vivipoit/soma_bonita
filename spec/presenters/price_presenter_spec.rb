require 'rails_helper'

describe PricePresenter do

  describe '#season_type' do

    it 'humanize value' do
      price = create(:price, season_type: :high_season)
      presenter = described_class.new(price)
      expect(presenter.season_type).to eq 'Alta Temporada'
    end
    
  end

end
